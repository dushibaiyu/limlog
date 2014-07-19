#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require nprogress
#= require nprogress-turbolinks
#= require entries

NProgress.configure
  ease: 'ease'
  speed: 500

$(document).ready ->
  $(window).bind 'scroll', ->
    if $(window).scrollTop() > $('#site-header').height()
      $('#site-navbar').addClass('fixed-top')
    else
      $('#site-navbar').removeClass('fixed-top')

  $(document).on 'mouseover, .submenu', '.has-submenu', ->
    $(this).children('.submenu').fadeIn()
  $(document).on 'mouseout', '.has-submenu', ->
    $(this).children('.submenu').fadeOut()
