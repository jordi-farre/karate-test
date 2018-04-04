Feature: Testing star wars API

  Scenario: Root endpoint is available
    Given url 'https://swapi.co/'
    When method GET
    Then status 200

  Scenario: People 1 is Luke Skywalker
    Given url 'https://swapi.co/api/people/1/'
    When method GET
    Then status 200
    And match $.name == "Luke Skywalker"

  Scenario: People 1 is Luke Skywalker and it's human
    Given url 'https://swapi.co/api/people/1/'
    When method GET
    Then status 200
    And match $.name == "Luke Skywalker"
    And def specie = $.species[0]
    Given url specie
    When method GET
    Then status 200
    And match $.name == "Human"