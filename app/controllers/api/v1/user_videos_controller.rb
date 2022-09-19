class Api::V1::UserVideosController < ApplicationController
  before_action :set_user_video, only: %i[ show edit update destroy ]

  # GET /user_videos or /user_videos.json
  def index
    #authorize([:user, UserVideo])
    @user_videos = UserVideo.all
    render json: user_videos, status: :ok
  end

  # GET /user_videos/1 or /user_videos/1.json
  def show
      #authorize([:user, UserVideo])
      user_video = @cuser_video
      render json: user_video, status: :ok
  end

  # GET /user_videos/new
  def new
    @user_video = UserVideo.new
  end

  # GET /user_videos/1/edit
  def edit
    #authorize([:user, UserVideo])
    user_video = @cuser_video
    render json: user_video, status: :ok
  end

  # POST /user_videos or /user_videos.json
  def create
    #authorize([:user, UserVideo])
    @user_video = UserVideo.new
    @user_video.number = @user.id
    @user_video.video_url = "/uploads/user_video/video_url/#{@user_video.id}"
    #テスト用に手作業でカラム情報を追加。本来は、入力時にパラメータに情報入るように実装予定
    set_content_video
    @user_video.content_number = @content_video.number
    @user_video.user_id = current_user.id
    #当初、rails上でmp4への変換処理を想定したが、MediaConvertで変換が可能なことがわかったため、削除予定
    #@user_video.transcoded_video_url = VideoEditingWorker.user_video_to_mp4(@user_video)
    ActiveRecord::Base.transaction do
      @user_video.save!
      upload
    end
    head :ok
  end

  # DELETE /user_videos/1 or /user_videos/1.json
  def destroy
    #authorize([:user, UserVideo])
    @user_video.destroy!
    head :ok
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_video
    @user_video = UserVideo.find(params[:id])
  end

  def set_content_video
    @content_video = ContentVideo.find(params[:content_video_id])
  end

  # Only allow a list of trusted parameters through.
  #def user_video_params
  #  params.require(:user_video).permit(:number, :content_number, :video_url)
  #end

  def upload
    region = 'ap-northeast-1'
    # バケット名
    bucket = 'user-videos-s3-01'
    # バケットに保存するファイル名
    key = "#{@content_video.number}_content_#{@user_video.number}"
    client = Aws::S3::Client.new(region: region, access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] )
    # バケットにアップロードする動画の場所
    file_path = @user_video.video_url
    client.put_object(bucket: bucket, key: key, body: file_path)
  end
end
