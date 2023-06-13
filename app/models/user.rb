class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pumpups
  
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "może zawierać tylko litery" }
  validates :surname, format: { with: /\A[a-zA-Z]+\z/, message: "może zawierać tylko litery" }
end
