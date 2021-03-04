class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :books
         has_many :favorites, dependent: :destroy
         has_many :favorite_books, through: :favorites, source: :book
         has_many :comments

         attachment :profile_image

         validates :name, presence: true, uniqueness: true, length: 2..20
         validates :introduction, length: { maximum: 50 }
end
