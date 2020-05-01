import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['body'];

  addNewTask(e) {
    e.preventDefault();

    var count = this.bodyTargets.length + 1;
    $('.task-inputs').append('<div class="mb-4" data-target="task.body" data-index="' + count + '"><input class="border border-muted-light mb-2 p-2 text-xs block w-full rounded" placeholder="Task ' + count + '" type="text" name="project[tasks_attributes][' + count + '][body]" id="project_tasks_attributes_' + count + '_body"></div>');
  }
}
