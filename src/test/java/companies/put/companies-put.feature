Feature:  Edit a company

  Scenario: Edit a company by Id
    * call read("../companies-reusable.feature@CreateCompany")
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def characters = dataGenerator.characters(4,10,true,true)
    * def name = dataGenerator.name()

    Given url baseUrl
    And path "companies/"+ companyId
    And request {"name":#(name),"description": #(characters)}
    When method put
    Then status 200