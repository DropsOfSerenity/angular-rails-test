angular
.module 'myApp', [
    'ngAnimate',
    'templates',
    'ui.router',
    'Devise',
    'infiniteScroll'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider) ->

    $stateProvider

    .state 'register',
        url: '/register'
        templateUrl: 'auth/register.html'
        controller: 'AuthCtrl as auth_ctrl'

    .state 'login',
        url: '/login'
        templateUrl: 'auth/login.html'
        controller: 'AuthCtrl as auth_ctrl'

    .state 'home',
        url: '/'
        templateUrl: 'home.html'
        controller: 'HomeCtrl as home_ctrl'
        resolve:
            'posts': (PostService) ->
                return PostService.list()

    .state 'post',
        url: '/post/:id'
        templateUrl: 'post/post.html'
        controller: 'PostCtrl as post_ctrl'
        resolve:
            'post': (PostService, $stateParams) ->
                console.log $stateParams
                return PostService.get($stateParams.id)

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

    return
