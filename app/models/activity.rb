class Activity < ApplicationRecord
  acts_as_taggable_on :tags

  scope :start_between, ->(from_date, to_date) { where('start_at BETWEEN ? AND ?', from_date, to_date) }
  scope :end_between, ->(from_date, to_date) { where('end_at BETWEEN ? AND ?', from_date, to_date) }
  scope :ordered_by_start_at, -> { order(start_at: :asc) }

  belongs_to :user

  validates_presence_of :title, :start_at, :end_at, :color

  def self.start_end_between(from_date, to_date)
    from_date ||= Date.today
    to_date   ||= Date.today + 1
    start_between(from_date, to_date).or(end_between(from_date, to_date))
  end
end
