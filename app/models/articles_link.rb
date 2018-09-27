class ArticlesLink < ApplicationRecord
  belongs_to :article
  belongs_to :link, class_name: "Article", foreign_key: :link_id
end
