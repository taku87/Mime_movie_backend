class ContentVideoLikesController < ApplicationController
  before_action :set_content_video_like, only: %i[ show edit update destroy ]

  # POST /content_video_likes or /content_video_likes.json
  def create
    content_video = ContentVideo.find(params[:content_video_id])
    current_user.like_content_video(content_video)


    respond_to do |format|
      if @content_video_like.save
        format.html { redirect_to content_video_like_url(@content_video_like), notice: "Content video like was successfully created." }
        format.json { render :show, status: :created, location: @content_video_like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @content_video_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_video_likes/1 or /content_video_likes/1.json
  def destroy
    content_video = ContentVideo.find(params[:content_video_id])
    current_user.unlike(content_video)


    respond_to do |format|
      format.html { redirect_to content_video_likes_url, notice: "Content video like was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end
