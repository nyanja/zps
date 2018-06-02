class Article < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  has_and_belongs_to_many :tags
  # accepts_nested_attributes_for :tags

  def relevants(n = 6)
    ids = ArticlesTag
            .where(tag_id: tag_ids)
            .order(count: :desc)
            .group(:article_id)
            .count
            .keys
            .reject { |v| v == id }
            .take(n)
    Article.where(id: ids)
  end
end
