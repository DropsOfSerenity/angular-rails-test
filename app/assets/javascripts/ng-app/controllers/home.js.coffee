HomeCtrl = (Auth, $scope, posts, PostService) ->
    @post =
        'text': ''
        'title': ''

    @posts = posts.data

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
        PostService.create(@post)
        @post = {}

    return this

PostService = ($http) ->
    @posts = [];

    @list = =>
        return $http
            .get '/posts.json'
            .success (data) =>
                @posts = data;

    @create = (post) =>
        return $http
            .post '/posts.json', post
            .success (data) =>
                @posts.push(data)

    return this

angular
.module 'myApp'
.controller 'HomeCtrl', HomeCtrl
.service 'PostService', PostService

