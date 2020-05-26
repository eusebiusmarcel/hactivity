class Activity < ApplicationRecord
  acts_as_taggable_on :tags

  belongs_to :user

  validates_presence_of :title, :start_at, :end_at
end
