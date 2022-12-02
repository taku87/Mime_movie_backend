require 'rails_helper'

RSpec.describe "コンテンツ動画管理機能", type: :system do
  describe 'コンテンツ動画一覧表示機能' do
    before do
      content_videos = create_list(:content_video, 3)
    end
    it 'コンテンツ動画一覧が取得されること' do
      get "/api/v1/guest/content_videos"
      expect(response.status).to eq(200)
      expect(json["data"].length).to eq(ContentVideo.count)
    end

  describe "コンテンツ動画詳細表示機能" do
    before do
      @content_video = create(:content_video)
    end
    it '特定のコンテンツ動画が取得されること' do
      get "/api/v1/guest/content_videos/#{@content_video.id}"
      expect(response.status).to eq(200)
      expect(json["data"][@content_video.id]["attributes"]['number']).to eq(@content_video.number)
    end
  end
end

