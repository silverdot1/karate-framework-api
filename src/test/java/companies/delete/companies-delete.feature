Feature: Delete a company by id

  Scenario: Delete a company by getting a created user
    * call read("../companies-reusable.feature@CreateCompany")
    Given url baseUrl
    And path "companies/"+ companyId
    When method delete
    Then status 200
