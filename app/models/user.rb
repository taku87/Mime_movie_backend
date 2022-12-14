class User < ApplicationRecord
  has_many :user_videos, dependent: :destroy
  has_many :completed_video_comments, dependent: :destroy
  has_many :completed_video_likes, dependent: :destroy
  has_many :content_video_comments, dependent: :destroy
  has_many :content_video_likes, dependent: :destroy
  has_many :liked_content_videos, through: :content_video_likes, source: :content_video

  enum role: { general: 0, admin: 1 }



  #Auth0との連携用　token情報を参照し、userが存在する場合はuserを返す、存在しない場合は新規userをcreateする。
  def self.from_token_payload(payload)
    find_by(sub: payload['sub']) || create!(sub: payload['sub'])
  end

  def like_content_video(content_video)
    liked_content_videos << content_video
  end

  def unlike_content_video(content_video)
    liked_content_videos.delete content_video
  end

  # このユーザーが、該当コンテンツ動画をライクしたかどうかの判定
  def like?(content_video)
    content_video.like_users.include?(self)
  end

  def love_content_video(content_video)
    loved_content_videos << content_video
  end

  def unlove_content_video(content_video)
    loved_content_videos.delete content_video
  end

  # 自分がラブしたコンテンツ動画一覧を表示するページ用
  #def love?(content_video)
  #  content_video.love_users.include?(self)
  #end

  def like_completed_video(completed_video)
    liked_completed_videos << completed_video
  end

  def unlike_completed_video(completed_video)
    liked_completed_videos.delete completed_video
  end

  # 自分がライクしたコンテンツ動画一覧を表示するページ用
  #def like?(completed_video)
  #  completed_video.like_users.include?(self)
  #end

  def love_completed_video(completed_video)
    loved_completed_videos << completed_video
  end

  def unlove_completed_video(completed_video)
    loved_completed_videos.delete completed_video
  end

  # 自分がラブしたコンテンツ動画一覧を表示するページ用
  #def love?(completed_video)
  #  completed_video.love_users.include?(self)
  #end
end
