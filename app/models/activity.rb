class Activity < ApplicationRecord
  belongs_to :project
  has_many :projects, dependent: :destroy

end
