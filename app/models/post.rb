class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :group

  validates :number, :uniqueness => {:scope => :group_id}, presence: true
  validates :title, presence: true

  before_save :should_generate_new_friendly_id?, if: :title_changed?

  def next
    group.posts.where("number > ?", number).order(:number).first
  end

  def previous
    group.posts.where("number < ?", number).order(:number).last
  end

  private

    def should_generate_new_friendly_id?
      title_changed?
    end

end
