class Admin::ContentVideos::TagsController < ApplicationController
  before_action :set_tag, only: %i[ show edit update destroy ]

  # GET /tags or /tags.json
  def index
    #authorize([:user, Tag])
    tags = Tag.all
    render json: tags, status: :ok
    #status: :okを深掘り
  end

  # GET /tags/1 or /tags/1.json
  def show
    #authorize([:user, Tag])
    tag = @tag
    render json: tag, status: :ok
  end

  #おそらくnewという概念がいらない！
  # GET /tags/new
  #def new
    #authorize([:user, Tag])
  #  @tag = Tag.new
  #end

  # GET /tags/1/edit
  def edit
    #authorize([:user, Tag])
    tag = @tag
    render json: tag, status: :ok
  end

  # POST /tags or /tags.json
  def create
    #authorize([:user,  Tag])
    tag = Tag.find(tag_params)
    ActiveRecord::Base.transaction do
      tag.save!
    end
    head :ok
  end


  # PATCH/PUT /tags/1 or /tags/1.json
    #authorize([:user,  Tag])
  def update
    @tag.update!(tag_params)
    head :ok
  end

  # DELETE /tags/1 or /tags/1.json
  def destroy
    #authorize([:user, tag])
    @tag.destroy!
    head :ok
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    #def set_tags
    #  @tags = Tag.all
    #end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:name)
    end
end
