class Admin::ContentVideos::ContentVideoLikesController < ApplicationController

  # POST /content_video_likes or /content_video_likes.json
  def create
    # authorize([:user, ContentVideoLike]) pundit認証系
    ActiveRecord::Base.transaction do
      content_video = ContentVideo.find(params[:content_video_id])
      current_user.like_content_video(content_video)
    end
    #意味深掘り
    head :ok
  end

  # DELETE /content_video_likes/1 or /content_video_likes/1.json
  def destroy
    ActiveRecord::Base.transaction do
      content_video = ContentVideo.find(params[:content_video_id])
      current_user.unlike_content_video(content_video)
    end
    #意味深掘り
    head :ok
  end
end
