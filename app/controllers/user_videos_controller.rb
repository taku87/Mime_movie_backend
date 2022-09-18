class UsersVideosController < ApplicationController
  before_action :set_user_video, only: %i[ show edit update destroy ]

  # GET /user_videos or /user_videos.json
  def index
    @user_videos = UsersVideo.all
  end

  # GET /user_videos/1 or /user_videos/1.json
  def show
  end

  # GET /user_videos/new
  def new
    @user_video = UsersVideo.new
  end

  # GET /user_videos/1/edit
  def edit
  end

  # POST /user_videos or /user_videos.json
  def create
    @user_video = UsersVideo.new(user_video_params)
    #テスト用に手作業でカラム情報を追加。本来は、入力時にパラメータに情報入るように実装予定
    @user_video.content_number = 100
    @user_video.user_id = 1
    #当初、rails上でmp4への変換処理を想定したが、MediaConvertで変換が可能なことがわかったため、削除予定
    #@user_video.transcoded_video_url = VideoEditingWorker.user_video_to_mp4(@user_video)
    
    respond_to do |format|
      if @user_video.save
        upload
        format.html { redirect_to user_video_url(@user_video), notice: "UsersVideo was successfully created." }
        format.json { render :show, status: :created, location: @user_video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_videos/1 or /user_videos/1.json
  def update
    respond_to do |format|
      if @user_video.update(user_video_params)
        format.html { redirect_to user_video_url(@user_video), notice: "UsersVideo was successfully updated." }
        format.json { render :show, status: :ok, location: @user_video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_videos/1 or /user_videos/1.json
  def destroy
    @user_video.destroy

    respond_to do |format|
      format.html { redirect_to user_videos_url, notice: "UsersVideo was successfully destroyed." }
      format.json { head :no_user_video }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_video
    @user_video = UsersVideo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_video_params
    params.require(:user_video).permit(:number, :video_url)
  end

  def upload
    region = 'ap-northeast-1'
    # バケット名
    bucket = 'user-videos-s3-01'
    # バケットに保存するファイル名
    key = "#{@user_video.content_number}_content_#{@user_video.number}"
    client = Aws::S3::Client.new(region: region, access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] )  
    # バケットにアップロードする動画の場所
    file_path = @user_video.video_url
    client.put_object(bucket: bucket, key: key, body: file_path)
  end
end
