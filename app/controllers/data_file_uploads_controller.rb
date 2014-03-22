class DataFileUploadsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_data_file_upload, only: [:show, :edit, :update, :destroy]

  # GET /data_file_uploads
  # GET /data_file_uploads.json
  def index
    @data_file_uploads = DataFileUpload.all
  end

  # GET /data_file_uploads/1
  # GET /data_file_uploads/1.json
  def show
  end

  # GET /data_file_uploads/new
  def new
    @data_file_upload = DataFileUpload.new
  end

  # GET /data_file_uploads/1/edit
  def edit
  end

  # POST /data_file_uploads
  # POST /data_file_uploads.json
  def create
    @data_file_upload = DataFileUpload.new(data_file_upload_params)

    respond_to do |format|
      if @data_file_upload.save

        # do it!
        TabFileProcessingService.new(@data_file_upload).process

        format.html { redirect_to @data_file_upload, notice: 'Data file upload was successfully created.' }
        format.json { render action: 'show', status: :created, location: @data_file_upload }
      else
        format.html { render action: 'new' }
        format.json { render json: @data_file_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_file_uploads/1
  # PATCH/PUT /data_file_uploads/1.json
  def update
    respond_to do |format|
      if @data_file_upload.update(data_file_upload_params)
        format.html { redirect_to @data_file_upload, notice: 'Data file upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @data_file_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_file_uploads/1
  # DELETE /data_file_uploads/1.json
  def destroy
    @data_file_upload.destroy
    respond_to do |format|
      format.html { redirect_to data_file_uploads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_file_upload
      @data_file_upload = DataFileUpload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_file_upload_params
      params.require(:data_file_upload).permit(:note,:data_file)
    end
end
