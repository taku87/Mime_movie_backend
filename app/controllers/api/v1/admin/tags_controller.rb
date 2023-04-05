#今後開発予定の機能

class Api::V1::Admin::TagsController < ApplicationController
  before_action :set_tag, only: %i[ show edit update destroy ]

  # GET /tags or /tags.json
  def index
    tags = Tag.all
    render json: tags, status: :ok
  end

  # GET /tags/1 or /tags/1.json
  def show
    tag = @tag
    render json: tag, status: :ok
  end

  # POST /tags or /tags.json
  def create
    tag = Tag.find(tag_params)
    ActiveRecord::Base.transaction do
      tag.save!
    end
    head :ok
  end

  # PATCH/PUT /tags/1 or /tags/1.json
  def update
    @tag.update!(tag_params)
    head :ok
  end

  # DELETE /tags/1 or /tags/1.json
  def destroy
    @tag.destroy!
    head :ok
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def set_tags
      @tags = Tag.all
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
end
