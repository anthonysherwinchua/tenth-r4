#= require_self
#= require jquery
#= require jquery-ui
#= require jquery_ujs
#= require bootstrap-sprockets
#= require data-confirm-modal
#= require_tree ./admin

window.Tenth ||= {}
Tenth.Views ||= {}
Tenth.Views.Admin_JobOpenings ||= {}

Tenth.init = ->
  dataConfirmModal.setDefaults
    title: "Confirm your action"
    commit: "Continue"
    cancel: "Cancel"

  appData = $('body').data()
  if viewName = appData['view']
    [viewsClass, viewName] = viewName.split(".")
    if appData['environment'] == 'development'
      console.log(viewsClass, viewName)
    if Tenth.Views[viewsClass]?[viewName]?
      (window.view = new Tenth.Views[viewsClass][viewName]).render()
    if Tenth.Views[viewsClass]?["Common"]?
      (new Tenth.Views[viewsClass]["Common"]).render()

  $(document).ready ->
    $(".alert").delay(5000).slideUp()
    return

  $('.modal').on 'show.bs.modal', (e)->
    return

  $('.modal').on 'hidden.bs.modal', (e)->
    $(".alert").addClass("fade")
    return
  return
