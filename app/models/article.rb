class Article < ApplicationRecord
  include Formatable
  formatable_fields :title, :description, :keywords
  has_one_attached :image
  has_many :comments
  has_many :meows, dependent: :destroy # ads
  belongs_to :category
  has_and_belongs_to_many :tags
  has_many :articles_links
  has_many :links_articles, class_name: "ArticlesLink", foreign_key: :link_id
  has_many :links, through: :articles_links
  has_many :articles, through: :links_articles

  after_commit :attach_default_image, on: :create

  default_scope { order("updated_at DESC") }

  def relevants quantity = 6
    ids = ArticlesTag
          .where(tag_id: tag_ids)
          .order(count: :desc)
          .group(:article_id)
          .count
          .keys
          .reject { |v| v == id }
          .take(quantity)
    Article.where(id: ids)
  end

  def time_to_read
    # in minutes
    (content.size * 0.0015).round
  end

  def param
    { category_slug: category.slug,
      slug: slug }
  end

  private

  def attach_default_image
    return if image.attached?
    image.attach io: File.open(Rails.root.join("public", "img", "ph.png")),
                 filename: "ph.png",
                 content_type: "image/png"
  end
end
