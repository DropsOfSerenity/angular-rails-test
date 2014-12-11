angular
.module 'myApp', [
    'ngAnimate',
    'templates',
    'ui.router'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
    $stateProvider
    .state 'home',
        url: '/'
        templateUrl: 'home.html'
        controller: 'HomeCtrl as home_ctrl'

    .state 'dashboard',
        abstract: true
        url: '/dashboard'
        templateUrl: 'dashboard/layout.html'
    
    .state 'dashboard.one',
        url: ''
        templateUrl: 'dashboard/one.html'

    .state 'dashboard.two',
        url: '/two'
        templateUrl: 'dashboard/two.html'
    
    .state 'dashboard.three',
        url: '/three'
        templateUrl: 'dashboard/three.html'
        

    $urlRouterProvider.otherwise '/'

    # enable HTML5 Mode for SEO
    $locationProvider.html5Mode true