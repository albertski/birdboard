
$(document).on('turbolinks:load', function() {
  $("#new_project").on("ajax:success", (event) => {
    [data, status, xhr] = event.detail;
    $("#new_project .project-errors").replaceWith($(xhr.responseText).find(".project-errors"));
  });
});
