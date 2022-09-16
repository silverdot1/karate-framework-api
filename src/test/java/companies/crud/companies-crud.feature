Feature: Company crud
  As an Admin user
  I want to create, list, edit and delete a company
  So that I can check the company creation workflow
  Background:
    * url baseUrl
    * path "/companies"
    * def dataGenerator = Java.type('helpers.DataGenerator')

  @End2End
  Scenario:  Create, Read, Update and Delete a company
    * def characters = dataGenerator.characters(10,25,true,true)
    * def name = dataGenerator.name()
    # POST
    Given request {"name":#(name),"description":  #(characters)}
    When method post
    Then status 201
    * def companyId = response.id
    # GET
    Given path "companies/" + companyId
    When method get
    Then status 200
    # PUT
    * def characters = dataGenerator.characters(4,10,true,true)
    * def name = dataGenerator.name()
    Given path "companies/" + companyId
    And request {"name":#(name),"description": #(characters)}
    When method put
    Then status 200
    # DELETE
    Given path "companies/" + companyId
    When method delete
    Then status 200
