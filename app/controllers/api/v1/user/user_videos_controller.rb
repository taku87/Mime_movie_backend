class Api::V1::User::UserVideosController < SecuredController
  # GET /user_videos/1 or /user_videos/1.json
  def show
      set_content_video
      render json: { key: "#{@content_video.number}_content_user_#{current_user.id}" }
  end

  private

  def set_content_video
    @content_video = ContentVideo.find(params[:id])
  end

end
