class Category < ApplicationRecord
  has_many :articles
  default_scope { order('position ASC NULLS LAST') }
end
