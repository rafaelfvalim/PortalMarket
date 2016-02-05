$ ->
  alert 'teste'
  $('#wizard').steps()
  $('#form').steps(
    bodyTag: 'fieldset'
    onStepChanging: (event, currentIndex, newIndex) ->
# Always allow going backward even if the current step contains invalid fields!
      if currentIndex > newIndex
        return true
      # Forbid suppressing "Warning" step if the user is to young
      if newIndex == 3 and Number($('#age').val()) < 18
        return false
      form = $(this)
      # Clean up if user went backward before
      if currentIndex < newIndex
# To remove error styles
        $('.body:eq(' + newIndex + ') label.error', form).remove()
        $('.body:eq(' + newIndex + ') .error', form).removeClass 'error'
      # Disable validation on fields that are disabled or hidden.
      form.validate().settings.ignore = ':disabled,:hidden'
      # Start validation; Prevent going forward if false
      form.valid()
    onStepChanged: (event, currentIndex, priorIndex) ->
# Suppress (skip) "Warning" step if the user is old enough.
      if currentIndex == 2 and Number($('#age').val()) >= 18
        $(this).steps 'next'
      # Suppress (skip) "Warning" step if the user is old enough and wants to the previous step.
      if currentIndex == 2 and priorIndex == 3
        $(this).steps 'previous'
      return
    onFinishing: (event, currentIndex) ->
      form = $(this)
      # Disable validation on fields that are disabled.
      # At this point it's recommended to do an overall check (mean ignoring only disabled fields)
      form.validate().settings.ignore = ':disabled'
      # Start validation; Prevent form submission if false
      form.valid()
    onFinished: (event, currentIndex) ->
      form = $(this)
      # Submit form input
      form.submit()
      return
  ).validate
    errorPlacement: (error, element) ->
      element.before error
      return
    rules:
      confirm:
        equalTo: '#password'
  return

# ---
# generated by js2coffee 2.1.0