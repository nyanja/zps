require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'tags association' do
    assert_equal tags(:one, :two), articles(:two).tags.to_a
  end

  test 'relevant articles' do
    assert_equal ['article3'], articles(:four).relevants.pluck(:name)
    assert_equal articles(:one, :two, :four), articles(:three).relevants.to_a
    assert_equal articles(:two, :four), articles(:three).relevants(2).to_a
  end

  test 'formatted fields' do
    # from '{site} - {name}'
    assert_equal 'Записки хозяйки - article1', articles(:one).title
    assert_equal 'lol Записки хозяйки - article1', articles(:one).description
  end
end
