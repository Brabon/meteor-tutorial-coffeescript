Template.errors.helpers errors: ->
  Errors.find()

Template.error.rendered = ->
    error = @data
    Meteor.setTimeout(->
        Errors.remove error._id
        ) 3000
