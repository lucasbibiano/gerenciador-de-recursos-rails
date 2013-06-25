class ObjectResourcesController < ApplicationController
  # GET /object_resources
  # GET /object_resources.json
  def index
    @object_resources = ObjectResource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @object_resources }
    end
  end

  # GET /object_resources/1
  # GET /object_resources/1.json
  def show
    @object_resource = ObjectResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @object_resource }
    end
  end

  # GET /object_resources/new
  # GET /object_resources/new.json
  def new
    @object_resource = ObjectResource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @object_resource }
    end
  end

  # GET /object_resources/1/edit
  def edit
    @object_resource = ObjectResource.find(params[:id])
  end

  # POST /object_resources
  # POST /object_resources.json
  def create
    @object_resource = ObjectResource.new(params[:object_resource])

    respond_to do |format|
      if @object_resource.save
        format.html { redirect_to @object_resource, notice: 'Object resource was successfully created.' }
        format.json { render json: @object_resource, status: :created, location: @object_resource }
      else
        format.html { render action: "new" }
        format.json { render json: @object_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /object_resources/1
  # PUT /object_resources/1.json
  def update
    @object_resource = ObjectResource.find(params[:id])

    respond_to do |format|
      if @object_resource.update_attributes(params[:object_resource])
        format.html { redirect_to @object_resource, notice: 'Object resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @object_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /object_resources/1
  # DELETE /object_resources/1.json
  def destroy
    @object_resource = ObjectResource.find(params[:id])
    @object_resource.destroy

    respond_to do |format|
      format.html { redirect_to object_resources_url }
      format.json { head :no_content }
    end
  end
end
