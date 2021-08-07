require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "should not save article without title or body" do 
    article = Article.new
    assert_not article.save, "Saved the article without a title or body"
  end
  test "should save an article with a title and body" do
    article = Article.create(title: "David", body: "Code Artist")
    assert article.save, "Did not save the article with a title and body"
  end
  test "should not save if without title or too short of a title" do
    article = Article.create(title: " ", body: "Artist")
    assert_not article.save, "Saved the article title as empty string"
    article = Article.create(title: nil, body: "Artist")
    assert_not article.save, "Saved the article title as a nil value"
    article = Article.create(title: 'y', body: "Artist")
    assert_not article.save, "Saved the article title with less than 5 letters in length"
  end
  test "should not save if without body" do
    article = Article.create(title: "Tom", body: "")
    assert_not article.save, "Saved the article without a body"
    article = Article.create(title: "Artist", body: nil)
    assert_not article.save, "Saved the article as a nil value"
  end
end
