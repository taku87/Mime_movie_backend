require 'test_helper'

class ContentVideoCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_video_comment = content_video_comments(:one)
  end

  test "should get index" do
    get content_video_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_content_video_comment_url
    assert_response :success
  end

  test "should create content_video_comment" do
    assert_difference('ContentVideoComment.count') do
      post content_video_comments_url, params: { content_video_comment: {  } }
    end

    assert_redirected_to content_video_comment_url(ContentVideoComment.last)
  end

  test "should show content_video_comment" do
    get content_video_comment_url(@content_video_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_video_comment_url(@content_video_comment)
    assert_response :success
  end

  test "should update content_video_comment" do
    patch content_video_comment_url(@content_video_comment), params: { content_video_comment: {  } }
    assert_redirected_to content_video_comment_url(@content_video_comment)
  end

  test "should destroy content_video_comment" do
    assert_difference('ContentVideoComment.count', -1) do
      delete content_video_comment_url(@content_video_comment)
    end

    assert_redirected_to content_video_comments_url
  end
end
