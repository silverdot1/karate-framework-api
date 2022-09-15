@ignore
Feature: Generate a bearer Token

  Scenario: Generate a Token by sending admin credentials
    Given url baseUrl
    And path "/token"
    And request { "username": "#(userName)", "password": "#(userPassword)" }
    When method post
    Then status 200
    * def authToken = response.token