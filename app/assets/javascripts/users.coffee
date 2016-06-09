# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(':file').filestyle
    buttonText: 'Selecione'
    buttonName: 'btn  btn-success'

  $('#master_user_form').validate
    ignore: ':hidden'
    rules:
      'user[member_attributes][cpf]':
        cpfBR: true
        required: true
      'user[member_attributes][cnpj]':
        cnpj: true
        required: true
  $('#master-user-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#master-user-table').data('source')
    sPaginationType: 'full'
    columnDefs: [{orderable: false, targets: [6, 7]}]




# $image = $('.image-crop > img')
#
#  $($image).cropper
#    aspectRatio: 1.618
#    preview: '.img-preview'
#    done: (data) ->
## Output the result data for cropping image.
#
#
#  $inputImage = $('#inputImage')
#  if window.FileReader
#    $inputImage.change ->
#      fileReader = new FileReader
#      files = this.files
#      file = undefined
#      if !files.length
#        return
#
#      file = files[0]
#      if /^image\/\w+$/.test(file.type)
#        fileReader.readAsDataURL file
#        fileReader.onload = ->
#          $inputImage.val ''
#          $image.cropper('reset', true).cropper 'replace', @result
#      else
#        showMessage 'Please choose an image file.'
#  else
#    $inputImage.addClass 'hide'
#  $('#download').click ->
#    console.log 'asasdas'
#    $image.cropper('getDataURL')
#    console.log $image.cropper('getDataURL')
#
#  $('#zoomIn').click ->
#    $image.cropper 'zoom', 0.1
#
#  $('#zoomOut').click ->
#    $image.cropper 'zoom', -0.1
#
#  $('#rotateLeft').click ->
#    $image.cropper 'rotate', 45
#
#  $('#rotateRight').click ->
#    $image.cropper 'rotate', -45
#
#  $('#setDrag').click ->
#    $image.cropper 'setDragMode', 'crop'
