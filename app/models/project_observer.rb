class ProjectObserver < ActiveRecord::Observer
  def after_create(project)
    project.save_activity('project_created')
  end

  def after_update(project)
    project.save_activity('project_updated')
  end
end
