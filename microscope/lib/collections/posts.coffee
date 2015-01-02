@Posts = new Mongo.Collection("posts")

@Posts.allow insert: (userID, doc) ->
    !!userId
