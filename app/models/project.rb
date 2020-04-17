require_dependency 'activity_recorder'

class Project < ApplicationRecord
  include ActivityRecorder
  belongs_to :user
  has_many :tasks
  has_many :activities, -> { order(created_at: :desc) }
  has_many :subjects, -> { order(created_at: :desc) }, as: 'subject'
  has_and_belongs_to_many :members,
                          class_name: 'User',
                          join_table: "members_projects",
                          foreign_key: "projects_id",
                          association_foreign_key: "users_id"

  validates_presence_of :title, :description, :user

  def invite(user)
    self.members << user unless self.members.include?(user)
  end
end
