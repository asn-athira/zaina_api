class Book < ApplicationRecord
 # belongs_to :user
 
  validates :name, presence: true, length: {maximum: 32}, allow_blank: false
  validates :code, length: {maximum: 32}, allow_blank: true
  validates :author, length: {maximum: 32}, allow_blank: true
  validates :description, length: {maximum: 32}, allow_blank: true
end
