# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  # バリデーション
  validates :name, presence: true, length: { maximum: 15 }
  validates :introduction, length: { maximum: 100 }

  # プロフィール画像設定
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/profile_noimage.png")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # ゲストユーザーアカウント
  def self.guest
    # create!(name: 'guestuser', email: 'guestuser@example.com',password: SecureRandom.urlsafe_base64)
    find_or_create_by!(name: "guestuser", email: "guestuser@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
      # user.gender = :gender_private
    end
  end

  # 性別選択
  enum gender: { gender_private: 0, man: 1, woman: 2, other: 3 }
end
