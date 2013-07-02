$(function() {
  $('.datepicker').datepicker();

  $('.completed').click(function(){
    var element = $(this);
    var id = element.attr('data-id');
    var checked = element.is(':checked');

    $.d(id);
    $.d("Checked: "+checked);

    $.ajax({
      url: "/tasks/"+id,
      type: "PUT",
      dataType: 'script',
      data: { 'task': { 'completed': checked } }
    }).done(function() {
      $.d("Done!");
      element.parent('li').effect("highlight", {color:"#ffff99"}, 3000 );
    });
  });
});