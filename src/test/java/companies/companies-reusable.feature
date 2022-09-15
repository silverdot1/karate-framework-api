@ignore
Feature:  Create a reusable company

  @CreateCompany
  Scenario: Post a company and save the Id
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def name = dataGenerator.name()
    * def description = dataGenerator.characters(10,25,true,true)

    Given url baseUrl
    And path "/companies"
    And request {"name":#(name),"description":  #(description)}
    When method post
    Then status 201
    And def companyId = $.id
