require 'rails_helper'
require 'json'
#railsをAPIとして使用しているため、GETリクエストで想定通りのJSONデータが返ってくるかをテストします。
#json = JSON.parse(response.body) レスポンスボディに格納されているデータをJSONとして解析する処理。

RSpec.describe "ライク機能", type: :request do
  let!(:current_user) { create(:user) }
  let!(:content_video) { create(:content_video) }
  before do
    # authorize_requestメソッドが呼ばれたらlet!(:current_user)を返す。
    # SecuredControllerのcurrent_userメソッドが呼ばれたらlet!(:current_user)を返す。
    authorization_stub
  end

  describe "ライク取得機能" do
    let!(:content_video_like) { create(:content_video_like, user_id: current_user.id, content_video_id: content_video.id) }

    it 'ライク総数が取得されること' do
      get '/api/v1/guest/content_videos'
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json["data"][0]["attributes"]["like_amount"]).to eq(1)
    end
  end

  describe "ライク登録機能" do
    it 'ライクデータが登録されていること' do
      # ライクテーブルのレコードが一つ増えているかどうかの確認
      expect { post '/api/v1/user/content_video_likes', params: { id: content_video.id } }.to change(ContentVideoLike, :count).by(+1)
      expect(response.status).to eq(200)
      # 特定ユーザーが、特定コンテンツにライクしたかどうかの確認
      expect(current_user.like?(content_video)).to eq(true)
    end
  end

  describe "ライク削除機能" do
    let!(:content_video_like) { create(:content_video_like, user_id: current_user.id, content_video_id: content_video.id) }

    it 'ライクデータが削除されていること' do
            # ライクテーブルのレコードが一つ増えているかどうかの確認
      expect { delete "/api/v1/user/content_video_likes/#{content_video.id}" }.to change(ContentVideoLike, :count).by(-1)
      expect(response.status).to eq(200)
      # 特定ユーザーが、特定コンテンツにライクしたかどうかの確認
      expect(current_user.like?(content_video)).to eq(false)
    end
  end
end






