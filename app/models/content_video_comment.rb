class ContentVideoComment < ApplicationRecord
  belongs_to :user
  belongs_to :content_video

  validates :body, presence: true, length: { maximum: 65_535 }
end
