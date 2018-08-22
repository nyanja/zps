require 'test_helper'

class MeowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meow = meows(:one)
  end

  test "should get index" do
    get meows_url
    assert_response :success
  end

  test "should get new" do
    get new_meow_url
    assert_response :success
  end

  test "should create meow" do
    assert_difference('Meow.count') do
      post meows_url, params: { meow: { article_id: @meow.article_id, content: @meow.content, description: @meow.description, title: @meow.title, type: @meow.type, url: @meow.url } }
    end

    assert_redirected_to meow_url(Meow.last)
  end

  test "should show meow" do
    get meow_url(@meow)
    assert_response :success
  end

  test "should get edit" do
    get edit_meow_url(@meow)
    assert_response :success
  end

  test "should update meow" do
    patch meow_url(@meow), params: { meow: { article_id: @meow.article_id, content: @meow.content, description: @meow.description, title: @meow.title, type: @meow.type, url: @meow.url } }
    assert_redirected_to meow_url(@meow)
  end

  test "should destroy meow" do
    assert_difference('Meow.count', -1) do
      delete meow_url(@meow)
    end

    assert_redirected_to meows_url
  end
end
