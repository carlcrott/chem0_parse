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
