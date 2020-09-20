# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :shop_id, uniqueness: { scope: :user_id }
  validates :content, length: { maximum: 140 }
end
