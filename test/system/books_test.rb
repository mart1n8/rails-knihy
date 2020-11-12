require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "creating a Book" do
    visit books_url
    click_on "New Book"

    fill_in "About", with: @book.about
    fill_in "Cover img", with: @book.cover_img
    fill_in "Name", with: @book.name
    fill_in "Original name", with: @book.original_name
    fill_in "Publish year", with: @book.publish_year
    fill_in "Slug", with: @book.slug
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "updating a Book" do
    visit books_url
    click_on "Edit", match: :first

    fill_in "About", with: @book.about
    fill_in "Cover img", with: @book.cover_img
    fill_in "Name", with: @book.name
    fill_in "Original name", with: @book.original_name
    fill_in "Publish year", with: @book.publish_year
    fill_in "Slug", with: @book.slug
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "destroying a Book" do
    visit books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book was successfully destroyed"
  end
end
