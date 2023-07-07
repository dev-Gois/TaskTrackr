class User < ApplicationRecord
  attr_accessor :reset_token
  
  before_create :generate_reset_token
  has_many :tasks, dependent: :destroy
  has_many :lists, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

  def generate_reset_token
    self.reset_token = SecureRandom.urlsafe_base64
  end
end
