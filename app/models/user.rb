class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
        VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: { with: VALID_PASSWORD_REGEX , message: "には英字と数字の両方を含めて設定してください"}

         validates :nickname, presence: true
         validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ーヶ]+\z/, message: "には全角文字を使用してください"}
         validates :last_name, presence: true,  format: {with: /\A[ぁ-んァ-ン一-龥々ーヶ]+\z/, message: "には全角文字を使用してください"}
         validates :first_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "には全角カタカナのみで入力して下さい"}
         validates :last_kana, presence: true,  format: {with: /\A[ァ-ヶー－]+\z/, message: "には全角カタカナのみで入力して下さい"}
         validates :birthday, presence: true 

  has_many :items
  # has_many :buys
end
