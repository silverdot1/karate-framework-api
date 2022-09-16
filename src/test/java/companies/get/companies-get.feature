Feature:  Get a company

  Scenario: Get a company by id and validate by payload on feature
    * call read("../companies-reusable.feature@CreateCompany")
    Given url baseUrl
    And path "companies/"+ companyId
    When method get
    Then status 200
    And match response contains {"id": '#string',"createdAt":'#string',"updatedAt": '#string',name:'#string', description: '#string',status: '#number'}

  Scenario: Get a company by id and validate by a schema .json
    * call read("../companies-reusable.feature@CreateCompany")
    * def companyJson = read("../company.json")
    Given url baseUrl
    And path "companies/"+ companyId
    When method get
    Then status 200
    And match response contains companyJson


  Scenario: Get 400 bad request company by sending a wrong company Id
    * call read("../companies-reusable.feature@CreateCompany")
    * def errorJsonStructure = read("../../helpers/error-message.json")
    Given url baseUrl
    And path "companies/"+ companyId + "123"
    When method get
    Then status 400
    And match response contains errorJsonStructure


  Scenario: Get a list of companies
    Given url baseUrl
    And path "companies/"
    When method get
    Then status 200
    And match response.* contains {"id": '#string',"createdAt":'#string',"updatedAt": '#string',name:'#string', description: '#string',status: '#number? _ > 0'}

# It fails because the status expected should be 1
#  Scenario: Get a list of companies
#    Given url baseUrl
#    And path "companies/"
#    When method get
#    Then status 200
#    And match response.* contains {"id": '#string',"createdAt":'#string',"updatedAt": '#string',name:'#string', description: '#string',status: '#number? _ = 0'}

