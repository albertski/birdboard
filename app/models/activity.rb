class Activity < ApplicationRecord
  belongs_to :project
  belongs_to :subject, polymorphic: true
  has_many :projects, dependent: :destroy
  serialize :metadata, JSON
end
