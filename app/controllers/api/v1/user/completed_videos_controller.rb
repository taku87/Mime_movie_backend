#今後開発予定の機能

class Api::V1::User::CompletedVideosController < SecuredController
  before_action :set_completed_video, only: %i[ show edit update destroy ]
  skip_before_action :authorize_request
  # GET /completed_videos or /completed_videos.json
  def index
    completed_videos = CompletedVideo.all
    render_json = CompletedVideoSerializer.new(completed_videos).serializable_hash.to_json
    render json: render_json, status: :ok
  end

  #  GET /completed_videos/1 or /completed_videos/1.json
  # def show
  #   completed_video = @completed_video
  #   render_json = CompletedVideoSerializer.new(completed_video).serializable_hash.to_json
  #   render json: render_json, status: :ok
  # end

  # POST /completed_videos or /completed_videos.json
  # def create
  #   completed_video = CompletedVideo.new(completed_video_params)
  #   ActiveRecord::Base.transaction do
  #     completed_video.save!
  #   end
  #   head :ok
  # end

  # PATCH/PUT /completed_videos/1 or /completed_videos/1.json
  # def update
  #   @completed_video.update!(completed_video_params)
  #   head :ok
  # end

  # DELETE /completed_videos/1 or /completed_videos/1.json
  # def destroy
  #   @completed_video.destroy!
  #   head :ok
  # end

  private

    def set_completed_video
      @completed_video = CompletedVideo.find(params[:id])
    end

    def completed_video_params
      params.require(:completed_video).permit(:number, :title, :description)
    end
end
