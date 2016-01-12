(function() {
  $(function() {
    return $('#script-table').dataTable({
      processing: true,
      serverSide: true,
      ajax: $('#script-table').data('source'),
      sPaginationType: 'full',
      columnDefs: [
        {
          orderable: false,
          targets: [6, 7]
        }
      ]
    });
  });

}).call(this);
