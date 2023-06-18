Feature:  Remote Tasks
  #@report=false

  Background:  Check for Remote Tasks
    # Set the Auth credentials here
    * configure headers = read('data/headers.js')
    # Change the environment for other API
    * def ENV = 'v1'

  @SchemaCheck   @Task
  Scenario:  Check for Task GET
    Given url 'https://api-beta.lightmetrics.co/v1/device-management/devices/353436105011125/tasks?taskType=disableCameraRecording'
    When method GET
    Then status 200
    And print response


  @SchemaCheck   @Task
  Scenario:  Check for Post Task
    Given url 'https://api-beta.lightmetrics.co/v1/device-management/devices/353436105011125/tasks'
    * def header = {"taskType": "disableCameraRecording", "temporaryTripBlocking": true,"temporaryTripBlockingEndTimestamp": "2023-04-19T11:34:26Z" }
    When request header
    And method POST
    Then status 200
    And print response


  @SchemaCheck  @TrackingEvent
  Scenario:  Check for Post Task
    Given url 'https://api-beta.lightmetrics.co/v1/device-management/devices/353436105011125/device-tracking-events?uniqueEventTypes=true'
    And method GET
    Then status 200
    And print response
