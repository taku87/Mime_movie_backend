class Api::V1::User::ContentVideoLikesController < SecuredController
  # POST /completed_video_likes or /completed_video_likes.json
  def create
    # authorize([:user, CompletedVideoLike]) pundit認証系
    ActiveRecord::Base.transaction do
      content_video = ContentVideo.find(params[:id])
      current_user.like_content_video(content_video)
    end
    #意味深掘り
    head :ok
  end

  # DELETE /completed_video_likes/1 or /completed_video_likes/1.json
  def destroy
    ActiveRecord::Base.transaction do
      content_video = ContentVideo.find(params[:id])
      current_user.unlike_content_video(content_video)
    end
    #意味深掘り
    head :ok
  end
end
