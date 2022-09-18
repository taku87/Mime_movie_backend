require "application_system_test_case"

class ContentVideoCommentsTest < ApplicationSystemTestCase
  setup do
    @content_video_comment = content_video_comments(:one)
  end

  test "visiting the index" do
    visit content_video_comments_url
    assert_selector "h1", text: "Content Video Comments"
  end

  test "creating a Content video comment" do
    visit content_video_comments_url
    click_on "New Content Video Comment"

    click_on "Create Content video comment"

    assert_text "Content video comment was successfully created"
    click_on "Back"
  end

  test "updating a Content video comment" do
    visit content_video_comments_url
    click_on "Edit", match: :first

    click_on "Update Content video comment"

    assert_text "Content video comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Content video comment" do
    visit content_video_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Content video comment was successfully destroyed"
  end
end
