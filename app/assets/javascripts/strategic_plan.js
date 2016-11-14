$(function() {
  $.get('/strategic_plan/tree.json', function(data) {
    new Treant(data);
  });
});
