Feature: Get Fleet List
 #@report=false

  Background:  Check for Schema
    # Set the Auth credentials here
    * configure headers = read('data/headers.js')
    # Change the environment for other API
    * def ENV = 'v1'
  Scenario: Get Driver List
    Given url 'https://api-beta.lightmetrics.co'+'/v1/fleets/qatest001/drivers/vikramqa/violations/aggregate' + '?limit=500&skip=0'
    When method GET
    Then status 200
    And print response
    And match response.totalViolations == '#present'
	#And match each response.rows[0] == schema
    #And match each response.rows == '#[] schema'


  Scenario: Get Driver Violations  #Vikram
    Given url 'https://api-beta.lightmetrics.co'+'/v1//fleets/qatest001/drivers/vikramqa/violations' + '?limit=500&skip=0'
    When method GET
    Then status 200
    And print response
  Scenario: Get Driver Violations  #PUSHKAR
    Given url 'https://api-qa.lightmetrics.co'+'/v1//fleets/qatest001/drivers/vikramqa/violations' + '?limit=500&skip=0'
    When method GET
    Then status 200
    And print response

  Scenario: Get Driver DVR request
    Given url 'https://api-beta.lightmetrics.co'+'/v1/fleets/qatest001/drivers/vikramqa/uploadRequests' + '?limit=500&skip=0'
    When method GET
    Then status 200
    And print response


  Scenario: Get Driver Trips
    Given url 'https://api-beta.lightmetrics.co'+'/v1//fleets/qatest001/drivers/vikramqa/trips' + '?limit=500&skip=0'
    When method GET
    Then status 200
    And print response


  Scenario: Get Driver Aggregate
    Given url 'https://api-beta.lightmetrics.co'+'/v1/fleets/qatest001/drivers/vikramqa/aggregate' + '?limit=500&skip=0'
    When method GET
    Then status 200
    And print response
