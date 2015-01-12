HomeCtrl = (Auth, $scope, posts, PostService) ->
    @post =
        'text': ''
        'title': ''

    @posts = posts.data.posts

    @logged_in = Auth.isAuthenticated
    @logout = Auth.logout

    Auth.currentUser()
    .then (user) ->
        @user = user

    $scope.$on 'devise:login', (e, user) ->
        @user = user

    $scope.$on 'devise:logout', (e, user) ->
        @user = {}

    @addPost = ->
        PostService.create @post
        @post = {}

    @upvote = (post) ->
        PostService.vote post

    return this

PostCtrl = (post, PostService) ->
    @comment = {}
    @post = post.data

    console.log @post

    @addComment = ->
        PostService.comment(@comment, @post)
        @comment = {}

    @upvote = ->
        PostService.vote(@post)

    return this


PostService = ($http) ->
    @posts = []

    @vote = (post) ->
        return $http
            .put '/api/v1/posts/' + post.id + '/vote.json'
            .success ->
                post.votes += 1

    @list = =>
        return $http
            .get '/api/v1/posts.json'
            .success (data) =>
                @posts = data.posts

    @get = (id) =>
        return $http
            .get '/api/v1/posts/' + id + '.json'

    @create = (post) =>
        return $http
            .post '/api/v1/posts.json', post
            .success (data) =>
                @posts.unshift(data)

    @comment = (comment, post) =>
        return $http
            .post '/api/v1/posts/' + post.id + '/comments.json', comment
            .success (data) =>
                post.comments.push(data)

    return this

angular
.module 'myApp'
.controller 'HomeCtrl', HomeCtrl
.controller 'PostCtrl', PostCtrl
.service 'PostService', PostService
