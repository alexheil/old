class Admin < ApplicationRecord
extend FriendlyId
  friendly_id :name, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups

  validates :name, presence: true

  before_save :should_generate_new_friendly_id?, if: :name_changed?

  private

    def should_generate_new_friendly_id?
      name_changed?
    end

end
