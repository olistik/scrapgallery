# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#upload').transloadit
    wait: true
    modal: false
    onProgress: (bytesReceived, bytesExpected) ->
      progress = (bytesReceived / bytesExpected * 100).toFixed(2) + '%'
      console.debug "current progress: #{bytesReceived}/#{bytesExpected} #{progress}"
      $('#progress').html progress
    onStart: (assembly) ->
      console.debug "onStart:", assembly
    onUpload: (upload) ->
      console.debug "onUpload:", upload
    onResult: (step, result) ->
      $('#results').append "<li><img src=\"#{result.url}\" /></li>"
      console.debug "onResult:", step, result
    onError: (assembly) ->
      console.debug "onError:", assembly
    onSuccess: (assembly) ->
      console.debug "onSuccess:", assembly
    autoSubmit: false

