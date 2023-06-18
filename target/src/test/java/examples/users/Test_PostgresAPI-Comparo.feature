Feature: Compare Clouant and Postgres API responses
  #@report=false

  Background:  Test Drivername
    # Set the Auth credentials here
    * configure headers = read('data/headers.js')
    # Change the environment for other API
    * def ENV = 'v1'
      #LIST Fleet Drivers : https://api-beta.lightmetrics.co/v2/fleets/{fleetId}/drivers/{driverId}/trips
  Scenario: LIST Fleet Drivers
    * def FleetDriverList = read('data/V2/V2FleetDrivers.json')
    Given url 'https://api-beta.lightmetrics.co'+'/v2/'+'fleets/lmfleet001-Pushkar/drivers/pushkar001/trips'
    When method GET
    Then status 200
    And match response == FleetDriverList
    And print response

      #LIST DVR Stats: https://api-beta.ightmetrics.co/v2/dvr-requests/aggregate
  Scenario: LIST DVR Stats
    * def DVRAggregate = read('data/V2/V2DVRAggregate.json')
    Given url 'https://api-beta.lightmetrics.co'+'/v2/'+'dvr-requests/aggregate'
    When method GET
    Then status 200
    And match response == DVRAggregate
    And print response

      #LIST Fleet Trips :  https://api-beta.lightmetrics.co/v2/fleets/{fleetId}/trips
  Scenario: LIST Fleet Trips
    * def Fleettrips = read('data/V2/V2Fleettrips.json')
    Given url 'https://api-beta.lightmetrics.co'+'/v2/'+'fleets/lmfleet001-Pushkar/assets/864281042307489-4/trips'
    When method GET
    Then status 200
    And match response == Fleettrips
    And print response

      #List Asset Fleet Trips :https://api-beta.lightmetrics.co/v2/fleets/{fleetId}/assets/{assetId}/trips
  Scenario: List Asset Fleet Trips
    * def AssetFleettrips = read('data/V2/V2AssetFleetTrips.json')
    Given url 'https://api-beta.lightmetrics.co'+'/v2/'+'fleets/lmfleet001-Pushkar/assets/864281042307489-4/trips'
    When method GET
    Then status 200
    And match response == AssetFleettrips
    And print response

      #List Fleet Asset Trip Aggregate : https://api-beta.lightmetrics.co/v2/fleets/{fleetId}/assets/{assetId}/aggregate
  Scenario: List Fleet Asset Trip Aggregate
    * def FleetAssetTripAggregate = read('data/V2/V2FleetAssetTripsAggregate.json')
    Given url 'https://api-beta.lightmetrics.co'+'/v2/'+'fleets/lmfleet001-Pushkar/assets/864281042307489-4/aggregate'
    When method GET
    Then status 200
    And match response == FleetAssetTripAggregate
    And print response

      #List Device Trips : https://api-beta.lightmetrics.co/v2/fleets/{fleetId}/devices/{deviceId}/trips
  Scenario: List Device Trips
    * def DeviceTrips = read('data/V2/V2DeviceTrips.json')
    Given url 'https://api-beta.lightmetrics.co'+'/v2/'+'fleets/lmfleet001-Pushkar/devices/864281042307489/trips'
    When method GET
    Then status 200
    And match response == DeviceTrips
    And print response

      #List Device Aggregate Trips :https://api-beta.lightmetrics.co/v2/fleets/{fleetId}/devices/{deviceId}/aggregate/trips
  Scenario: List Device Aggregate Trips
    * def ListDeviceTripaggregate = read('data/V2/V2ListDeviceTripAggregate.json')
    Given url 'https://api-beta.lightmetrics.co'+'/v2/'+'fleets/lmfleet001-Pushkar/devices/864281042307489/aggregate/trips'
    When method GET
    Then status 200
    And match response == ListDeviceTripaggregate
    And print response
