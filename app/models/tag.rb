# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :post_tag_relations, dependent: :destroy
  has_many :posts, through: :post_tag_relations
end
