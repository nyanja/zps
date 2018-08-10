// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function updateArticleContentHint(value = $("#article-content").text()) {
  $("#article-content-hint").text( value.length + " | " + value.replace(/[^A-zА-я]/g, "").length)
}
