require 'test_helper'

class ContentVideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_video = content_videos(:one)
  end

  test "should get index" do
    get content_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_content_video_url
    assert_response :success
  end

  test "should create content_video" do
    assert_difference('ContentVideo.count') do
      post content_videos_url, params: { content_video: {  } }
    end

    assert_redirected_to content_video_url(ContentVideo.last)
  end

  test "should show content_video" do
    get content_video_url(@content_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_video_url(@content_video)
    assert_response :success
  end

  test "should update content_video" do
    patch content_video_url(@content_video), params: { content_video: {  } }
    assert_redirected_to content_video_url(@content_video)
  end

  test "should destroy content_video" do
    assert_difference('ContentVideo.count', -1) do
      delete content_video_url(@content_video)
    end

    assert_redirected_to content_videos_url
  end
end
