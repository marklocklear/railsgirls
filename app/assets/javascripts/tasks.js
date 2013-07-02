$(function() {
  $('.datepicker').datepicker();

  $('.completed').click(function(){
    var id = $(this).attr('data-id');
    var checked = $(this).is(':checked');

    $.d(id);
    $.d("Checked: "+checked);

    $.ajax({
      url: "/tasks/"+id,
      type: "PUT",
      dataType: 'script',
      data: { 'task': { 'completed': checked } }
    }).done(function() {
      if(checked) {
        $(this).addClass("done");
      } else {
        $(this).addClass("notDone");
      }
    });
  });
});