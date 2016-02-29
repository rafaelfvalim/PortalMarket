$ ->
  tmr = self.setInterval((->
    myDelay()
    return
  ), 1000)

  clip = new Clipboard('#token_button')
  console.log clip

  myDelay()
  $('.second').knob
    'min': 0
    'max': 60
    'readOnly': true
    'width': 200
    'height': 200
    'fgColor': '#2f4050'
    'dynamicDraw': true
    'thickness': 0.2
    'tickColorizeValues': true
    'skin': 'tron'
    'inputColor': '#1AB394'



window.myDelay = ->
  d = new Date
  s = d.getSeconds()
  #m = d.getMinutes()
  #h = d.getHours()
  $('.second').val(s).trigger "change"
  if s == 0
    $.ajax({
      type: "GET",
      url: "/users/authenticator"
    });