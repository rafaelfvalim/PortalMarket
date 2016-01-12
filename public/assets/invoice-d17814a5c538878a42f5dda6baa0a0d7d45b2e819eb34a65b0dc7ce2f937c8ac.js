(function() {
  $(function() {
    return $('#invoice-table').dataTable({
      processing: true,
      serverSide: true,
      ajax: $('#invoice-table').data('source'),
      sPaginationType: 'full'
    });
  });

}).call(this);
