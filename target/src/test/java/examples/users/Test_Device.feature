Feature:   To check Device schema
  #@report=false

  Background:  Check for all Asset related Details
	# Set the Auth credentials here
    * configure headers = read('data/headers.js')
	# Change the environment for other API
    * def ENV = 'v1'
    * def TestURL = 'https://api-beta.lightmetrics.co/'

  Scenario: Check for Schema - device Lane Calibration
    Given url TestURL+ENV+'/device-management/devices/353436105011125/lane-calibration'
    When method GET
    Then status 200
    And print response
    And match response ==
    """
    {
    "laneCalibration": {
        "slopeLeft": '#number',
        "interceptLeft": '#number',
        "slopeRight": '#number',
        "interceptRight": '#number',
        "bonnetY": '#number',
        "frameWidth": '#number',
        "frameHeight": '#number',
        "calibrationMode": '#string',
        "laneCalibrationInputTimestamp": '#string',
        "laneCalibrationUpdateTimestamp": '#string'
        }
     }
    """

  Scenario: Check for Schema - Device Details
    Given url TestURL+ENV+'/device-management/devices/353436105011125'
    When method GET
    Then status 200
    And print response
    And match response ==
    """
    {
    "deviceModel":'#string',
    "vendorId":  '#string',
    "fleetId":  '#string',
    "fleetName":  '#string',
    "assetId": '#string',
    "provisionedAt":  '#string',
    "provisioned":  '#boolean',
    "status": '#string',
    "reportUpdatedAt": '#string',
    "suppressed":  '#boolean',
    "reportIndex": '#number',
    "dormant": '#boolean',
    "issueCount":  '#number',
    "deviceMetadata": {
        "date_1": '#string',
        "custom_key1": '#string'
                },
    "clientId":  '#string'
      }
      """