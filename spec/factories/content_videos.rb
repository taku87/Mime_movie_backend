FactoryBot.define do
  factory :content_video do
    sequence(:title) { |n| "TEST_TITLE#{n}"}
    sequence(:description) { |n| "TEST_DESCRIPTION#{n}"}
    sequence(:thumbnail) { |n| "TEST_THUMBNAIL#{n}"}
    sequence(:youtube_url) { |n| "TEST_YOUTUBE_URL#{n}"}
    sequence(:number) { |n| n*100 }
    sequence(:state) { 0 }
  end
end
