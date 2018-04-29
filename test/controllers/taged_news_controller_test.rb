require 'test_helper'

class TagedNewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taged_news = taged_news(:one)
  end

  test "should get index" do
    get taged_news_index_url
    assert_response :success
  end

  test "should get new" do
    get new_taged_news_url
    assert_response :success
  end

  test "should create taged_news" do
    assert_difference('TagedNews.count') do
      post taged_news_index_url, params: { taged_news: { status: @taged_news.status, tag: @taged_news.tag } }
    end

    assert_redirected_to taged_news_url(TagedNews.last)
  end

  test "should show taged_news" do
    get taged_news_url(@taged_news)
    assert_response :success
  end

  test "should get edit" do
    get edit_taged_news_url(@taged_news)
    assert_response :success
  end

  test "should update taged_news" do
    patch taged_news_url(@taged_news), params: { taged_news: { status: @taged_news.status, tag: @taged_news.tag } }
    assert_redirected_to taged_news_url(@taged_news)
  end

  test "should destroy taged_news" do
    assert_difference('TagedNews.count', -1) do
      delete taged_news_url(@taged_news)
    end

    assert_redirected_to taged_news_index_url
  end
end
