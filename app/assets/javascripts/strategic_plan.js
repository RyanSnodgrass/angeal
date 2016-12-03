$('.strategic_plan.index').ready(function() {
  $.get('/strategic_plan/tree.json', function(data) {
    tree = new Treant(data);
  });
});
