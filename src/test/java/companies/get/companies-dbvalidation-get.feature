Feature: Get a company by id and validate the data persisted on DB postgresql
  As an Admin User
  I want to create a company and retrieve the company created by id
  so that I can validate if the company data is persisted on DB

  Background:
    * def config = { username: 'postgres', password: 'brain2021', url: 'jdbc:postgresql://localhost:5432/brain', driverClassName: 'org.postgresql.Driver' }
    * def DbUtils =  Java.type('helpers.DbUtils')
    * def db = new DbUtils(config)
    * def dataParser = Java.type('helpers.DataParser')



  Scenario: Create a company and save the Id, then list the company by the id saved and validate if the data is persisted on DB postgresql
    * call read("../companies-reusable.feature@CreateCompany")
    * def companyIdRetrieved = db.readValue("SELECT id FROM public.company c WHERE c.id =" + "'"+companyId+"'" )
    * def companyIdRetrievedDB = dataParser.parseUUIDToString(companyIdRetrieved)

    Given url baseUrl
    And path "companies/"+ companyId
    When method get
    Then status 200
    * match companyId == companyIdRetrievedDB
    * print 'Id sent to database: ' + companyId
    * print 'ID retrieved from the database: ' + companyIdRetrievedDB




## Example connection to db-mysql
#Feature: connection to db
#
#  Background:
#    # use jdbc to validate
#    * def config = { username: 'root', password: '', url: 'jdbc:mysql://localhost:3306/dbtest', driverClassName: 'com.mysql.cj.jdbc.Driver' }
#    * def DbUtils =  Java.type('companies.get.DbUtils')
#    * def db = new DbUtils(config)
#
#  Scenario: get company
#    * def companies = db.readRows("SELECT name FROM company WHERE company.name='HBO'")
#    Then print 'company---', companies




