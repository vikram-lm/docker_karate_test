Feature:   To Match Schema for responses
  #@report=false

  Background:  Check for all Asset related Details
	# Set the Auth credentials here
    * configure headers = read('data/headers.js')
	# Change the environment for other API
    * def ENV = 'v2'
    * def TestURL = 'https://api-qa.lightmetrics.co/'


  @SchemaCheck @aggregate @QA
  Scenario:  Check for AGGREGATE_ASSET_TRIPS
    * def AggregateAssettrips = read('data/AggregateAssettripsV1.json')
    Given url TestURL+ENV+'/fleets/qatest001/assets/353436105011125/aggregate'
    When method GET
    Then status 200
    And match response == AggregateAssettrips
    And print response


  @SchemaCheck @aggregate @QA
  Scenario:  Check for AGGREGATE_DEVICES -  /device-management/devices-aggregate
    * def AggregateDevice = read('data/AggregateDeviceV1.json')
    Given url TestURL+ENV+'/device-management/devices-aggregate'
    When method GET
    Then status 200
    And match response == AggregateDevice
    And print response

  @SchemaCheck @aggregate @QA
  Scenario:  Check for AGGREGATE_DEVICE_REPORT -/device-management/reports/aggregate
    * def AggregateReport = read('data/AggregateDeviceReportV1.json')
    Given url TestURL+ENV+'/device-management/reports/aggregate'
    When method GET
    Then status 200
    And match response == AggregateReport
    And print response

  @SchemaCheck @permissions @QA
  Scenario:  Check for FETCH_FLEET_PERMISSIONS -/user-permissions/fleets/{fleetId}
    * def FleetPermission = read('data/FleetPermissionV1.json')
    Given url TestURL+ENV+'/user-permissions/fleets/qatest001'
    When method GET
    Then status 200
    And match response  == FleetPermission
    And print response

  @SchemaCheck @preferences
  Scenario:  Check for FETCH_COMMON_USER_PREFERENCES
    * def UserPreferenceSchema = read('data/UserPreferencesV1.json')
    Given url TestURL+ENV+'/user-preferences'
    When method GET
    Then status 200
    And print response
    And match response == UserPreferenceSchema

  @SchemaCheck @preferences
  Scenario:  Check for FETCH_DRIVER_PREFERENCES
    Given url TestURL+ENV+'/user-preferences/fleets/qatest001/drivers/vikramqa'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @preferences
  Scenario:  Check for FETCH_FLEET_PREFERENCES
    * def FleetPreferenceData = read('data/FleetPreferencesV1.json')
    Given url TestURL+ENV+'/user-preferences/fleets/qatest001'
    When method GET
    Then status 200
    And match response == FleetPreferenceData
    And print response


  @SchemaCheck @configuration
  Scenario:  Check for FETCH_ASSET_SDK_CONFIGURATION -  /fleets/{fleetId}/configuration/{assetId}
    * def AssetConfigSchema = read('data/AssetConfigV1.json')
    Given url TestURL+ENV+'/fleets/qatest001/configuration/353436105011125'
    When method GET
    Then status 200
    And match response == AssetConfigSchema
    And print response


  @SchemaCheck  @configuration
  Scenario:  Check for FETCH_COMMON_SDK_CONFIGURATION
    * def CommonSDKConfig = read('data/CommonSDKConfigV1.json')
    Given url TestURL+ENV+'/configuration'
    When method GET
    Then status 200
    And match response == CommonSDKConfig
    And print response

  @SchemaCheck @configuration
  Scenario:  Check for FETCH_FLEET_SDK_CONFIGURATION -/fleets/{fleetId}/configuration
    * def FleetSDKConfig = read('data/FleetSDKConfigV1.json')
    Given url TestURL+ENV+'/fleets/qatest001/configuration'
    When method GET
    Then status 200
    And match response ==  FleetSDKConfig
    And print response

  @SchemaCheck @asset
  Scenario:  Check for FLEET_ASSETS
    * def  FleetAsset = read('data/FleetAsset.json')
    Given url TestURL+ENV+'/fleets/qatest001/assets'
    When method GET
    Then status 200
    And match response == FleetAsset
    And print response

  @SchemaCheck
  Scenario:  Check for LATEST_TRIPS_BY_ASSETS -  /fleets/{fleetId}/latest-trips-by-asset-id?includeInsignificantTrips=true
    Given url TestURL+ENV+'/fleets/qatest001/latest-trips-by-asset-id?includeInsignificantTrips=true'
    When method GET
    Then status 200
    And print response

  @SchemaCheck
  Scenario:  Check for LATEST_TRIPS_BY_ASSETS -  /fleets/{fleetId}/latest-trips-by-asset-id
    Given url TestURL+ENV+'/fleets/qatest001/latest-trips-by-asset-id'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @aggregate
  Scenario:  Check for LIST_AGGREGATE_FLEET_TRIPS
    Given url TestURL+ENV+'/fleets/qatest001/violations/aggregate'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @aggregate
  Scenario:  Check for LIST_AGGREGATE_FLEET_VIOLATIONS
    Given url TestURL+ENV+'/assets'
    When method GET
    Then status 200
    And print response

  @SchemaCheck
  Scenario:  Check for LIST_ASSET_TRIPS
    Given url TestURL+ENV+'/fleets/qatest001/assets/353436105011125/trips'
    When method GET
    Then status 200
    And print response

  @SchemaCheck
  Scenario:  Check for LIST_ASSET_VIOLATIONS -/fleets/{fleetId}/assets/{assetId}/violations
    Given url TestURL+ENV+'/fleets/qatest001/assets/353436105011125/violations'
    When method GET
    Then status 200
    And print response

  @SchemaCheck
  Scenario:  Check for LIST_COACHING_EVENT_LIST
    Given url TestURL+ENV+'/fleets/qatest001/coaching-events'
    When method GET
    Then status 200
    And print response

  @SchemaCheck
  Scenario:  Check for LIST_DEVICES -/fleets/{fleetId}/devices/{deviceId}/trips
    Given url TestURL+ENV+'/fleets/qatest001/devices/353436105011125/trips'
    When method GET
    Then status 200
    And print response

  @SchemaCheck
  Scenario:  Check for LIST_DEVICE_TRIPS
    Given url TestURL+ENV+'/assets'
    When method GET
    Then status 200
    And print response


  @SchemaCheck
  Scenario:  Check for LIST_DRIVER_TRIPS
    Given url TestURL+ENV+'/fleets/qatest001/drivers/vikramqa/trips'
    When method GET
    Then status 200
    And match response.rows[0].device.model == "TREQ MSCAM"
    And match response.rows[0].device.deviceId == "353436105011125"
    And match response.rows[1].device.model == "TREQ MSCAM"
    And match response.rows[1].device.deviceId == "353436105011125"
    And print response


  @SchemaCheck
  Scenario:  Check for LIST_DRIVER_VIOLATIONS
    Given url TestURL+ENV+'/fleets/qatest001/drivers/vikramqa/violations'
    When method GET
    Then status 200
    And print response

  @SchemaCheck
  Scenario:  Check for LIST_FLEETS
    Given url TestURL+ENV+'/fleets'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @aggregate @dvr
  Scenario:  Check for LIST_FLEET_AGGREGATE_DVR
    Given url TestURL+ENV+'/fleets/qatest001/dvr-requests/aggregate'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @aggregate @dvr
  Scenario:  Check for LIST_FLEET_AGGREGATE_EDVR
    Given url TestURL+ENV+'/fleets/qatest001/edvr-requests/aggregate'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @dvr  @fleet @QA
  Scenario:  Check for LIST_FLEET_DVR_REQUESTS
    Given url TestURL+ENV+'/fleets/qatest001/drivers/vikramqa/uploadRequests'
    * def FleetDVRdata = read('data/FleetDVRdataV1.json')
    When method GET
    Then status 200
    And print response
    And match response.rows[0] == FleetDVRdata

  @SchemaCheck @dvr  @fleet @QA
  Scenario:  Check for LIST_FLEET_EDVRREQUESTS
    * def FleetEDVRdata = read('data/FleetEDVRdataV1.json')
    Given url TestURL+ENV+'/fleets/qatest001/edvr-requests/list'
    When method GET
    Then status 200
    And print response
    And match response.rows[0] == FleetEDVRdata

  @SchemaCheck @fleet @external @QA
  Scenario:  Check for LIST_FLEET_EXTERNAL_EVENTS
    * def FleetExtdata = read('data/FleetExtDataV1.json')
    Given url TestURL+ENV+'/fleets/qatest001/external-events'
    When method GET
    Then status 200
    And print response
    And match response.rows[0] == FleetExtdata

  @SchemaCheck  @fleet @QA
  Scenario:  Check for LIST_FLEET_TRIPS
    * def FleetTrips = read('data/FleetTripDataV1.json')
    Given url TestURL+ENV+'/fleets/qatest001/trips?limit=3&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    And match response.rows[0] == FleetTrips.rows[0]
    And match response.rows[2] == FleetTrips.rows[2]


  @SchemaCheck @Violation @QA
  Scenario:  Check for LIST_FLEET_VIOLATIONS
    Given url TestURL+ENV+'/fleets/qatest001/violations?limit=1&skip=0&offset=0'
    * def FleetViolation = read('data/FleetViolationV1.json')
    * def FleetViolationOne = read('data/FleetViolationONEV1.json')
    When method GET
    Then status 200
    And print response
    And match response == FleetViolation
    And match response.rows[0] == FleetViolationOne


  @SchemaCheck @Violation @QA
  Scenario:  Check for LIST_FLEET_VIOLATIONS
    Given url TestURL+ENV+'/fleets/qatest001/violations?limit=1&skip=0&offset=0'
    * def FleetViolationOne = read('data/FleetViolationONEV1.json')
    When method GET
    Then status 200
    And match response == FleetViolationOne
    And match response.driverId == 'vikramqa'
    And print response

  @SchemaCheck @fleet @QA
  Scenario:  Check for LIST_INCORRECT_MOUNTED_ASSETS
    * def FleetIncorrectAsset = read('data/IncorrectAssetFleetV1.json')
    Given url TestURL+ENV+'/incorrect-camera-mounting/assets?limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    And match response.rows[0] == FleetIncorrectAsset
	#And match response.rows[0].driverId == "vishalKathiriya"
	#And match response.rows[0].fleetId == "lmfleet001"

  @SchemaCheck
  Scenario:  Check for LIST_ONGOING_TRIPS
    Given url TestURL+ENV+'/fleets/qatest001/ongoing-trips'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @software @QA
  Scenario:  Check for LIST_SOFTWARE_CHANNELS
    * def softwareChannel = read('data/SoftwareChannelV1.json')
    Given url TestURL+ENV+'/device-management/software/softwareIds'
    When method GET
    Then status 200
    And print response
    And match response == softwareChannel

  @SchemaCheck @software @QA
  Scenario:  Check for LIST_SOFTWARE_VERSIONS-1(LM_RIDEVIEW)
    * def softwareChannelLR = read('data/SoftwareChannelLRV1.json')
    Given url TestURL+ENV+'/device-management/software/LM_RIDEVIEW/releases?limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    And match response.versions[0].semver == "1.12.9+audio"
	#And match response == softwareChannelLR


  @SchemaCheck @software @QA
  Scenario:  Check for LIST_SOFTWARE_VERSIONS-2(LM_UPDATES_AGENT)
    * def softwareChannelUA = read('data/SoftwareChannelUAV1.json')
    Given url TestURL+ENV+'/device-management/software/LM_UPDATES_AGENT/releases?limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And print response
    And match response.versions[0].semver == "3.0.0"
	#And match response == softwareChannelUA


  @SchemaCheck @ignitionID
  Scenario:  Check for LIST_TRIPS_BY_IGNITION_ID
    Given url TestURL+ENV+'/fleets/qatest001/ignitions/ignition_2023_04_12_14_50_53_883_353436105011125_MkET2/trips'
    When method GET
    Then status 200
    And print response

	#noinspection SpellCheckingInspection
	 # @SchemaCheck   @QA
  Scenario:  Check for LIST_VALID_VENDORS
    * def Validvendors = read('data/ValidVendorsV1.json')
    Given url TestURL+ENV+'/device-management/valid-vendors'
    When method GET
    Then status 200
    And match response == Validvendors
    And print response


  @SchemaCheck @webhook @QA
  Scenario:  Check for LIST_WEBHOOK
    * def WebhookDataBeta = read('data/webhookdataBetaV1.json')
    Given url TestURL+ENV+'/webhooks'
    When method GET
    Then status 200
    And print response.rows
	#And match response == WebhookDataBeta
    And match each response.rows ==
	"""
	{
	"trigger" : '#string',
	"url" : '#string',
	"createdAt" : '#string',
	"updatedAt" : '#string'
	}
	"""


  @SchemaCheck
  Scenario:  Check for UNPROVISIONED_DEVICE_STATUS
    Given url TestURL+ENV+'/device-management/devices/unprovisioned-status'
    When method GET
    Then status 200
    And print response
    And match response ==
	"""
	{
	"limit": '#number',
	"skip": '#number',
	"totalCount": '#number',
	"rows" : []
	}
	"""


  @SchemaCheck @device
  Scenario:  Check for USAGE_DEVICE_LEVEL
    Given url TestURL+ENV+'/live/fleets/qatest001/usage/353436105011125'
    When method GET
    Then status 200
    And print response
    And match response ==
	"""
	{
	"totalViews": "#number",
	"totalDuration": "#number",
	"count": {
	"ACKNOWLEDGED": "#number",
	"CANCELED": "#number",
	"FINISHED": "#number",
	"PENDING": "#number",
	"STARTED": "#number",
	"UNAVAILABLE": "#number",
	"total": "#number",
	}
	}
	"""


  @SchemaCheck @aggregate @trips @device @QA
  Scenario:  Check for AGGREGATE_DEVICE_TRIPS-1 -/fleets/{fleetId}/devices/{deviceId}/aggregate/trips
    * def devicetripAggregate = read('data/DeviceTripAggregateV1.json')
    Given url TestURL+ENV+'/fleets/qatest001/devices/353436105011125/aggregate/trips'
    When method GET
    Then status 200
    And print response
    And match response ==
	"""
	{
	"limit": "#number",
	"skip": "#number",
	"rows": [
	{
	"key": "#present",
	"value": {
	"eventCount": {
	"Cellphone-Distracted-Driving": "#number",
	"Cornering": "#number",
	"Distracted-Driving": "#number",
	"Drinking-Distracted-Driving": "#number",
	"Drowsy-Driving-Detected": "#number",
	"Forward-Collision-Warning": "#number",
	"Harsh-Acceleration": "#number",
	"Harsh-Braking": "#number",
	"Lane-Drift-Found": "#number",
	"Lizard-Eye-Distracted-Driving": "#number",
	"MaxSpeedExceeded": "#number",
	"SeatBelt-Non-Compliance": "#number",
	"Smoking-Distracted-Driving": "#number",
	"Tail-Gating-Detected": "#number",
	"Traffic-STOP-Sign-Violated": "#number",
	"Traffic-Speed-Violated": "#number",
	"total": "#number"
	},
	"tripCount": "#number",
	"tripDistance": "#number",
	"tripDuration": "#number",
	"score": "#number"
	}
	}
	]
	}
	"""
    And match response == devicetripAggregate

  @SchemaCheck @aggregate @trips @device
  Scenario:  Check for AGGREGATE_DEVICE_TRIPS-2 - -/fleets/{fleetId}/devices/{deviceId}/aggregate/trips
    Given url TestURL+ENV+'/fleets/qatest001/devices/353436105011125/aggregate/trips'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @aggregate
  Scenario:  Check for AGGREGATE_DRIVER_TRIPS -/fleets/{fleetId}/drivers/{driverId}/aggregate
    Given url TestURL+ENV+'/fleets/qatest001/drivers/vikramqa/aggregate'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @aggregate
  Scenario:  Check for AGGREGATE_DRIVER_VIOLATIONS -/fleets/{fleetId}/drivers/{driverId}/violations/aggregate
    Given url TestURL+ENV+'/fleets/qatest001/drivers/vikramqa/violations/aggregate'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @device
  Scenario:  Check for ASSET_DETAILS -/fleets/{fleetId}/assets/{assetId}
    Given url TestURL+ENV+'/fleets/qatest001/assets/353436105011125'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @plans
  Scenario:  Check for ASSET_PLANS -/asset-plans/{cameraType}
    Given url TestURL+ENV+'/asset-plans/RIDECAM_PLUS'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @aggregate  @deprecated @device @ignore
  Scenario:  Check for ASSET_VIOLATIONS_AGGREGATE -   /fleets/{fleetId}/assets/{assetId}/violations/aggregate
    Given url TestURL+ENV+'/fleets/qatest001/assets/353436105011125/violations/aggregate'
    When method GET
    Then status 200
    And print response

  @SchemaCheck
  Scenario:  Check for DETAIL_FOR_FLEET_STATUS  -  /fleets/{fleetId}
    Given url TestURL+ENV+'/fleets/qatest001'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @ignitionId @device
  Scenario:  Check for DETAIL_FOR_IGNITION_ID -  /fleets/{fleetId}/ignitions/{ignitionId} -ignition_2023_04_12_14_50_53_883_353436105011125_MkET2
    Given url TestURL+ENV+'/fleets/qatest001/ignitions/ignition_2023_04_12_14_50_53_883_353436105011125_MkET2'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @diagnostic @device @QA
  Scenario:  Check for DEVICE_DIAGNOSTICS_REPORT -/device-management/reports/devices/{deviceId}
    * def DiagnosticAsset = read('data/DiagnosticDataV1.json')
    Given url TestURL+ENV+'/device-management/reports/devices/353436105011125'
    When method GET
    Then status 200
    And match response == DiagnosticAsset
    And print response

  @SchemaCheck @device @QA
  Scenario:  Check for DEVICE_DETAILS -  /device-management/devices/{deviceId}
    * def DeviceDetails = read('data/DeviceDetailsV1.json')
    Given url TestURL+ENV+'/device-management/devices/353436105011125'
    When method GET
    Then status 200
    And match response == DeviceDetails
    And match response.devicemode == 'micronet-smartcam-lte'
    And match response.clientId == 'lightmetrics_qa'
    And match response.assetId == '353436105011125'
    And print response

  @SchemaCheck @device
  Scenario:  Check for DEVICE_LANE_CALIBRATION_STATUS -/device-management/devices/{deviceId}/lane-calibration
    * def deviceLaneCalib = read('data/deviceLanecalibrationV1.json')
    Given url TestURL+ENV+'/device-management/devices/353436105011125/lane-calibration'
    When method GET
    Then status 200
    And match response == deviceLaneCalib
    And print response

  @SchemaCheck @aggregate @QA
  Scenario:  Check for EXTERNAL_EVENTS_AGGREGATE
    Given url TestURL+ENV+'/fleets/qatest001/external-events/aggregate'
    * def externaleventAggregate = read('data/externalAggregateV1.json')
    When method GET
    Then status 200
    And match response == externaleventAggregate
    And print response

  @SchemaCheck @device @QA
  Scenario:  Check for DEVICE_OUTPUT_SIGNAL -/device-management/devices/{deviceId}/outpin-signal
    * def DeviceOutput = read('data/DeviceOutputV1.json')
    Given url TestURL+ENV+'/device-management/devices/353436105011125/outpin-signal'
    When method GET
    Then status 200
    And match response == DeviceOutput
    And match response.deviceOutPinSignal == 'HIGH'
    And match response.deviceOutPinSignalInputTimestamp == '2023-01-02T10:29:23.532Z'
    And print response

  @SchemaCheck @device @tasks @QA
  Scenario:  Check for DEVICE_TASK_STATUS -/device-management/devices/{deviceId}/tasks?task=disableCameraRecording
    * def deviceTask = read('data/DeviceDisableV1.json')
    Given url TestURL+ENV+'/device-management/devices/353436105011125/tasks?taskType=disableCameraRecording'+'&limit=1&skip=0&offset=0'
    When method GET
    Then status 200
    And match response == deviceTask
    And print response

  @SchemaCheck @device @QA
  Scenario:  Check for DEVICE_TRACKING_EVENTS -/device-management/devices/{deviceId}/device-tracking-events
    * def deviceTrackThree = read('data/deviceTrackThreev1.json')
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events'+'?limit=3&skip=0&offset=0'
    When method GET
    Then status 200
    And match response == deviceTrackThree
    And match response.events[0].deviceModel =='micronet-smartcam-lte'
    And match response.events[2].deviceModel =='micronet-smartcam-lte'
    And print response

  @SchemaCheck @permissions @QA
  Scenario:  Check for EVALUATE_USER_PERMISSIONS  -/user-permissions
    * def  UserPermissionBeta = read('data/UserPermissionQAV1.json')
    Given url TestURL+ENV+'/user-permissions'
    When method GET
    Then status 200
    And print response
    And match response == UserPermissionBeta

  @SchemaCheck @permissions
  Scenario:  Check for EVALUATE_USER_PERMISSIONS  -/user-permissions
    * def  UserPermissionQA = read('data/UserPermissionBetaV1.json')
    Given url 'https://api-beta.lightmetrics.co/'+ENV+'/user-permissions'
    When method GET
    Then status 200
    And print response
    And match response == UserPermissionQA


  @SchemaCheck @permissions @QA
  Scenario:  Check for FETCH_COMMON_PERMISSIONS  -  /user-permissions
    * def Commonpermission = read('data/CommonPermissionV1.json')
    Given url TestURL+ENV+'/user-permissions'
    When method GET
    Then status 200
    And match response == Commonpermission
    And match response.permissions.allowPIIProcessing == false
    And match response.permissions.audioRecording == false
    And print response

  @SchemaCheck @permissions @QA
  Scenario:  Check for FETCH_DRIVER_PERMISSIONS -/user-permissions/fleets/{fleetId}/drivers/{driverId}
    * def DriverPermission = read('data/DriverPermissionV1.json')
    Given url TestURL+ENV+'/user-permissions/fleets/qatest001/drivers/vikramqa'
    When method GET
    Then status 200
    And match response == DriverPermission
    And match response.permissions.allowPIIProcessing == true
    And match response.permissions.audioRecording == false
    And print response

  @SchemaCheck @device @tasks
  Scenario:  Check for DEVICE_TASK_STATUS -/device-management/devices/{deviceId}/tasks?taskType=disableCameraRecording
    Given url TestURL+ENV+'/device-management/devices/353436105011125/tasks?taskType=disableCameraRecording'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @device
  Scenario:  Check for DEVICE_TRACKING_EVENTS -/device-management/devices/{deviceId}/device-tracking-events
    Given url TestURL+ENV+'/device-management/devices/353436105011125/device-tracking-events'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @permissions
  Scenario:  Check for EVALUATE_USER_PERMISSIONS  -/user-permissions
    Given url TestURL+ENV+'/user-permissions'
    When method GET
    Then status 200
    And print response

  @SchemaCheck @permissions @QA
  Scenario:  Check for FETCH_COMMON_PERMISSIONS  -  /user-permissions
    * def CommonPermission = read('data/CommonPermissionV1.json')
    Given url TestURL+ENV+'/user-permissions'
    When method GET
    Then status 200
    And match response == CommonPermission
    And match response.permissions.allowPIIProcessing == false
    And match response.permissions.audioRecording == false
    And print response

  @SchemaCheck @permissions @QA
  Scenario:  Check for FETCH_DRIVER_PERMISSIONS -/user-permissions/fleets/{fleetId}/drivers/{driverId}
    * def DriverPermission = read('data/DriverPermissionV1.json')
    Given url TestURL+ENV+'/user-permissions/fleets/qatest001/drivers/vikramqa'
    When method GET
    Then status 200
    And match response == DriverPermission
    And match response.permissions.allowPIIProcessing == true
    And match response.permissions.audioRecording == false

  @SchemaCheck  @tripdetails
  Scenario:  Check for EVENT_DETAILS -/fleets/{fleetId}/drivers/{driverId}/trips/{tripId}/events/{eventIndex} - eventIndex 175 is a periodic-Image-capture
    Given url 'https://api-qa.lightmetrics.co/'+ENV+'/fleets/qatest001/drivers/vikramqa/trips/trip_master_2023_04_12_14_50_54_692_9319C38F62212DA39393BA457EBC6D8CDC5A7D2E_7XL0J/events/175'
    When method GET
    Then status 200
    And print response

  @SchemaCheck  @tripdetails @QA
  Scenario:  Check for EVENT_DETAILS -/fleets/{fleetId}/drivers/{driverId}/trips/{tripId}/events/{eventIndex} - eventIndex 175 is a periodic-Image-capture
    * def EventIndexData = read('data/EventIndexV1.json')
    Given url TestURL+ENV+'/fleets/qatest001/drivers/vikramqa/trips/trip_master_2023_04_12_14_50_54_692_9319C38F62212DA39393BA457EBC6D8CDC5A7D2E_7XL0J/events/175'
    When method GET
    Then status 200
    And print response
    And match response == EventIndexData

  @SchemaCheck  @tripdetails
  Scenario:  Check for EVENT_DETAILS -/fleets/{fleetId}/drivers/{driverId}/trips/{tripId}/events/{eventIndex} -175 is periodic-image-capture
    * def EventIndexData = read('data/EventIndexV1.json')
    Given url TestURL+ENV+'/fleets/qatest001/drivers/vikramqa/trips/trip_master_2023_04_12_14_50_54_692_9319C38F62212DA39393BA457EBC6D8CDC5A7D2E_7XL0J/events/175'
    When method GET
    Then status 200
    And print response
    And match response.eventType == 'Periodic-Image-Capture'
    And match response == EventIndexData


  @SchemaCheck @tripdetails @QA
  Scenario:  Check for TRIP_DETAILS
    * def tripDetails = read('data/TripDetailsV1.json')
    Given url TestURL+ENV+'/fleets/qatest001/drivers/vikramqa/trips/trip_master_2023_04_12_14_50_54_692_9319C38F62212DA39393BA457EBC6D8CDC5A7D2E_7XL0J'
    When method GET
    Then status 200
    And match response == tripDetails
    And print response

  @SchemaCheck @tripdetails @QA
  Scenario:  Check for TRIP_DETAILS
    * def tripDetails = read('data/TripDetailsV1.json')
    Given url TestURL+ENV+'/fleets/qatest001/drivers/vikramqa/trips/trip_master_2023_04_12_14_50_54_692_9319C38F62212DA39393BA457EBC6D8CDC5A7D2E_7XL0J'
    When method GET
    Then status 200
    And match response == tripDetails
    And match response.driverId == 'vikramqa'
    And match response.driverName == 'vikramqa'
    And print response

  @ignore @SchemaCheck
  Scenario:  Check for LIST_DRIVER_DVR_REQUESTS  -#NOTFOUND
    Given url TestURL+ENV+'/assets'
    When method GET
    Then status 200
    And print response


  @ignore  @SchemaCheck
  Scenario:  Check for FETCH_UPLOAD_REQUEST -fleets/{fleetId}/drivers/{driverId}/trips/{tripId}/uploadRequests/{uploadRequestId}
    Given url TestURL+ENV+'/fleets/qatest001/drivers/vikramqa/trips/trip_master_2023_04_12_14_50_54_692_9319C38F62212DA39393BA457EBC6D8CDC5A7D2E_7XL0J/uploadRequests/{uploadRequestId}'
    When method GET
    Then status 200
    And print response

  @ignore @SchemaCheck
  Scenario:  Check for LIST_FLEET_EXCEPTIONS
    Given url TestURL+ENV+'/assets'
    When method GET
    Then status 200
    And print response

  @SchemaCheck  @kafka
  Scenario:  Check for KAFKA Queue
    Given url TestURL+ENV+'/event-stream/common/reset-position?position=beginning'
    When method POST
    Then status 200
    And print response

  @SchemaCheck  @kafka
  Scenario:  Check for KAFKA messages
    Given url TestURL+ENV+'/event-stream/common/messages'
    When method GET
    Then status 200
    And print response
    And match response.messages[0].sdkSchema == 2
    And match response.messages[0].fleetId == "lmfleet001"
    And match response.messages[0].driverId == "vikramqa"
    And  match response.messages[0].gpsData.lattitude == '#notpresent'
    And  match response.messages[0].gpsData.longitude == '#notpresent'
    And  match response.messages[0].gpsData.bearing == '#notpresent'
    And  match response.messages[0].gpsData.accuracy == '#null'
    And  match response.messages[0].gpsData.speed == '#null'
