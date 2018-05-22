class Article < ApplicationRecord
  has_one_attached :image
  has_many :subjects
  has_many :tags, through: :subjects
  accepts_nested_attributes_for :tags
end
