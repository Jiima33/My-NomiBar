# frozen_string_literal: true

class Area < ApplicationRecord
  has_many :posts, dependent: :destroy
end
