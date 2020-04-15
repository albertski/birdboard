require_dependency 'activity_recorder'

class Project < ApplicationRecord
  include ActivityRecorder
  belongs_to :user
  has_many :tasks
  has_many :activities, -> { order(created_at: :desc) }
  has_many :subjects, -> { order(created_at: :desc) }, as: 'subject'

  validates_presence_of :title, :description, :user
end
