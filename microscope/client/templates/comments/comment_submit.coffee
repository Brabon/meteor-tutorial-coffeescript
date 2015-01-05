Template.commentSubmit.created = ->
  Session.set "commentSubmitErrors", {}
  return

Template.commentSubmit.helpers
  errorMessage: (field) ->
    Session.get("commentSubmitErrors")[field]

  errorClass: (field) ->
    (if !!Session.get("commentSubmitErrors")[field] then "has-error" else "")

Template.commentSubmit.events "submit form": (e, template) ->
  e.preventDefault()
  $body = $(e.target).find("[name=body]")
  comment =
    body: $body.val()
    postId: template.data._id

  errors = {}
  unless comment.body
    errors.body = "Please write some content"
    return Session.set("commentSubmitErrors", errors)
  Meteor.call "commentInsert", comment, (error, commentId) ->
    if error
      throwError error.reason
    else
      $body.val ""
    return

  return
