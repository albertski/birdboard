class Task < ApplicationRecord
  belongs_to :project, touch: true
  belongs_to :user

  validates_presence_of :body, :project, :user
end
