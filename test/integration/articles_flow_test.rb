require "test_helper"

class ArticlesFlowTest < ActionDispatch::IntegrationTest
  test "create valid article" do
    get "/admin/articles/new"
    assert_response :success

    post "/admin/articles",
         params: { article: { title: "{name}i",
                              name: "lol",
                              slug: "slug",
                              category_id: categories(:one).id,
                              content: "## hello" } }
    assert_response :redirect
    get response.location
    assert_response :success
    assert_select "h2", "hello"
    assert_select "img", src: "/img/ph.png"

    # Visit the article as an user
    get "/slug"
    assert_select "title", "loli"
    assert_select "h1", "lol"
  end
end
