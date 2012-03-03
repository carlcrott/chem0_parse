require "#{Rails.root}/lib/api.rb" # wtf is with /app/lib .. isnt it supposed to load by default?
require 'open-uri'

class ChemoinformaticsController < ApplicationController
  # GET /chemoinformatics
  # GET /chemoinformatics.xml
  def index
    @chemoinformatics = Chemoinformatic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chemoinformatics }
    end
  end

  # GET /chemoinformatics/1
  # GET /chemoinformatics/1.xml
  def show
    @chemoinformatic = Chemoinformatic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chemoinformatic }
    end
  end

  # GET /chemoinformatics/new
  # GET /chemoinformatics/new.xml
  def new
    @chemoinformatic = Chemoinformatic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chemoinformatic }
    end
  end

  # GET /chemoinformatics/1/edit
  def edit
    @chemoinformatic = Chemoinformatic.find(params[:id])
  end

  # POST /chemoinformatics
  # POST /chemoinformatics.xml
  def create
    @chemoinformatic = Chemoinformatic.new(params[:chemoinformatic])

    # populate the API request here
    # might need to do some crazy sanitization here ... as these could be nutso
    @push = Api.new
    # uri.encode it?
    process = "To a solution of 3-bromobenzophenone (1.00 g, 4 mmol) in MeOH (15 mL) was added sodium borohydride (0.3 mL, 8 mmol) portionwise at rt and the suspension was stirred at rt for 1-24 h. The reaction was diluted slowly with water and extracted with CH2Cl2. The organic layer was washed successively with water, brine, dried over Na2SO4, and concentrated to give the title compound as oil (0.8 g, 79%), which was used in the next reaction without further purification. MS (ESI, pos. ion) m/z: 247.1 (M-OH)."

    # encodes it into URL format ... pass that shit in the URL
    # header is also another option
    puts URI::encode(process)

    respond_to do |format|
      if @chemoinformatic.save
        # insert push w nokogiri here


        format.html { redirect_to(@chemoinformatic, :notice => 'Chemoinformatic was successfully created.') }
        format.xml  { render :xml => @chemoinformatic, :status => :created, :location => @chemoinformatic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chemoinformatic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chemoinformatics/1
  # PUT /chemoinformatics/1.xml
  def update
    @chemoinformatic = Chemoinformatic.find(params[:id])

    respond_to do |format|
      if @chemoinformatic.update_attributes(params[:chemoinformatic])
        format.html { redirect_to(@chemoinformatic, :notice => 'Chemoinformatic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chemoinformatic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chemoinformatics/1
  # DELETE /chemoinformatics/1.xml
  def destroy
    @chemoinformatic = Chemoinformatic.find(params[:id])
    @chemoinformatic.destroy

    respond_to do |format|
      format.html { redirect_to(chemoinformatics_url) }
      format.xml  { head :ok }
    end
  end
end
