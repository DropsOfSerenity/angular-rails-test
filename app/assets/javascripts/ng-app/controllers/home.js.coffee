HomeCtrl = (Auth, $scope) ->
    @things = ['AngularJS', 'Rails']

    @logged_in = Auth.isAuthenticated
    @logout = Auth.logout

    Auth.currentUser()
    .then (user) ->
        @user = user

    $scope.$on 'devise:login', (e, user) ->
        @user = user

    $scope.$on 'devise:logout', (e, user) ->
        @user = {}

    return this

angular
.module 'myApp'
.controller 'HomeCtrl', HomeCtrl

