App.controller 'PostsCtrl', ($scope, $interval, Post) ->
  # 初期表示時の投稿フォーム初期値
  $scope.newPost = { author: '名無しさん', body: '' }

  # postを全件取得
  Post.query (posts) ->
    $scope.posts = posts
    $interval fetchUnread, 2 * 1000  #未読分を２秒毎に取得する

  # 未読分の取得
  fetchUnread = ->
    lastId = $scope.posts[$scope.posts.length - 1].id
    Post.query 'q[id_gt]': lastId, (posts) ->
      $scope.posts.push.apply($scope.posts, posts)

  # submit時に呼び出される
  $scope.create = ->
    # 保存
    post = Post.save($scope.newPost)
    # 入力フォームのクリア（投稿したお名前は引き継ぐ）
    $scope.newPost = { author: post.author, body: '' }
    # 未読postの取得
    fetchUnread()
