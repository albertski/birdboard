class ProjectObserver < ActiveRecord::Observer
  def after_create(project)
    save_activity('created', project)
  end

  def after_update(project)
    save_activity('updated', project)
  end

  def after_destroy(project)
    save_activity('destroyed', project)
  end

  private

  def save_activity(type, project)
    Activity.create(description: type, project: project)
  end

end
