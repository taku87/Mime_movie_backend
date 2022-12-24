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

  describe "管理者機能" do
    let!(:current_user) { create :user, role: 1}

    before do
      # authorize_requestメソッドが呼ばれたらlet!(:current_user)を返す。
      # SecuredControllerのcurrent_userメソッドが呼ばれたらlet!(:current_user)を返す。
      authorization_stub
    end

    create_params = {
      number: 100,
      title: "title",
      description: "description",
      thumbnail: "thumbnail",
      youtube_url: "youtube_url",
      role: 0,
    }

    describe "新規コンテンツ動画登録機能" do
      it '新規のコンテンツ動画が登録されること' do
        expect { post '/api/v1/admin/content_videos', params: create_params }.to change(ContentVideo, :count).by(+1)
        expect(response.status).to eq(200)
        created_content_video = ContentVideo.find_by(number: 100)
        expect(created_content_video.title).to eq("title")
      end
    end

    describe "コンテンツ動画更新機能" do
      let!(:content_video) { create :content_video,
                                      number: 100,
                                      title: "title",
                                      description: "description",
                                      thumbnail: "thumbnail",
                                      youtube_url: "youtube_url"
                                    }
      it 'コンテンツ動画が更新されること' do
        put "/api/v1/admin/content_videos/#{content_video.id}", params: {title: "another_title"}
        expect(response.status).to eq(200)
        created_content_video = ContentVideo.find_by(number: 100)
        expect(created_content_video.title).to eq("another_title")
      end
    end

    describe "コンテンツ動画削除機能" do
      let!(:content_video) { create :content_video, number: 100}
      it 'コンテンツ動画が削除されること' do
        expect { delete "/api/v1/admin/content_videos/#{content_video.id}"}.to change(ContentVideo, :count).by(-1)
        expect(response.status).to eq(200)
      end
    end
  end
end



