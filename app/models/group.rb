class Group < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :admin
  belongs_to :category
  has_many :posts, dependent: :destroy

  validates :title, presence: true

  before_save :should_generate_new_friendly_id?, if: :title_changed?

  def next_group
    category.groups.where("id > ?", id).order(:id).first
  end

  private

    def should_generate_new_friendly_id?
      title_changed?
    end

end
