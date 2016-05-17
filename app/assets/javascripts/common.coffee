$ ->
  $("[data-behavior='remover']").on "click", (e) ->
    swal {
      title: 'Atenção'
      text: 'Deseja mesmo remover esse item?'
      type: 'warning'
      showCancelButton: true
      confirmButtonColor: '#DD6B55'
      confirmButtonText: 'Sim'
      cancelButtonText: 'Não'
      closeOnConfirm: true
      closeOnCancel: true
    }, (confirmed) =>
      if confirmed
        $.ajax(
          url: $(this).attr("href")
          dataType: "script"
          method: "DELETE"
#          success: =>
#            swal 'Deleted!', 'Your imaginary file has been deleted.', 'success'
        )
      #      else
      #        swal 'Cancelled', 'Your imaginary file is safe :)', 'error'
      return
    return false