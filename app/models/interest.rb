# frozen_string_literal: true

class Interest < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :shop_name, presence: true
  validates :shop_id, uniqueness: { scope: :user_id }, presence: true
end
