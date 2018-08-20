require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "tags association" do
    assert_equal tags(:one, :two), articles(:two).tags.to_a
  end

  test "relevant articles" do
    assert_equal ["article3"], articles(:four).relevants.pluck(:name)
    assert_equal articles(:one, :two, :four), articles(:three).relevants.to_a
    assert_equal articles(:two, :four), articles(:three).relevants(2).to_a
  end

  test "formatted fields" do
    # converting from '{site} - {name}'
    assert_equal "\u0417\u0430\u043F\u0438\u0441\u043A\u0438 \u0445\u043E\u0437\u044F\u0439\u043A\u0438 - article1", articles(:one).title
    assert_equal "lol \u0417\u0430\u043F\u0438\u0441\u043A\u0438 \u0445\u043E\u0437\u044F\u0439\u043A\u0438 - article1", articles(:one).description
    assert_nil articles(:two).title
  end
end
