require "application_system_test_case"

class MeowsTest < ApplicationSystemTestCase
  setup do
    @meow = meows(:one)
  end

  test "visiting the index" do
    visit meows_url
    assert_selector "h1", text: "Meows"
  end

  test "creating a Meow" do
    visit meows_url
    click_on "New Meow"

    fill_in "Article", with: @meow.article_id
    fill_in "Content", with: @meow.content
    fill_in "Description", with: @meow.description
    fill_in "Title", with: @meow.title
    fill_in "Type", with: @meow.type
    fill_in "Url", with: @meow.url
    click_on "Create Meow"

    assert_text "Meow was successfully created"
    click_on "Back"
  end

  test "updating a Meow" do
    visit meows_url
    click_on "Edit", match: :first

    fill_in "Article", with: @meow.article_id
    fill_in "Content", with: @meow.content
    fill_in "Description", with: @meow.description
    fill_in "Title", with: @meow.title
    fill_in "Type", with: @meow.type
    fill_in "Url", with: @meow.url
    click_on "Update Meow"

    assert_text "Meow was successfully updated"
    click_on "Back"
  end

  test "destroying a Meow" do
    visit meows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meow was successfully destroyed"
  end
end
