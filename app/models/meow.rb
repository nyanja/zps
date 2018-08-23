# frozen_string_literal: true

# The euphemism for Advert
class Meow < ApplicationRecord
  has_one_attached :image
  belongs_to :article, optional: true
end
