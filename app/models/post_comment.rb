# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # バリデーション
  validates :comment, presence: true, length: { maximum: 200 }
end
