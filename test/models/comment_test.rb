require "test_helper"
require "application_system_test_case"
class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @comment = comments(:first)
  end

  test "Showing a comment" do
    visit comments_path
    click_link @comment.name

    assert_selector "h1", text: @comment.name
  end

  test "Creating a new comment" do
    visit comments_path
    assert_selector "h1", text: "comments"

    click_on "New comment"
    fill_in "Name", with: "Capybara comment"

    assert_selector "h1", text: "comments"
    click_on "Create comment"

    assert_selector "h1", text: "comments"
    assert_text "Capybara comment"
  end

  test "Updating a comment" do
    visit comments_path
    assert_selector "h1", text: "comments"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated comment"

    assert_selector "h1", text: "comments"
    click_on "Update comment"

    assert_selector "h1", text: "comments"
    assert_text "Updated comment"
  end

  test "Destroying a comment" do
    visit comments_path
    assert_text @comment.name

    click_on "Delete", match: :first
    assert_no_text @comment.name
  end
end
