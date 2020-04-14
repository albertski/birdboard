class TaskObserver < ActiveRecord::Observer
  def after_create(task)
    task.save_activity('task_created', task.project, task)
  end

  def after_update(task)
    task.save_activity('task_updated', task.project, task)
  end

  def after_destroy(task)
    task.save_activity('task_deleted', task.project, task)
  end
end
