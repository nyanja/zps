# frozen_string_literal: true

# The euphemism for Advert
class Meow < ApplicationRecord
  belongs_to :article, optional: true
end
