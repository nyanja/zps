class Article < ApplicationRecord
  include Formatable
  formatable_fields :title, :description, :keywords
  has_one_attached :image
  has_many :comments
  belongs_to :category
  has_and_belongs_to_many :tags

  after_commit :attach_default_image, on: :create

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

  private

  def attach_default_image
    return if image.attached?
    image.attach io: File.open(Rails.root.join(* %w[public img ph.png])),
                 filename: 'ph.png',
                 content_type: 'image/png'
  end
end
