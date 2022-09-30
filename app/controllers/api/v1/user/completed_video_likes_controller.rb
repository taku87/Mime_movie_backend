class Api::V1::CompletedVideos::CompletedVideoLikesController < SecuredController
  # POST /completed_video_likes or /completed_video_likes.json
  def create
    # authorize([:user, CompletedVideoLike]) pundit認証系
    ActiveRecord::Base.transaction do
      completed_video = CompletedVideo.find(params[:completed_video_id])
      current_user.like_completed_video(completed_video)
    end
    #意味深掘り
    head :ok
  end

  # DELETE /completed_video_likes/1 or /completed_video_likes/1.json
  def destroy
    ActiveRecord::Base.transaction do
      completed_video = CompletedVideo.find(params[:completed_video_id])
      current_user.unlike_completed_video(completed_video)
    end
    #意味深掘り
    head :ok
  end
end
