# http://rjb.rubyforge.org/

# The controller
class StrainsController < ApplicationController

  # GET /strains/1
  # GET /strains/1.json
  # GET /strains/1.sbol
  def show
    @strain = Strain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @strain }
      format.sbol do 
        send_data(@strain.to_sbol, 
                  :filename => @strain.filename,
                  :disposition => 'inline', # or 'attachment'
                  :type => 'application/xml')
      end
    end
  end

end


# The data model
class Strain < ActiveRecord::Base

  belongs_to :organism
  belongs_to :plasmid, :class_name => 'Part'
  belongs_to :project
  has_many :performances
  has_many :replicates

  def to_sbol

    jars = ["#{Rails.root}/java/libSBOLcore.jar",
            "#{Rails.root}/java/libSBOLxml.jar"]
    
    Rjb::load(jars.join(':'))

    sURI = Rjb::import('java.net.URI')
    sParser = Rjb::import('org.sbolstandard.xml.Parser')
    sUtilURI = Rjb::import('org.sbolstandard.xml.UtilURI')
    sCollection = Rjb::import('org.sbolstandard.xml.CollectionImpl')
    sDnaComponent = Rjb::import('org.sbolstandard.xml.DnaComponentImpl')
    sDnaSequence = Rjb::import('org.sbolstandard.xml.DnaSequenceImpl')
    sSequenceAnnotation = Rjb::import('org.sbolstandard.xml.SequenceAnnotationImpl')

    uri = sUtilURI.Create("http://biofab.jbei.org/fake_collection")
    collection = sCollection.new(uri, "fake_collection", "A fake collection", "There is no reason for this.")
    uri = sUtilURI.Create("http://biofab.jbei.org/data/strains/#{id}")
    strain_component = sDnaComponent.new(uri, biofab_id, "Strain #{biofab_id}", "")
    dna_sequence = sDnaSequence.new(uri, sequence)
    strain_component.setSequence(dna_sequence)

    uri = sUtilURI.Create("http://biofab.jbei.org/data/EOUs/#{id}")
    annot = sSequenceAnnotation.new(uri)
    annot.setStrand("+")
    annot.setBioStart(plasmid.eou_insertion_point)
    annot.setBioEnd(plasmid.eou_insertion_point + plasmid.eou.sequence)
    eou_component = sDnaComponent.new(uri, eou.biofab_id, "EOU #{eou.biofab_id}", "")
    annot.setSubComponent(eou_component)

    strain_component.addAnnotation(annot)
    collection.addComponent(strain_component)

    parser = sParser.new
    parser.serialize(collection)

  end

end
