Feature:  Test V1 and V2 API in scope
#@report=true

  Background:  Check for all Trip related Details
	# Set the Auth credentials here
    * configure headers = read('data/OAuth2-Vikram.js')
	# Change the environment for other API
    * def ENV = 'v2'
    * def TestQAURL = 'https://api-beta.lightmetrics.co/v2  '
    * def DATERANGE = 'before=2023-05-16&after=2023-04-27'
    * def DEVICE = '864281042307489'
    * def ASSET = '864281042307489-4'
    * def IGNITION_ID = 'ignition_2023_05_10_08_04_28_369_864281042307489_DSJlP'

  @Violation
  Scenario:  Test Fleet Violations
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/violations'+'?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @Violation
  Scenario Outline:  Test Fleet Violations with param <Violation>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/violations'+'?eventType='+'<Violation>'+'&'+DATERANGE
    #And request  {"eventType":<Violation>}
    When method GET
    Then status 200
    And print response
    Examples:
      | Violation                    |
      | Traffic-Speed-Violated       |
      | Cornering                    |
      | Traffic-STOP-Sign-Violated   |
      | Harsh-Braking                |
      | Harsh-Acceleration           |
      | Tail-Gating-Detected         |
      | Lane-Drift-Found             |
      | Distracted-Driving           |
      | MaxSpeedExceeded             |
      | Drowsy-Driving-Detected      |
      | Forward-Collision-Warning    |
      | Cellphone-Distracted-Driving |
      | Smoking-Distracted-Driving   |
      | Drinking-Distracted-Driving  |
      | FAILME                       |

  @Violation
  Scenario Outline:  Test Fleet Violations with param <tagSearch>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/violations'+'?tagSearch='+'<tagSearch>'+'&'+DATERANGE
    #And request  {"tagSearch":<tagSearch>}
    When method GET
    Then status 200
    And print response
    Examples:
    Examples:
      | tagSearch          |
      | CELLPHONE          |
      | SMOKING            |
      | EATING_OR_DRINKING |
      | COLLISION          |
      | NO_SEATBELT        |
      | OTHER              |
      | FAILME             |

  @Violation
  Scenario:  Test Driver Violations
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/drivers/pushkar001/violations'+'?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @Violation
  Scenario Outline:  Test Driver Violations with param with <Violation>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/drivers/pushkar001/violations'+'?eventType='+'<Violation>'+'&'+DATERANGE
    #And request  {"eventType":<Violation>}
    When method GET
    Then status 200
    And print response
    Examples:
      | Violation                    |
      | Traffic-Speed-Violated       |
      | Cornering                    |
      | Traffic-STOP-Sign-Violated   |
      | Harsh-Braking                |
      | Harsh-Acceleration           |
      | Tail-Gating-Detected         |
      | Lane-Drift-Found             |
      | Distracted-Driving           |
      | MaxSpeedExceeded             |
      | Drowsy-Driving-Detected      |
      | Forward-Collision-Warning    |
      | Cellphone-Distracted-Driving |
      | Smoking-Distracted-Driving   |
      | Drinking-Distracted-Driving  |
      | FAILME                       |

  @Violation
  Scenario Outline:  Test Driver Violations with param with <tagSearch>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/drivers/pushkar001/violations'+'?tagSearch='+'<tagSearch>'+'&'+DATERANGE
    #And request  {"tagSearch":<tagSearch>}
    When method GET
    Then status 200
    And print response
    Examples:
      | tagSearch          |
      | CELLPHONE          |
      | SMOKING            |
      | EATING_OR_DRINKING |
      | COLLISION          |
      | NO_SEATBELT        |
      | OTHER              |
      | FAILME             |

  @Mounting
  Scenario:   Test incorrect mounted camera
    Given url TestQAURL+'/incorrect-camera-mounting/assets'+'?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @DVR
  Scenario:   Test Fleet DVR requests
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/uploadRequests'+'?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @DVR
  Scenario Outline: :   Test Fleet DVR requests by <tagSearch>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/uploadRequests'+'?'+DATERANGE+'&tagSearch='+'<tagSearch>'
    When method GET
    Then status 200
    And print response
    Examples:
      | tagSearch          |
      | CELLPHONE          |
      | SMOKING            |
      | EATING_OR_DRINKING |
      | COLLISION          |
      | NO_SEATBELT        |
      | OTHER              |
      | FAILME             |

  @DVR
  Scenario:   Test DVR requests
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/drivers/pushkar001/uploadRequests'+'?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @DVR
  Scenario Outline:   Test DVR requests with Tagsearch by <tagSearch>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/drivers/pushkar001/uploadRequests'+'?'+DATERANGE+'&tagSearch='+'<tagSearch>'
    When method GET
    Then status 200
    And print response
    Examples:
      | tagSearch          |
      | CELLPHONE          |
      | SMOKING            |
      | EATING_OR_DRINKING |
      | COLLISION          |
      | NO_SEATBELT        |
      | OTHER              |
      | FAILME             |

  @eDVR
  Scenario:   Test eDVR requests
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/edvr-requests/list'+'?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @eDVR
  Scenario Outline:   Test eDVR requests with Tagsearch by <status>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/edvr-requests/list'+'?'+DATERANGE+'&status='+'<status>'
    When method GET
    Then status 200
    And print response
    Examples:
      | status   |
      | FINISHED |
      | FAILME   |


  @External
  Scenario:   Test External requests
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/external-events'+'?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @External
  Scenario Outline:   Test External Events with Tagsearch by <status>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/external-events'+'?'+DATERANGE+'&status='+'<status>'
    When method GET
    Then status 200
    And print response
    Examples:
      | status   |
      | FINISHED |
      | FAILME   |


  @AggregateViolation
  Scenario Outline: test Violation Aggregates by Fleet and by <period>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/aggregate'+'?'+DATERANGE+'&groupBy='+'<period>'
    When method GET
    Then status 200
    And print response
    Examples:
      | period |
      | week   |
      | month  |
      | day    |

  @AggregateViolation
  Scenario Outline: test Violation Aggregates by Fleet and by <period> and <duty>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/aggregate'+'?'+DATERANGE+'&groupBy='+'<period>'+'&dutyType='+'<duty>'
    When method GET
    Then status 200
    And print response
    Examples:
      | period | duty   |
      | week   | light
      | month  | medium |
      | day    | heavy
      | day    | light
      | day    | medium |

  @AggregateDriverViolation
  Scenario Outline: test Violation Aggregates by Fleet Driver and by <period>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/drivers/pushkar001/aggregate'+'?'+DATERANGE+'&groupBy='+'<period>'
    When method GET
    Then status 200
    And print response
    Examples:
      | period |
      | week   |
      | month  |
      | day    |

  @AggregateDriverViolation
  Scenario Outline: test Violation Aggregates by Fleet Driver and by <period> and <duty>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/drivers/pushkar001/aggregate'+'?'+DATERANGE+'&groupBy='+'<period>'+'&dutyType='+'<duty>'
    When method GET
    Then status 200
    And print response
    Examples:
      | period | duty   |
      | week   | light
      | month  | medium |
      | day    | heavy
      | day    | light
      | day    | medium |


  @AggregateDriverViolation
  Scenario Outline: test Violation Aggregates for Asset by <period>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/assets/864281042307489-4/aggregate'+'?'+DATERANGE+'&groupBy='+'<period>'
    When method GET
    Then status 200
    And print response
    Examples:
      | period |
      | week   |
      | month  |
      | day    |

  @AggregateDriverViolation
  Scenario Outline: test Violation Aggregates for  Asset by <period> and <duty>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/assets/864281042307489-4/aggregate'+'?'+DATERANGE+'&groupBy='+'<period>'+'&dutyType='+'<duty>'
    When method GET
    Then status 200
    And print response
    Examples:
      | period | duty   |
      | week   | light
      | month  | medium |
      | day    | heavy
      | day    | light
      | day    | medium |

  @AssetList
  Scenario Outline: test Asset Trips  by <period> and <duty>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/assets/'+ASSET+'/trips'+'?'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | period | duty   |
      | week   | light
      | month  | medium |
      | day    | heavy
      | day    | light
      | day    | medium |

  @DeviceList
  Scenario Outline: test Device aggregate  by <period> and <duty>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/devices/'+DEVICE+'/aggregate/trips'+'?'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | period | duty   |
      | month  | light
      | month  | medium |
      | month  | heavy
      | day    | light
      | day    | medium |


  @ListIgnitionId
  Scenario:   Test Ignition Trip Details
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/ignitions/'+IGNITION_ID+'/trips'+'?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @Assettrips
  Scenario:   Test AssetTrips -SORT
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/assets/864281042307489-4/trips'+'?'+DATERANGE+'&sort=desc'
    When method GET
    Then status 200
    And print response

  @Assettrips
  Scenario:   Test AssetTrips - SKIP
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/assets/864281042307489-4/trips'+'?'+DATERANGE+'&limit=50&skip=0'
    When method GET
    Then status 200
    And print response

  @Assettrips
  Scenario:   Test AssetTrips -Date Range
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/assets/864281042307489-4/trips'+'?'+DATERANGE
    When method GET
    Then status 200
    And print response