class Comment < ApplicationRecord
  has_one_attached :avatar
  belongs_to :article
end
