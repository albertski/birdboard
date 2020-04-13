class TaskObserver < ActiveRecord::Observer
  def after_create(task)
    task.project.save_activity('task_created')
  end

  def after_update(task)
    task.project.save_activity('task_updated')
  end

  def after_destroy(task)
    task.project.save_activity('task_deleted')
  end
end
