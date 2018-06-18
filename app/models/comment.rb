class Comment < ApplicationRecord
  has_one_attached :avatar
  belongs_to :article

  after_commit :attach_default_avatar, on: :create

  default_scope { order "created_at ASC" }

  private

  def attach_default_avatar
    return if avatar.attached?
    avatar.attach io: File.open(Rails.root.join(*%w[public img user_ph.png])),
                  filename: 'ph.png',
                  content_type: 'image/png'
  end
end
