require "application_system_test_case"

class ContentVideoLikesTest < ApplicationSystemTestCase
  setup do
    @content_video_like = content_video_likes(:one)
  end

  test "visiting the index" do
    visit content_video_likes_url
    assert_selector "h1", text: "Content Video Likes"
  end

  test "creating a Content video like" do
    visit content_video_likes_url
    click_on "New Content Video Like"

    click_on "Create Content video like"

    assert_text "Content video like was successfully created"
    click_on "Back"
  end

  test "updating a Content video like" do
    visit content_video_likes_url
    click_on "Edit", match: :first

    click_on "Update Content video like"

    assert_text "Content video like was successfully updated"
    click_on "Back"
  end

  test "destroying a Content video like" do
    visit content_video_likes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Content video like was successfully destroyed"
  end
end
