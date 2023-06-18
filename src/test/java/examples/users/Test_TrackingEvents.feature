Feature:  Get All tracking Events

  #@report=false

  Background:  Check for all Tracking Eventtypes
	# Set the Auth credentials here
    * configure headers = read('data/headers.js')
	# Change the environment for other API
    * def ENV = 'v1'
    * def TestURL = 'https://api-beta.lightmetrics.co/'

  Scenario:  Get List of Unique EventTypes
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?uniqueEventTypes=true&limit=20&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    And print eventList
    * def ExpectedEvent = ["ACCFrequencyNormal","ACCLowFrequency","AppLaunchComplete","AudioAlertLanguagePackUpdate","BadMountingDriverCamera","BadMountingDriverCameraFace","BadMountingDriverCameraFixedFace","BadMountingDriverCameraFixedPose","BadMountingDriverCameraPose","BadMountingInertialSensor","BadMountingInertialSensorFixed","BadMountingRoadCamera","BadMountingRoadCmeraFixed","BatteryStatus","BootComplete","CameraCalibration","CameraMounting","CameraSensorReboot","CameraSensorRebootStopped","CompanionConnected","CompanionDisconnected","ConfigurationChange""CriticalEventLimitExceeded","DVRWriterException","DVRWriterExceptionStopped","DVRWriterSummary","DataNotUploading","DataThrottlingPolicyChange","DataUsageReport","Device-Storage","DeviceSuspended","DownloadedAudioAlertLanguagePack","DriverCameraNotPlugged","EventLimitExceeded","EventSummary","EventsSkipped","GPSFrequencyNormal","GPSLowFrequency","GPSSynced","GSensorMalfunction","IgnitionOFF","IgnitionON","LiveStreamingUpdate","LowBrightness","LowUploadSpeeds","NetworkConnected","NetworkConnectionClosed","NetworkDisconnected","NewSIMDetected","OTADownloadSuccess","OTAFailedToDownloadUpdate","OTAInstallAPKFailed","OTAInstallAPKSuccess","OTAStatusReport","PackageChange","PassiveModeEnded","Ping","PowerCutAlert","Reboot","SDCardFormatFailed","SDCardFormatStartFailed","SDCardFormatStarted","SDCardFormatSuccess","SDCardStatusChanged","SIMStateChanged","ShuttingDown","TimeoutOnFileUpload","TripEnded","TripStarted"]
    And match ExpectedEvent contains eventList


  Scenario Outline:  Get Filter based on each  of <eventType> EventTypes
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=<eventType>'
    When method GET
    Then status 200
    * def eventList = $.events[?(@.eventType)].eventType
    And print eventList
    And match each eventList == '<eventType>'
    And print response

    Examples:
      | eventType                        |
      | ACCFrequencyNormal               |
      | ACCLowFrequency                  |
      | AppLaunchComplete                |
      | AudioAlertLanguagePackUpdate     |
      | BadMountingDriverCamera          |
      | BadMountingDriverCameraFace      |
      | BadMountingDriverCameraFixedFace |
      | BadMountingDriverCameraFixedPose |
      | BadMountingDriverCameraPose      |
      | BadMountingInertialSensor        |
      | BadMountingInertialSensorFixed   |
      | BadMountingRoadCamera            |
      | BadMountingRoadCameraFixed       |
      | BatteryStatus                    |
      | BootComplete                     |
      | CameraCalibration                |
      | CameraMounting                   |
      | CameraSensorReboot               |
      | CameraSensorRebootStopped        |
      | CompanionConnected               |
      | CompanionDisconnected            |
      | ConfigurationChange              |
      | CriticalEventLimitExceeded       |
      | DVRWriterException               |
      | DVRWriterExceptionStopped        |
      | DVRWriterSummary                 |
      | DataNotUploading                 |
      | DataThrottlingPolicyChange       |
      | DataUsageReport                  |
      | Device-Storage                   |
      | DeviceSuspended                  |
      | DownloadedAudioAlertLanguagePack |
      | DriverCameraNotPlugged           |
      | EventLimitExceeded               |
      | EventSummary                     |
      | EventsSkipped                    |
      | GPSFrequencyNormal               |
      | GPSLowFrequency                  |
      | GPSSynced                        |
      | GSensorMalfunction               |
      | IgnitionOFF                      |
      | IgnitionON                       |
      | LiveStreamingUpdate              |
      | LowBrightness                    |
      | LowUploadSpeeds                  |
      | NetworkConnected                 |
      | NetworkConnectionClosed          |
      | NetworkDisconnected              |
      | NewSIMDetected                   |
      | OTADownloadSuccess               |
      | OTAFailedToDownloadUpdate        |
      | OTAInstallAPKFailed              |
      | OTAInstallAPKSuccess             |
      | OTAStatusReport                  |
      | PackageChange                    |
      | PassiveModeEnded                 |
      | Ping                             |
      | PowerCutAlert                    |
      | Reboot                           |
      | SDCardFormatFailed               |
      | SDCardFormatStartFailed          |
      | SDCardFormatStarted              |
      | SDCardFormatSuccess              |
      | SDCardStatusChanged              |
      | SIMStateChanged                  |
      | ShuttingDown                     |
      | TimeoutOnFileUpload              |
      | TripEnded                        |
      | TripStarted                      |


  Scenario: Check Event fields
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    And print eventList
    * def ExpectedEvent = ["ACCFrequencyNormal","ACCLowFrequency","AppLaunchComplete","AudioAlertLanguagePackUpdate","BadMountingDriverCamera","BadMountingDriverCameraFace","BadMountingDriverCameraFixedFace","BadMountingDriverCameraFixedPose","BadMountingDriverCameraPose","BadMountingInertialSensor","BadMountingInertialSensorFixed","BadMountingRoadCamera","BadMountingRoadCmeraFixed","BatteryStatus","BootComplete","CameraCalibration","CameraMounting","CameraSensorReboot","CameraSensorRebootStopped","CompanionConnected","CompanionDisconnected","ConfigurationChange""CriticalEventLimitExceeded","DVRWriterException","DVRWriterExceptionStopped","DVRWriterSummary","DataNotUploading","DataThrottlingPolicyChange","DataUsageReport","Device-Storage","DeviceSuspended","DownloadedAudioAlertLanguagePack","DriverCameraNotPlugged","EventLimitExceeded","EventSummary","EventsSkipped","GPSFrequencyNormal","GPSLowFrequency","GPSSynced","GSensorMalfunction","IgnitionOFF","IgnitionON","LiveStreamingUpdate","LowBrightness","LowUploadSpeeds","NetworkConnected","NetworkConnectionClosed","NetworkDisconnected","NewSIMDetected","OTADownloadSuccess","OTAFailedToDownloadUpdate","OTAInstallAPKFailed","OTAInstallAPKSuccess","OTAStatusReport","PackageChange","PassiveModeEnded","Ping","PowerCutAlert","Reboot","SDCardFormatFailed","SDCardFormatStartFailed","SDCardFormatStarted","SDCardFormatSuccess","SDCardStatusChanged","SIMStateChanged","ShuttingDown","TimeoutOnFileUpload","TripEnded","TripStarted"]
    And match ExpectedEvent contains eventList

  @SchemaCheck
  Scenario: Check for Schema - LowBrightness
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=LowBrightness&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["LowBrightness"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
        """
        {
        "powerState" : '#string',
        "tripId" : '#string',
        "isDebugBuild" : '#string',
        "durationSeconds" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#string',
        "speed" : '#string',
        "accuracy" : '#string',
        "deviceModel" : '#string',
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
        """

  Scenario: Check for Schema - BadMountingDriverCamera
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=BadMountingDriverCamera&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["BadMountingDriverCamera"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
    """
        {
        "powerState" : '#string',
        "tripId" : '#string',
        "latitude" : '#string',
        "longitude" : '#string',
        "bearing" : '#string',
        "speed" : '#string',
        "accuracy" : '#string',
        "deviceModel" : '#string',
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#mumber',
        "timeZoneId" : '#string'
        }
        """

  @SchemaCheck
  Scenario: Check for Schema - GPSFrequencyNormal
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=GPSFrequencyNormal&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["GPSFrequencyNormal"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
    """
    {
      "powerState" : '#string',
      "tripId" : '#string',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
    }
    """

  Scenario: Check for Schema - PowerCutAlert
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=PowerCutAlert&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["PowerCutAlert"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
    """
        {
        "powerState" : '#string',
        "tripId" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "deviceModel" : '#string',
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
        """

  Scenario: Check for Schema - LowUploadSpeeds
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=LowUploadSpeeds&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["LowUploadSpeeds"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
    """
      {
      "powerState" : '#string',
      "tripId" : '#string',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "uploadSpeedKbps" : '#number',
      "downloadSpeedKbps" : '#number',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
      }
        """


  Scenario: Check for Schema - DataUsageReport
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=DataUsageReport&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["DataUsageReport"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
      """
      {
      "powerState" : '#string',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "startTimeUTC" : '#string',
      "endTimeUTC" : '#string',
      "mobileDataUploadedBytes" : '#number',
      "mobileDataDownloadedBytes" : '#number',
      "wifiDataUploadedBytes" : '#number',
      "wifiDataDownloadedBytes" : '#number',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
      }
      """


  Scenario: Check for Schema - IgnitionON
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=IgnitionON&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["IgnitionON"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
      """
      {
      "powerState" : '#string',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "ignitionId" : '#string',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
      }
      """


  Scenario: Check for Schema - IgnitionOFF
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=IgnitionOFF&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["IgnitionOFF"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
         """
      {
      "powerState" : '#string',
      "tripId" : '#string',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "ignitionId" : '#string',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
      }
      """

  Scenario: Check for Schema - Reboot
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=Reboot&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["Reboot"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
         """
      {
      "powerState" : '#string',
      "uptime" : '#number',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
      }
      """


  Scenario: Check for Schema - AppLaunchComplete
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=AppLaunchComplete&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["AppLaunchComplete"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
         """
      {
      "powerState" : '#string',
      "uptime" : '#number',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
      }
      """

  Scenario: Check for Schema - TripStarted
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=TripStarted&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["TripStarted"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
         """
      {
        "powerState" : '#string',
      "oldestDvrTimestamp" : '#string',
      "totalAvailableInternalSpace" : '#number',
      "totalUsedInternalSpace" : '#number',
      "isExternalStorageAvailable" : '#boolean',
      "dvrInternalUsedSpace" : '#number',
      "dvrInternalAvailableSpace" : '#number',
      "spaceUsedForApplicationData" : '#number',
      "isStorageLow" : '#boolean',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "edvrStorageSize" : '#number',
      "isDriverCameraPlugged" : '#boolean',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
      }
      """


  Scenario: Check for Schema - TripEnded
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=TripEnded&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["TripEnded"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
         """
      {
       "powerState" : '#string',
    "tripId" : '#string',
    "oldestDvrTimestamp" : '#string',
    "totalAvailableInternalSpace" : '#number',
    "totalUsedInternalSpace" : '#number',
    "isExternalStorageAvailable" : '#boolean',
    "dvrInternalUsedSpace" : '#number',
    "dvrInternalAvailableSpace" : '#number',
    "spaceUsedForApplicationData" : '#number',
    "isStorageLow" : '#boolean',
    "latitude" : '#number',
    "longitude" : '#number',
    "bearing" : '#number',
    "speed" : '#number',
    "accuracy" : '#number',
    "edvrStorageSize" : '#number',
    "isSignificant" : '#boolean',
    "distance" : '#number',
    "duration" : '#number',
    "violationCount" : '#number',
    "customEventCount" : '#number',
    "deviceModel" : '#string',
    "uploadedAt" : '#string',
    "sdkVersion" : '#string',
    "eventId" : '#string',
    "eventType" : '#string',
    "timestampUTC" : '#string',
    "bootId" : '#string',
    "lmSessionId" : '#string',
    "runtimeDeviceModel" : '#string',
    "rideviewAppVersion" : '#string',
    "firmwareVersion" : '#string',
    "timezoneOffset" : '#number',
    "timeZoneId" : '#string'
      }
      """


  Scenario: Check for Schema - ShuttingDown
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=ShuttingDown&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["ShuttingDown"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
         """
      {
      "powerState" : '#string',
      "uptime" : '#number',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
      }
      """

  Scenario: Check for Schema - BatteryStatus
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=BatteryStatus&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["BatteryStatus"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
         """
      {
      "powerState" : '#string',
      "tripId" : '#string',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "currentLevel" : '#number',
      "isBatteryLow" : '#boolean',
      "lowBatteryDurationInSeconds" : '#number',
      "batteryHealth" : '#string',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
      }
      """

  Scenario: Check for Schema - CameraCalibration
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=CameraCalibration&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["CameraCalibration"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
    """
      {
        "powerState" : '#string',
        "tripId" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "deviceModel" : '#string',
        "mediaFiles" :[
        {
            "source" : '#string',
            "mediaFileIndex" : '#number',
            "mediaFile" : '#string',
            "mediaType" : '#string',
            "videoDetails" : {
              "videoWidth" : '#number',
              "videoHeight" : '#number',
              "videoBitrate" : '#number',
              "includesPII" : '#boolean',
              "videoQuality" : '#number',
              "videoType" : '#string',
              "videoPiPType" : '#string',
              "codec_type" : '#string',
              "videoFrameRate" : '#number',
              "piiSubframe" : {
              "topLeftX" : '#number',
              "topLeftY" : '#number',
              "width" : '#number',
              "height" : '#number'
              },
              "audioEnabled" : '#boolean'
            }
          }
        ],
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
      """


  Scenario: Check for Schema - GPSLowFrequency
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=GPSLowFrequency&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["GPSLowFrequency"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
         """
         {
      "powerState" : '#string',
      "tripId" : '#string',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "durationInMinutes" : '#number',
      "avgUpdatesPerMin" : '#number',
      "minUpdatesPerMin" : '#number',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
      }
      """


  Scenario: Check for Schema - GPSSynced
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=GPSSynced&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["GPSSynced"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
      """
      {
      "powerState" : '#string',
      "timeTakenForFirstLocationMillis" : '#number',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
      }
      """

  Scenario: Check for Schema - GPSFrequencyNormal
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=GPSFrequencyNormal&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["GPSFrequencyNormal"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
      """
      {
      "powerState" : '#string',
      "tripId" : '#string',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
      }
      """


  Scenario: Check for Schema - DVRWriterException
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=DVRWriterException&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["DVRWriterException"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
      """
      {
      "powerState" : '#string',
      "tripId" : '#string',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
      }
      """

  Scenario: Check for Schema - NetworkConnected
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=NetworkConnected&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["NetworkConnected"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
      """
      {
       "powerState" : '#string',
      "tripId" : '#string',
      "latitude" : '#number',
      "longitude" : '#number',
      "bearing" : '#number',
      "speed" : '#number',
      "accuracy" : '#number',
      "networkType" : '#string',
      "deviceModel" : '#string',
      "uploadedAt" : '#string',
      "sdkVersion" : '#string',
      "eventId" : '#string',
      "eventType" : '#string',
      "timestampUTC" : '#string',
      "bootId" : '#string',
      "lmSessionId" : '#string',
      "runtimeDeviceModel" : '#string',
      "rideviewAppVersion" : '#string',
      "firmwareVersion" : '#string',
      "timezoneOffset" : '#number',
      "timeZoneId" : '#string'
      }
      """

  Scenario: Check for Schema - NetworkDisconnected
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=NetworkDisconnected&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["NetworkDisconnected"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
      """
      {
        "powerState" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "networkType" : '#string',
        "durationInMillis" : '#number',
        "deviceModel" : '#string',
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
      }
      """

  Scenario: Check for Schema - NetworkConnectionClosed
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=NetworkConnectionClosed&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["NetworkConnectionClosed"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
      """
      {
        "powerState" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "durationInMillis" : '#number',
        "connectedDurationInMillis" : '#number',
        "deviceModel" : '#string',
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
      """

  @Camera
  Scenario: Check for Schema - BadMountingDriverCamera
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=BadMountingDriverCamera&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["BadMountingDriverCamera"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
      """
      {
        "powerState" : '#string',
        "tripId" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "framesProcessed" : '#string',
        "driverFacesDetected" : '#string',
        "deviceModel" : '#string',
        "mediaFiles" :[
        {
          "source" : '#string',
          "mediaFileIndex" : '#number',
          "mediaFile" : '#string',
          "mediaType" : '#string',
          "videoDetails" : {
            "videoWidth" : '#number',
            "videoHeight" : '#number',
            "videoBitrate" : '#number',
            "includesPII" : '#boolean',
            "videoQuality" : '#number',
            "videoType" : '#string',
            "videoPiPType" : '#string',
            "codec_type" : '#string',
            "videoFrameRate" : '#number',
            "piiSubframe" : {
            "topLeftX" : '#number',
            "topLeftY" : '#number',
            "width" : '#number',
            "height" : '#number'
            },
            "audioEnabled" : '#boolean'
          }
        }
        ],
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
      """

  @Camera
  Scenario: Check for Schema - BadMountingDriverCameraFace
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=BadMountingDriverCameraFace&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["BadMountingDriverCameraFace"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
       """
      {
        "powerState" : '#string',
        "tripId" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "framesProcessed" : '#string',
        "driverFacesDetected" : '#string',
        "deviceModel" : '#string',
        "mediaFiles" :[
        {
          "source" : '#string',
          "mediaFileIndex" : '#number',
          "mediaFile" : '#string',
          "mediaType" : '#string',
          "videoDetails" : {
            "videoWidth" : '#number',
            "videoHeight" : '#number',
            "videoBitrate" : '#number',
            "includesPII" : '#boolean',
            "videoQuality" : '#number',
            "videoType" : '#string',
            "videoPiPType" : '#string',
            "codec_type" : '#string',
            "videoFrameRate" : '#number',
            "piiSubframe" : {
            "topLeftX" : '#number',
            "topLeftY" : '#number',
            "width" : '#number',
            "height" : '#number'
            },
            "audioEnabled" : '#boolean'
          }
        }
        ],
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
      """

  @Camera
  Scenario: Check for Schema - BadMountingDriverCameraFixedFace
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=BadMountingDriverCameraFixedFace&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["BadMountingDriverCameraFixedFace"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
        """
      {
        "powerState" : '#string',
        "tripId" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "framesProcessed" : '#string',
        "driverFacesDetected" : '#string',
        "deviceModel" : '#string',
        "mediaFiles" :[
        {
          "source" : '#string',
          "mediaFileIndex" : '#number',
          "mediaFile" : '#string',
          "mediaType" : '#string',
          "videoDetails" : {
            "videoWidth" : '#number',
            "videoHeight" : '#number',
            "videoBitrate" : '#number',
            "includesPII" : '#boolean',
            "videoQuality" : '#number',
            "videoType" : '#string',
            "videoPiPType" : '#string',
            "codec_type" : '#string',
            "videoFrameRate" : '#number',
            "piiSubframe" : {
            "topLeftX" : '#number',
            "topLeftY" : '#number',
            "width" : '#number',
            "height" : '#number'
            },
            "audioEnabled" : '#boolean'
          }
        }
        ],
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
      """

  @Camera
  Scenario: Check for Schema - BadMountingDriverCameraFixedFace
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=BadMountingDriverCameraFixedFace&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["BadMountingDriverCameraFixedFace"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
       """
      {
        "powerState" : '#string',
        "tripId" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "framesProcessed" : '#string',
        "driverFacesDetected" : '#string',
        "deviceModel" : '#string',
        "mediaFiles" :[
        {
          "source" : '#string',
          "mediaFileIndex" : '#number',
          "mediaFile" : '#string',
          "mediaType" : '#string',
          "videoDetails" : {
            "videoWidth" : '#number',
            "videoHeight" : '#number',
            "videoBitrate" : '#number',
            "includesPII" : '#boolean',
            "videoQuality" : '#number',
            "videoType" : '#string',
            "videoPiPType" : '#string',
            "codec_type" : '#string',
            "videoFrameRate" : '#number',
            "piiSubframe" : {
            "topLeftX" : '#number',
            "topLeftY" : '#number',
            "width" : '#number',
            "height" : '#number'
            },
            "audioEnabled" : '#boolean'
          }
        }
        ],
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
      """

  @Camera
  Scenario: Check for Schema - BadMountingDriverCameraFixedPose
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=BadMountingDriverCameraFixedPose&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["BadMountingDriverCameraFixedPose"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
       """
      {
        "powerState" : '#string',
        "tripId" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "framesProcessed" : '#string',
        "driverFacesDetected" : '#string',
        "deviceModel" : '#string',
        "mediaFiles" :[
        {
          "source" : '#string',
          "mediaFileIndex" : '#number',
          "mediaFile" : '#string',
          "mediaType" : '#string',
          "videoDetails" : {
            "videoWidth" : '#number',
            "videoHeight" : '#number',
            "videoBitrate" : '#number',
            "includesPII" : '#boolean',
            "videoQuality" : '#number',
            "videoType" : '#string',
            "videoPiPType" : '#string',
            "codec_type" : '#string',
            "videoFrameRate" : '#number',
            "piiSubframe" : {
            "topLeftX" : '#number',
            "topLeftY" : '#number',
            "width" : '#number',
            "height" : '#number'
            },
            "audioEnabled" : '#boolean'
          }
        }
        ],
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
      """

  @Camera
  Scenario: Check for Schema - BadMountingDriverCameraPose
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=BadMountingDriverCameraPose&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["BadMountingDriverCameraPose"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
         """
      {
        "powerState" : '#string',
        "tripId" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "framesProcessed" : '#string',
        "driverFacesDetected" : '#string',
        "deviceModel" : '#string',
        "mediaFiles" :[
        {
          "source" : '#string',
          "mediaFileIndex" : '#number',
          "mediaFile" : '#string',
          "mediaType" : '#string',
          "videoDetails" : {
            "videoWidth" : '#number',
            "videoHeight" : '#number',
            "videoBitrate" : '#number',
            "includesPII" : '#boolean',
            "videoQuality" : '#number',
            "videoType" : '#string',
            "videoPiPType" : '#string',
            "codec_type" : '#string',
            "videoFrameRate" : '#number',
            "piiSubframe" : {
            "topLeftX" : '#number',
            "topLeftY" : '#number',
            "width" : '#number',
            "height" : '#number'
            },
            "audioEnabled" : '#boolean'
          }
        }
        ],
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
      """

  @Camera
  Scenario: Check for Schema - BadMountingInertialSensor
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=BadMountingInertialSensor&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["BadMountingInertialSensor"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
         """
      {
        "powerState" : '#string',
        "tripId" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "framesProcessed" : '#string',
        "driverFacesDetected" : '#string',
        "deviceModel" : '#string',
        "mediaFiles" :[
        {
          "source" : '#string',
          "mediaFileIndex" : '#number',
          "mediaFile" : '#string',
          "mediaType" : '#string',
          "videoDetails" : {
            "videoWidth" : '#number',
            "videoHeight" : '#number',
            "videoBitrate" : '#number',
            "includesPII" : '#boolean',
            "videoQuality" : '#number',
            "videoType" : '#string',
            "videoPiPType" : '#string',
            "codec_type" : '#string',
            "videoFrameRate" : '#number',
            "piiSubframe" : {
            "topLeftX" : '#number',
            "topLeftY" : '#number',
            "width" : '#number',
            "height" : '#number'
            },
            "audioEnabled" : '#boolean'
          }
        }
        ],
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
      """

  @Camera
  Scenario: Check for Schema - BadMountingInertialSensorFixed
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=BadMountingInertialSensorFixed&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["BadMountingInertialSensorFixed"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
         """
      {
        "powerState" : '#string',
        "tripId" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "framesProcessed" : '#string',
        "driverFacesDetected" : '#string',
        "deviceModel" : '#string',
        "mediaFiles" :[
        {
          "source" : '#string',
          "mediaFileIndex" : '#number',
          "mediaFile" : '#string',
          "mediaType" : '#string',
          "videoDetails" : {
            "videoWidth" : '#number',
            "videoHeight" : '#number',
            "videoBitrate" : '#number',
            "includesPII" : '#boolean',
            "videoQuality" : '#number',
            "videoType" : '#string',
            "videoPiPType" : '#string',
            "codec_type" : '#string',
            "videoFrameRate" : '#number',
            "piiSubframe" : {
            "topLeftX" : '#number',
            "topLeftY" : '#number',
            "width" : '#number',
            "height" : '#number'
            },
            "audioEnabled" : '#boolean'
          }
        }
        ],
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
      """

  @Camera
  Scenario: Check for Schema - BadMountingRoadCamera
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=BadMountingRoadCamera&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["BadMountingRoadCamera"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
        """
      {
        "powerState" : '#string',
        "tripId" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "framesProcessed" : '#string',
        "driverFacesDetected" : '#string',
        "deviceModel" : '#string',
        "mediaFiles" :[
        {
          "source" : '#string',
          "mediaFileIndex" : '#number',
          "mediaFile" : '#string',
          "mediaType" : '#string',
          "videoDetails" : {
            "videoWidth" : '#number',
            "videoHeight" : '#number',
            "videoBitrate" : '#number',
            "includesPII" : '#boolean',
            "videoQuality" : '#number',
            "videoType" : '#string',
            "videoPiPType" : '#string',
            "codec_type" : '#string',
            "videoFrameRate" : '#number',
            "piiSubframe" : {
            "topLeftX" : '#number',
            "topLeftY" : '#number',
            "width" : '#number',
            "height" : '#number'
            },
            "audioEnabled" : '#boolean'
          }
        }
        ],
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
      """

  @Camera
  Scenario: Check for Schema - BadMountingRoadCameraFixed
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=BadMountingRoadCameraFixed&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["BadMountingRoadCameraFixed"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
        """
      {
        "powerState" : '#string',
        "tripId" : '#string',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "framesProcessed" : '#string',
        "driverFacesDetected" : '#string',
        "deviceModel" : '#string',
        "mediaFiles" :[
        {
          "source" : '#string',
          "mediaFileIndex" : '#number',
          "mediaFile" : '#string',
          "mediaType" : '#string',
          "videoDetails" : {
            "videoWidth" : '#number',
            "videoHeight" : '#number',
            "videoBitrate" : '#number',
            "includesPII" : '#boolean',
            "videoQuality" : '#number',
            "videoType" : '#string',
            "videoPiPType" : '#string',
            "codec_type" : '#string',
            "videoFrameRate" : '#number',
            "piiSubframe" : {
            "topLeftX" : '#number',
            "topLeftY" : '#number',
            "width" : '#number',
            "height" : '#number'
            },
            "audioEnabled" : '#boolean'
          }
        }
        ],
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
      """

  @Camera
  Scenario: Check for Schema - BootComplete
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events?eventType=BootComplete&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    * def eventList = $.events[?(@.eventType)].eventType
    * def ExpectedEvent = ["BootComplete"]
    And match ExpectedEvent contains eventList
    And match response.events[0] ==
        """
      {
        "powerState" : '#string',
        "timeSinceBootMillis" : '#number',
        "didAppTriggerLastShutdown" : '#boolean',
        "latitude" : '#number',
        "longitude" : '#number',
        "bearing" : '#number',
        "speed" : '#number',
        "accuracy" : '#number',
        "isRealIgnitionIgnored" : '#boolean',
        "deviceModel" : '#string',
        "uploadedAt" : '#string',
        "sdkVersion" : '#string',
        "eventId" : '#string',
        "eventType" : '#string',
        "timestampUTC" : '#string',
        "bootId" : '#string',
        "lmSessionId" : '#string',
        "runtimeDeviceModel" : '#string',
        "rideviewAppVersion" : '#string',
        "firmwareVersion" : '#string',
        "timezoneOffset" : '#number',
        "timeZoneId" : '#string'
        }
      """
