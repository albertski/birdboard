require 'active_support/concern'

module ActivityRecorder
  extend ActiveSupport::Concern

  included do
    after_create :create_activity
    after_update :update_activity
  end

  private

  def create_activity
    save_activity 'created'
  end

  def update_activity
    save_activity 'updated'
  end

  def save_activity(type)
    Activity.create(description: type,
                    project: self.try(:project) || self,
                    subject: self,
                    metadata: self.saved_changes.except(:updated_at),
                    user: self.user)
  end
end
