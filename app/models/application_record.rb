class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def save_activity(type, project, subject)
    Activity.create(description: type, project: project, subject: subject, metadata: subject.saved_changes.except(:updated_at))
  end
end
