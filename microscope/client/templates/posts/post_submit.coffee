Template.postSubmit.events
    "submit form": (e) ->
        e.preventDefault()

        post =
            url: $(e.target).find("[name=url]").val()
            title: $(e.target).find("[name=title]").val()

        Meteor.call "postInsert", post, (error,result) ->
            return alert(error.reason) if error

            alert("This link has already been posted") if result.postExists

            Router.go "postPage",
                _id: result._id
