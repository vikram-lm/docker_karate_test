Feature:  Get Trip API List

  Background:  Check for all Trip related Details
	# Set the Auth credentials here
    * configure headers = read('data/headers.js')
	# Change the environment for other API
    * def ENV = 'v1'
    * def TestURL = 'https://api-beta.lightmetrics.co/'

  Scenario:  Get List of All Trip API's to test  #1
    Given url TestURL+'/v1/fleets/qatest001/drivers/vikramqa/trips/trip_master_2023_03_01_08_56_42_651_9319C38F62212DA39393BA457EBC6D8CDC5A7D2E_pUGqj'
    When method GET
    Then status 200
    And print response


  Scenario: Get Param List   #1
    Given url TestURL+'/v1/fleets/qatest001/drivers/vikramqa/trips/trip_master_2023_03_01_08_56_42_651_9319C38F62212DA39393BA457EBC6D8CDC5A7D2E_pUGqj' +'?includeViolations=true&includePathInfo=false&includeCustomEvents=true&includeDebug=false&includeUploadRequests=false&includeUploadStats=true&includeInertialSensorData=true&includeFRResults=true&includeTripConfig=true&excludeChallengeAcceptedViolations=true'
    When method GET
    Then status 200
    And print response


  Scenario: Get Trips with eventIndex
    Given url TestURL+'/v1/fleets/qatest001/drivers/vikramqa/trips/trip_master_2023_03_01_08_56_42_651_9319C38F62212DA39393BA457EBC6D8CDC5A7D2E_pUGqj/events/13' +'?includeInertialSensorData=true'
    When method GET
    Then status 200
    And print response


