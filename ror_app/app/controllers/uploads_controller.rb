#Controller for model Uploadss
class UploadsController < ApplicationController
  # GET /uploads
  # GET /uploads.json
  #invoke to show index and fetch params if there is (search,group,id)
  def index
    if(params[:search]!="")
      @uploads = Upload.search(params[:search])
    end
    
    if(params[:group]!=nil)
      @uploads = Upload.searchForGroup(params[:group])
    end

    if(params[:id]!=nil)
      @uploads = Upload.searchForOwned(params[:id])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  #invoke to show an individual upload
  def show
    @upload = Upload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  #invoke to instanciate an upload and fectch the param id to put to new upload's owner
  def new
    @upload = Upload.new

    if(params[:id]!=nil)
      @upload.ownerId=params[:id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/1/edit
  #invoke to edit an upload with parameters fetch from the formular
  def edit
    @upload = Upload.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.json
  #invoke to create an upload with parameters fetch from the formular, ensure that the upload's name isn't null if it is it put the original file name instead, it also put as default share group the owner type
  def create
    @upload = Upload.new(params[:upload])
    if(@upload.name=="")
			@upload.name=@upload.content.original_filename
		end

    if(@upload.uploadGroup=="")
      @upload.uploadGroup=(User.findById(@upload.ownerId)).userType
    end

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render json: @upload, status: :created, location: @upload }
        @users = User.findByGroup(@upload.uploadGroup)
        UploadMailer.notification_email(@users, @upload).deliver
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  #invoke to update an upload with parameters fetch from the formular
  def update
    @upload = Upload.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  #invoke to destroy an upload with parameters fetch from the formular
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end

  # GET /uploads
  # GET /uploads.json
  def download
		@upload = Upload.find(params[:id])
    	send_file @upload.content.path

  end
end
