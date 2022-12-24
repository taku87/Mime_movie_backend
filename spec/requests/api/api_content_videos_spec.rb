require 'rails_helper'
require 'json'
#railsをAPIとして使用しているため、GETリクエストで想定通りのJSONデータが返ってくるかをテストします。
#json = JSON.parse(response.body) レスポンスボディに格納されているデータをJSONとして解析する処理。

RSpec.describe "コンテンツ動画管理機能", type: :request do
  describe "コンテンツ動画一覧表示機能" do
    it 'コンテンツ動画一覧が取得されること' do
      FactoryBot.create_list(:content_video, 3)
      get '/api/v1/guest/content_videos'
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json["data"].length).to eq(ContentVideo.count)
    end
  end

  describe "コンテンツ動画詳細表示機能" do
    it '特定のコンテンツ動画が取得されること' do
      content_video = create(:content_video)
      get "/api/v1/guest/content_videos/#{content_video.id}"
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json["data"]["attributes"]['number']).to eq(content_video.number)
    end
  end
end



