var _ouibounce = ouibounce(document.getElementById('funnel-modal'), {
  aggressive: true,
  callback: function() { console.log('ouibounce fired!'); }
});

$('#funnel-modal .underlay').on('click', function() {
  $('#funnel-modal').hide();
});

$('#funnel-modal .modal-footer').on('click', function() {
  $('#funnel-modal').hide();
});

$('#funnel-modal .modal').on('click', function(e) {
  e.stopPropagation();
});