Feature: Articles

  Background: Define URL
    Given url 'https://api.realworld.io/api/'

    Scenario: Create a new article
      Given path 'users/login'
      And request {"user": {"email": "malika@123","password": "malika123"}}
      When method Post
      Then status 200
      * def token = response.user.token

      Given header Authorization = 'Token ' + token
      Given path 'articles'
      And request {"article": {"tagList": [],"title": "bla bla8","description": "test","body": "blablabla"}}
      When method Post
      Then status 200
      And match response.article.title == 'bla bla8'


