class Email < ApplicationRecord

  validates :email, presence: true, uniqueness: true, length: { maximum: 75 }, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  def self.email_blast
    EmailMailer.email_blast(email).deliver_now
  end

end
