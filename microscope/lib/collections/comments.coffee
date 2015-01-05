@Comments = new Mongo.Collection("comments")

Meteor.methods(
    comment: (commentAttributes) ->

        comment = _.extend(commentAttributes,
            {userId: user._id,
            author: user.username,
            submitted: new Date()})

        Posts.update(comment.postId, {$inc: {commentsCount: 1}})
        comment._id = Comments.insert(comment)

        createCommentNotification(comment)

        comment._id
)
