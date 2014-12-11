AuthCtrl = (Auth, $state) ->
    @user = {}
    
    @register = ->
        Auth.register @user
        .then ->
            $state.go 'home'
            
    @login = ->
        Auth.login @user
        .then ->
            $state.go 'home'
    
    return this

angular
.module 'myApp'
.controller 'AuthCtrl', AuthCtrl