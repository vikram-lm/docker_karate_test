Feature:   To Match Schema for responses
  #@report=false

  Background:  Check for all Asset related Details
    # Set the Auth credentials here
    * configure headers = read('data/OAuth2-Vikram.js')
    # Change the environment for other API
    * def ENV = 'v1'

  @SchemaCheck   @channel
  Scenario:  Check for Software ID
    * def SoftwareIDList = read('data/SoftwareIDList.json')
    Given url 'https://api-beta.lightmetrics.co/'+ENV+'/device-management/software/softwareIds'
    When method GET
    Then status 200
    And print response
    And match response == SoftwareIDList
    #* def Software = ["LM_RIDEVIEW","LM_UPDATES_AGENT","FIRMWARE0","FIRMWARE1","FIRMWARE2","LM_MITAC_MODEM_FIRMWARE","FIRMWARE0_1"]
    #And match Software == response.softwareIds.softwareId


  @software @channel
  Scenario Outline:  Check for SOFTWARE_RESOURCES
    Given url 'https://api-beta.lightmetrics.co/'+ENV+'/device-management/software/<Software>/releases'
    And param includeIncrementalUpdates = true
    And param includePrerelease = true
    When method GET
    Then status 200
    And print response
    And print response.versions
    And match  response.versions contains {"semver": #string, "deviceModel": #string, "downloadLink" : #string,"createdAt" : #string, "md5sum" : #string,  "prerelease" : #boolean, "sizeBytes" : #number,  "globallyApproved" : #boolean}
    #And match each response.versions.semver == #present
      #* def Software = ["LM_RIDEVIEW","","FIRMWARE0","FIRMWARE1","FIRMWARE2","LM_MITAC_MODEM_FIRMWARE","FIRMWARE0_1"]
    Examples:LM_UPDATES_AGENT
      | Software         |
      | LM_RIDEVIEW      |
      | LM_UPDATES_AGENT |
      | FIRMWARE0        |
      | FIRMWARE1        |
      | FIRMWARE2        |


  @SchemaCheck @Audio  @channel
  Scenario:  Check for AUDIO_FILES
    Given url 'https://api-beta.lightmetrics.co/'+ENV+'/resources/audio-alerts'
    And param languageCode = 'en-US'
    When method GET
    Then status 200
    And print response
    And assert response.languagePacks[0].languageCode =='en-US'
    * def Audio = ["NEW_DRIVER_ID","TRIP_STARTED","TRIP_ENDED","CALIBRATION_COMPLETE","LANE_DRIFT","LANE_DEPARTURE","TAILGATING_WARNING","TAILGATING_VIOLATED","STOP_SIGN_DETECTED","STOP_SIGN_VIOLATED","SPEED_SIGN_DETECTED","SPEED_SIGN_DETECTED_SCHOOL_ZONE","SPEEDING_VIOLATION","HARSH_CORNERING","HARSH_BRAKING","HARSH_ACCELERATION","ANOMALY","SPEED_UPPER_LIMIT_REACHED","DRIVER_DISTRACTION_WARNING","DRIVER_DISTRACTION_VIOLATION","SHUTTING_DOWN","WIFI_CONNECTED","WIFI_DISCONNECTED","EXTERNAL_VIDEO_CAPTURE_STARTED","EXTERNAL_IMAGE_CAPTURED","STOPPING_DVR","NUMBER_10","NUMBER_15","NUMBER_20","NUMBER_25","NUMBER_30","NUMBER_35","NUMBER_40","NUMBER_45","NUMBER_50","NUMBER_55","NUMBER_60","NUMBER_65","NUMBER_70","NUMBER_75","NUMBER_80","NUMBER_85","NUMBER_90","NUMBER_95","NUMBER_100","NUMBER_105","NUMBER_110","NUMBER_115","NUMBER_120","DRIVER_UNASSIGNED","DROWSY_DRIVING_VIOLATION","SPEEDING_WARNING"]
    * def keys = karate.keysOf(response.languagePacks[0].audio)
    And match karate.keysOf(response.languagePacks[0].audio) == Audio

  @SchemaCheck @Audio
  Scenario:  Check for AUDIO RESOURCES
    Given url 'https://api-beta.lightmetrics.co/'+ENV+'/resources/audio-alerts'
    When method GET
    Then status 200
    And print response
    * def keys = karate.keysOf(response.languagePacks[0].audio)
    And print response.languagePacks[0].audio
    And match  keys ==  ["NEW_DRIVER_ID","TRIP_STARTED","TRIP_ENDED","CALIBRATION_COMPLETE","LANE_DRIFT","LANE_DEPARTURE","TAILGATING_WARNING","TAILGATING_VIOLATED","STOP_SIGN_DETECTED","STOP_SIGN_VIOLATED","SPEED_SIGN_DETECTED","SPEED_SIGN_DETECTED_SCHOOL_ZONE","SPEEDING_VIOLATION","HARSH_CORNERING","HARSH_BRAKING","HARSH_ACCELERATION","ANOMALY","SPEED_UPPER_LIMIT_REACHED","DRIVER_DISTRACTION_WARNING","DRIVER_DISTRACTION_VIOLATION","SHUTTING_DOWN","WIFI_CONNECTED","WIFI_DISCONNECTED","EXTERNAL_VIDEO_CAPTURE_STARTED","EXTERNAL_IMAGE_CAPTURED","STOPPING_DVR","NUMBER_10","NUMBER_15","NUMBER_20","NUMBER_25","NUMBER_30","NUMBER_35","NUMBER_40","NUMBER_45","NUMBER_50","NUMBER_55","NUMBER_60","NUMBER_65","NUMBER_70","NUMBER_75","NUMBER_80","NUMBER_85","NUMBER_90","NUMBER_95","NUMBER_100","NUMBER_105","NUMBER_110","NUMBER_115","NUMBER_120","DRIVER_UNASSIGNED","DROWSY_DRIVING_VIOLATION","SPEEDING_WARNING"]