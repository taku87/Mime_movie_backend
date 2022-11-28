class Api::V1::User::ContentVideoLikesController < SecuredController
  # POST /completed_video_likes or /completed_video_likes.json
  def create
    content_video = ContentVideo.find(params[:id])
    ActiveRecord::Base.transaction do
      current_user.like_content_video(content_video)
      render_json = ContentVideoSerializer.new(content_video, current_user: current_user).serializable_hash.to_json
      render json: render_json, status: :ok
    end
  end

  # DELETE /completed_video_likes/1 or /completed_video_likes/1.json
  def destroy
    content_video = ContentVideo.find(params[:id])
    ActiveRecord::Base.transaction do
      current_user.unlike_content_video(content_video)
      render_json = ContentVideoSerializer.new(content_video, current_user: current_user).serializable_hash.to_json
      render json: render_json, status: :ok
    end

  end
end
