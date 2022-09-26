class Api::V1::ContentVideos::ContentVideoLovesController < ApplicationController

  # POST /content_video_loves or /content_video_loves.json
  def create
    # authorize([:user, ContentVideoLove]) pundit認証系
    ActiveRecord::Base.transaction do
      content_video = ContentVideo.find(params[:content_video_id])
      current_user.love_content_video(content_video)
    end
    #意味深掘り
    head :ok
  end

  # DELETE /content_video_loves/1 or /content_video_loves/1.json
  def destroy
    ActiveRecord::Base.transaction do
      content_video = ContentVideo.find(params[:content_video_id])
      current_user.unlove_content_video(content_video)
    end
    #意味深掘り
    head :ok
  end
end
