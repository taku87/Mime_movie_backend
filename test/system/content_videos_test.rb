require "application_system_test_case"

class ContentVideosTest < ApplicationSystemTestCase
  setup do
    @content_video = content_videos(:one)
  end

  test "visiting the index" do
    visit content_videos_url
    assert_selector "h1", text: "Content Videos"
  end

  test "creating a Content video" do
    visit content_videos_url
    click_on "New Content Video"

    click_on "Create Content video"

    assert_text "Content video was successfully created"
    click_on "Back"
  end

  test "updating a Content video" do
    visit content_videos_url
    click_on "Edit", match: :first

    click_on "Update Content video"

    assert_text "Content video was successfully updated"
    click_on "Back"
  end

  test "destroying a Content video" do
    visit content_videos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Content video was successfully destroyed"
  end
end
