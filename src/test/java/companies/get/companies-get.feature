Feature:  Get a company

  Scenario: Get a company by id
    * call read("../companies-reusable.feature@CreateCompany")
    Given url baseUrl
    And path "companies/"+ companyId
    When method get
    Then status 200
    And match response contains {"id": '#string',"createdAt":'#string',"updatedAt": '#string',name:'#string', description: '#string',status: '#number'}

  Scenario: Get 400 bad request company by sending a wrong company Id
    * call read("../companies-reusable.feature@CreateCompany")
    Given url baseUrl
    And path "companies/"+ companyId + "123"
    When method get
    Then status 400


  Scenario: Get a list of companies
    Given url baseUrl
    And path "companies/"
    When method get
    Then status 200
    And match response.* contains {"id": '#string',"createdAt":'#string',"updatedAt": '#string',name:'#string', description: '#string',status: '#number'}


  @ignore
  Scenario: Get a list of companies
    Given url baseUrl
    And path "companies/"
    When method get
    Then status 200
    And match response.* contains {"id": '#string',"createdAt":'#string',"updatedAt": '#string',name:'#string', description: '#string',status: '#number'}


    # since the DbUtils returns a Java Map, it becomes normal JSON here !
    # which means that you can use the full power of Karate's 'match' syntax
    * def dogs = db.readRows('SELECT * FROM public.company')
    * match dogs contains { ID: '#(id)', NAME: 'Scooby' }

