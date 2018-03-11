# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.project = window.project or {}
((pages, $) ->
  
  pages.showAccountTypeInformation = () ->
    
    $(document).off "change", "#company_plan"
    $(document).on "change", "#company_plan", ->
      console.log "Select was changed"

      if $(@).val() == "1"
      	console.log "StartUp"

      	$("#startup").css("display", "block");
      	$("#expanding").css("display", "none");
      	$("#business").css("display", "none");
      	$("#enterprise").css("display", "none");

      else if $(@).val() == "2"
      	console.log "Expanding"

      	$("#startup").css("display", "none");
      	$("#expanding").css("display", "block");
      	$("#business").css("display", "none");
      	$("#enterprise").css("display", "none");

      else if $(@).val() == "3"
      	console.log "Business"

      	$("#startup").css("display", "none");
      	$("#expanding").css("display", "none");
      	$("#business").css("display", "block");
      	$("#enterprise").css("display", "none");

      else if $(@).val() == "4"
      	console.log "Enterprise"

      	$("#startup").css("display", "none");
      	$("#expanding").css("display", "none");
      	$("#business").css("display", "none");
      	$("#enterprise").css("display", "block");

  pages.showUserRegistrationType = () ->
    
    $(document).off "change", "#position"
    $(document).on "change", "#position", ->
      console.log "Registration Type was changed"

      if $(@).val() == "CEO"
      	console.log "CEO"

      	$("#companyName").css("display", "block");
      	$("#ceoemail").css("display", "none");
      	$("#manageremail").css("display", "none");
      	$("#payment").css("display", "block");

      	$("#startup").css("display", "block");
      	$("#expanding").css("display", "none");
      	$("#business").css("display", "none");
      	$("#enterprise").css("display", "none");

      else if $(@).val() == "MAN"
      	console.log "Manager"

      	$("#companyName").css("display", "none");
      	$("#ceoemail").css("display", "block");
      	$("#manageremail").css("display", "none");
      	$("#payment").css("display", "none");

      	$("#startup").css("display", "none");
      	$("#expanding").css("display", "none");
      	$("#business").css("display", "none");
      	$("#enterprise").css("display", "none");

      else if $(@).val() == "EMP"
      	console.log "Employee"

      	$("#companyName").css("display", "none");
      	$("#ceoemail").css("display", "none");
      	$("#manageremail").css("display", "block");
      	$("#payment").css("display", "none");

      	$("#startup").css("display", "none");
      	$("#expanding").css("display", "none");
      	$("#business").css("display", "none");
      	$("#enterprise").css("display", "none");
    
) window.project.pages = window.project.pages or {}, jQuery
