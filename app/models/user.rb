class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         validates :nickname, :first_name, :last_name, :birthday, presence: true
         validates :password, confirmation: true, presence: true, length: { minimum: 6 },
                   # 英数字のみ可
                   format: { with: /\A[a-z0-9]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }
         validates :email, presence: true, 
                   # 重複不可
                   uniqueness: { case_sensitive: false }, 
                   # 英数字のみ可,@を挟んだemailの形になっているか
                   # /^\S+@\S+\.\S+$/   /\A[a-z0-9]+\z/i  /^[a-zA-Z0-9]+$/
                   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }
         validates :first_name_kana, :last_name_kana, presence: true, 
                   # カナのみ可
                   format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }
                   has_many :sns_credentials
   
end
