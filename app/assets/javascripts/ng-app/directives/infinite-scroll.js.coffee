infiniteScroll = ($window, $q) ->
  return {
    scope:
      infiniteScroll: '&'

    link: (scope, elem, attrs) ->
      scrolling = false

      angular.element($window).bind 'scroll', ->
        at_bottom = elem[0].offsetParent?.offsetTop + elem[0].offsetHeight < $window.scrollY + $window.innerHeight - 10
        if not scrolling and at_bottom
          scrolling = true
          deferred = $q.defer()
          scope.infiniteScroll({ promise: deferred })
          deferred.promise.then ->
            scrolling = false
  }

angular
  .module 'infiniteScroll', []
  .directive 'infiniteScroll', infiniteScroll
