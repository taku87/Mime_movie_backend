require 'test_helper'

class ContentVideoLikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_video_like = content_video_likes(:one)
  end

  test "should get index" do
    get content_video_likes_url
    assert_response :success
  end

  test "should get new" do
    get new_content_video_like_url
    assert_response :success
  end

  test "should create content_video_like" do
    assert_difference('ContentVideoLike.count') do
      post content_video_likes_url, params: { content_video_like: {  } }
    end

    assert_redirected_to content_video_like_url(ContentVideoLike.last)
  end

  test "should show content_video_like" do
    get content_video_like_url(@content_video_like)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_video_like_url(@content_video_like)
    assert_response :success
  end

  test "should update content_video_like" do
    patch content_video_like_url(@content_video_like), params: { content_video_like: {  } }
    assert_redirected_to content_video_like_url(@content_video_like)
  end

  test "should destroy content_video_like" do
    assert_difference('ContentVideoLike.count', -1) do
      delete content_video_like_url(@content_video_like)
    end

    assert_redirected_to content_video_likes_url
  end
end
