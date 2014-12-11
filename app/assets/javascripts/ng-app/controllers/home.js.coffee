HomeCtrl = ->
    @things = ['AngularJS', 'Rails']
    
    return this

angular
.module 'myApp'
.controller 'HomeCtrl', HomeCtrl

