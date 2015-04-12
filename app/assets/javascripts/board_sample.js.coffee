window.App = angular.module('BoardSample', ['ngResource', 'ngAnimate'])

# Ajax送信時にトークンを送信
App.config ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    document.getElementsByName("csrf-token")[0].content
