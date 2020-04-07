class Task < ApplicationRecord
  belongs_to :project, touch: true
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates_presence_of :body, :project, :user
end
