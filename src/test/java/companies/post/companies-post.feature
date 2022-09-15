Feature:  Create a company on project API

  Background:
    * url baseUrl
    * path "/companies"
    * request {"name":"#(companyName)","description":"#(description)"}

  Scenario Outline: Post a company
    When method post
    Then status 201

    Examples:
    |companyName       |  description        |
    |Samsung           |  Technology         |
    |Sony              |  Entertainment      |
    |Nokia             |  Cellphones         |


