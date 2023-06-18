Feature: Test LMBE-379
  #@report=false

  Background:  Test Drivername
    # Set the Auth credentials here
    * configure headers = read('data/headers.js')
    # Change the environment for other API
    * def ENV = 'v1'

  Scenario: Test Fleet trips
    Given url 'https://api-beta.lightmetrics.co'+'/v1/fleets/qatest001/trips'
    When method GET
    Then status 200
    And response.drivername == 'vikramqa'
    And match response.hasDriverCamera == true
    And print response

  Scenario: Test Driver trips
    Given url 'https://api-beta.lightmetrics.co/'+'v1/fleets/qatest001/drivers/vikramqa/trips'
    When method GET
    Then status 200
    And response.drivername == 'vikramqa'
    And print response

  Scenario: Test Device trips
    Given url 'https://api-beta.lightmetrics.co/'+'v1/fleets/qatest001/devices/353436105011125/trips'
    When method GET
    Then status 200
    And response.drivername == 'vikramqa'
    And print response

  Scenario: Test Asset trips
    Given url 'https://api-beta.lightmetrics.co'+'/v1/fleets/qatest001/assets/353436105011125/trips'
    When method GET
    Then status 200
    And response.drivername == 'vikramqa'
    And print response


  Scenario: Test Fleet trip by IgnitionID
    Given url 'https://api-beta.lightmetrics.co'+'/v1/fleets/qatest001/ignitions/ignition_2023_04_12_14_50_53_883_353436105011125_MkET2/trips'
    When method GET
    Then status 200
    And response.drivername == 'vikramqa'
    And print response

  Scenario: Test Fleet LatestTrips
    Given url 'https://api-beta.lightmetrics.co'+'/v1/fleets/qatest001/latest-trips-by-asset-id'
    When method GET
    Then status 200
    And response.drivername == 'vikramqa'
    And print response