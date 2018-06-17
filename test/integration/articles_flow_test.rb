require 'test_helper'

class ArticlesFlowTest < ActionDispatch::IntegrationTest
  test 'create valid article' do
    get '/admin/articles/new', headers: auth_header
    assert_response :success

    post '/admin/articles',
         headers: auth_header,
         params: { article: { title: 'hello',
                              category_id: categories(:one).id } }
    assert_response :redirect
    get response.location, headers: auth_header
    assert_response :success
    assert_select 'p', 'hello' do
      assert_select 'div.label', 'Title:'
    end
  end


  private

  def auth_header
    ENV['ZBS_PASSWORD'] = 'zbs'
    { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('zbs', 'zbs') }
  end
end
