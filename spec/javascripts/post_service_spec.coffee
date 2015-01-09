describe 'Post Service', ->
  PostService = $httpBackend = null

  beforeEach ->
    module('templates')
    module('myApp')

  beforeEach(inject((_PostService_, _$httpBackend_) ->
    PostService = _PostService_
    $httpBackend = _$httpBackend_
  ))

  it 'should set it\'s posts when calling #list', ->
    response = [
      { "id": 1 }
    ]
    $httpBackend.whenGET('/api/v1/posts.json')
      .respond(response)

    PostService.list()
      .then (data) ->
        expect(PostService.posts).toEqual(response)

    $httpBackend.flush()

  it 'should push created posts onto the posts array', ->
    response = { "id": 2 }
    $httpBackend.whenPOST('/api/v1/posts.json')
      .respond(response)

    PostService.create({ "body": "hello" })
      .then (data) ->
        expect(PostService.posts.pop()).toEqual(response)

    $httpBackend.flush()
