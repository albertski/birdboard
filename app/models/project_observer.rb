class ProjectObserver < ActiveRecord::Observer
  def after_create(project)
    project.save_activity('project_created', project, project)
  end

  def after_update(project)
    project.save_activity('project_updated', project, project)
  end
end
