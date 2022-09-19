class Admin::CompletedVideos::CompletedVideoLovesController < ApplicationController

  # POST /completed_video_loves or /completed_video_loves.json
  def create
    # authorize([:user, CompletedVideoLove]) pundit認証系
    ActiveRecord::Base.transaction do
      completed_video = CompletedVideo.find(params[:completed_video_id])
      current_user.love_completed_video(completed_video)
    end
    #意味深掘り
    head :ok
  end

  # DELETE /completed_video_loves/1 or /completed_video_loves/1.json
  def destroy
    ActiveRecord::Base.transaction do
      completed_video = CompletedVideo.find(params[:completed_video_id])
      current_user.unlove_completed_video(completed_video)
    end
    #意味深掘り
    head :ok
  end
end
