HomeCtrl = (Auth, $scope, posts, PostService) ->
    @post =
        'text': ''
        'title': ''

    @posts = PostService.posts

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

    @loadMore = (promise) ->
      PostService.loadMore()
        .then ->
          promise.resolve()

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


PostService = ($http, $q) ->
    @posts = []
    @page = 1
    @last_page = 1

    @vote = (post) ->
        return $http
            .put '/api/v1/posts/' + post.id + '/vote.json'
            .success ->
                post.votes += 1

    @list = =>
        return $http
            .get '/api/v1/posts.json'
            .success (data) =>
                @posts = data.posts if data.posts
                @last_page = data._links.last_num

    @get = (id) =>
        return $http
            .get '/api/v1/posts/' + id + '.json'

    @create = (post) =>
        return $http
            .post '/api/v1/posts.json', post
            .success (data) =>
                @posts.unshift(data)
                console.log @posts

    @comment = (comment, post) =>
        return $http
            .post '/api/v1/posts/' + post.id + '/comments.json', comment
            .success (data) =>
                post.comments.push(data)

    @loadMore = () =>
        if @page + 1 > @last_page
            deferred = $q.defer()
            deferred.resolve()
            return deferred.promise
        @page++
        return $http
            .get "/api/v1/posts.json?page=#{@page}"
            .success (data) =>
                if data.posts
                  angular.forEach data.posts, (post) =>
                      @posts.push(post)

    return this

angular
.module 'myApp'
.controller 'HomeCtrl', HomeCtrl
.controller 'PostCtrl', PostCtrl
.service 'PostService', PostService
