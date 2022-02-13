@debug
Feature: Tests for the home page

  Background: Define URL
    Given url 'https://conduit.productionready.io/api/'


  Scenario: Get all tags
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains ['welcome', 'implementations']
    And match response.tags !contains 'truck'
    And match response.tags == "#array"
    And  match each response.tags == "#string"


    Scenario: Get articles from the page
      Given params { limit:10, offset:0}
      Given path 'articles'
      When method Get
      Then status 200
      And match response.articles == '#[3]'
      And match response.articlesCount == 3




  
