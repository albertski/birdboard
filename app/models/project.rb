class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :activities, -> { order(created_at: :desc) }

  validates_presence_of :title, :description, :user

  def save_activity(type)
    Activity.create(description: type, project: self)
  end
end
