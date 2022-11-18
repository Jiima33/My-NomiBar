# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :area
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 200 }
  validates :area, presence: true
  validates :tag_ids, presence: true
  validates :rate, presence: true


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # いいね順
  ransacker :favorites_count do
    query = "(SELECT COUNT(favorites.post_id) FROM favorites where favorites.post_id = posts.id GROUP BY favorites.post_id)"
    Arel.sql(query)
  end
end
