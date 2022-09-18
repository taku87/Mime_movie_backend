class UsersVideosController < ApplicationController
  before_action :set_users_video, only: %i[ show edit update destroy ]

  # GET /users_videos or /users_videos.json
  def index
    @users_videos = UsersVideo.all
  end

  # GET /users_videos/1 or /users_videos/1.json
  def show
  end

  # GET /users_videos/new
  def new
    @users_video = UsersVideo.new
  end

  # GET /users_videos/1/edit
  def edit
  end

  # POST /users_videos or /users_videos.json
  def create
    @users_video = UsersVideo.new(users_video_params)
    #テスト用に手作業でカラム情報を追加。本来は、入力時にパラメータに情報入るように実装予定
    @users_video.content_number = 100
    @users_video.user_id = 1
    #当初、rails上でmp4への変換処理を想定したが、MediaConvertで変換が可能なことがわかったため、削除予定
    #@users_video.transcoded_video_url = VideoEditingWorker.user_video_to_mp4(@users_video)
    
    respond_to do |format|
      if @users_video.save
        upload
        format.html { redirect_to users_video_url(@users_video), notice: "UsersVideo was successfully created." }
        format.json { render :show, status: :created, location: @users_video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @users_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_videos/1 or /users_videos/1.json
  def update
    respond_to do |format|
      if @users_video.update(users_video_params)
        format.html { redirect_to users_video_url(@users_video), notice: "UsersVideo was successfully updated." }
        format.json { render :show, status: :ok, location: @users_video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @users_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_videos/1 or /users_videos/1.json
  def destroy
    @users_video.destroy

    respond_to do |format|
      format.html { redirect_to users_videos_url, notice: "UsersVideo was successfully destroyed." }
      format.json { head :no_users_video }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_users_video
    @users_video = UsersVideo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def users_video_params
    params.require(:users_video).permit(:number, :video_url)
  end

  def upload
    region = 'ap-northeast-1'
    # バケット名
    bucket = 'user-videos-s3-01'
    # バケットに保存するファイル名
    key = "#{@users_video.content_number}_content_#{@users_video.number}"
    client = Aws::S3::Client.new(region: region, access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] )  
    # バケットにアップロードする動画の場所
    file_path = @users_video.video_url
    client.put_object(bucket: bucket, key: key, body: file_path)
  end
end
