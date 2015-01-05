Template.notifications.helpers
  notifications: ->
    Notifications.find
      userId: Meteor.userId()
      read: false


  notificationCount: ->
    Notifications.find(
      userId: Meteor.userId()
      read: false
    ).count()

Template.notificationItem.helpers notificationPostPath: ->
  Router.routes.postPage.path _id: @postId

Template.notificationItem.events "click a": ->
  Notifications.update @_id,
    $set:
      read: true

