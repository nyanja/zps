class Tag < ApplicationRecord
  has_many :subjects
  has_many :articles, through: :subjects
end
