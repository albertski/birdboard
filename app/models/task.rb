require_dependency 'activity_recorder'

class Task < ApplicationRecord
  include ActivityRecorder
  belongs_to :project, touch: true
  belongs_to :user

  validates_presence_of :body, :project, :user
end
