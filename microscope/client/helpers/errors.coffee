@Errors = new Mongo.Collection(null)
throwError = (message) ->
  Errors.insert message: message
