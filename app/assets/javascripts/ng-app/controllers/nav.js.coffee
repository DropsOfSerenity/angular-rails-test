NavCtrl = (Auth) ->
    @logged_in = Auth.isAuthenticated
    @logout = Auth.logout

    return this

angular
.module 'myApp'
.controller 'NavCtrl', NavCtrl