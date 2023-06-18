Feature:  Get Asset API List


  Background:  Check for all Asset related Details
    * configure headers = read('data/headers.js')
    # Change the environment for other API
    * def ENV = 'v1'


  Scenario:  Get List of All assets -All Assets List/History
    Given url 'https://api-beta.lightmetrics.co'+'/v1/assets'
    When method GET
    Then status 200
    And print response


  Scenario: Get Aggregate
    Given url 'https://api-beta.lightmetrics.co'+'/v1/fleets/qatest001/assets/353436105011125/aggregate/violations'
    When method GET
    Then status 200
    And print response


  Scenario: Get Asset list
    Given url 'https://api-beta.lightmetrics.co'+'/v1/fleets/qatest001/assets'
    When method GET
    Then status 200
    And print response

  Scenario: Get Latest trips
    Given url 'https://api-beta.lightmetrics.co'+'/v1/fleets/qatest001/latest-trips-by-asset-id'
    When method GET
    Then status 200
    And print response

  Scenario: Get Incorrect Camera Mounting
    Given url 'https://api-beta.lightmetrics.co'+'/v1/incorrect-camera-mounting/assets'
    When method GET
    Then status 200
    And print response
	

