Feature:  Test V2 API in scope
  #@report=true

  Background:  Check all V2 API
	# Set the Auth credentials here
    * configure headers = read('data/OAuth2-Cobli.js')
	# Change the environment for other API
    * def ENV = 'v2'
    * def TestQAURL = 'https://api-beta.lightmetrics.co/v2'
    * def DATERANGE = 'before=2023-06-01&after=2023-04-01'
    * def FLEETID =   'd880f430-7a5e-4b86-8255-5733732bffe8'
    * def DEVICE = '862798051192173'
    * def ASSET = '862798051192173'
    * def DRIVERID = '_UNASSIGNED'
    * def IGNITION_ID = 'ignition_2023_06_06_12_09_51_786_862798051192173_Bibjn'

  @FleetTrips
  Scenario:  Test Fleet trips -Daterange
    Given url TestQAURL+'/fleets/'+FLEETID+'/trips?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @FleetTrips
  Scenario Outline:  Test Fleet trips -Event -minevent
    Given url TestQAURL+'/fleets/'+FLEETID+'/trips?'+'minEvent=<minEvent>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | minEvent |
      | 0        |
      | 4        |
      | 8        |
      | -1       |

  @FleetTrips
  Scenario:  Test Fleet trips -Event -maxevent
    Given url TestQAURL+'/fleets/'+FLEETID+'/trips?'+'maxEvent=3&'+DATERANGE
    When method GET
    Then status 200
    And print response

  @FleetTrips
  Scenario:  Test Fleet trips - Range
    Given url TestQAURL+'/fleets/'+FLEETID+'/trips?'+'skip=0&limit=1&'+DATERANGE
    When method GET
    Then status 200
    And print response

  @FleetTrips
  Scenario Outline:  Test Fleet trips -<sortOrder>
    Given url TestQAURL+'/fleets/'+FLEETID+'/trips?'+'sort=<sortOrder>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | sortOrder |
      | asc       |
      | desc      |

  @FleetTrips
  Scenario Outline:  Test Fleet trips <dutyType>
    Given url TestQAURL+'/fleets/'+FLEETID+'/trips?'+'dutyType='+'<dutyType>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | dutyType |
      | light    |
      | heavy    |


  @FleetAggregate
  Scenario Outline:  Test Fleet Aggregate -dutyType with <dutyType>
    Given url TestQAURL+'/fleets/'+FLEETID+'/aggregate?'+'dutyType='+'<dutyType>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | dutyType |
      | light    |
      | heavy    |


  @FleetAggregate
  Scenario Outline:  Test Fleet Aggregate -dutyType with <dutyType> and <insignificant>
    Given url TestQAURL+'/fleets/'+FLEETID+'/aggregate?'+'dutyType='+'<dutyType>&'+DATERANGE+'&insignificant=<insignificant>'
    When method GET
    Then status 200
    And print response
    Examples:
      | dutyType | insignificant |
      | light    | true          |
      | light    | false         |
      | heavy    | true          |
      | heavy    | false         |

  @FleetAggregate
  Scenario Outline:  Test Fleet Aggregate -groupBy with <Days>
    Given url TestQAURL+'/fleets/'+FLEETID+'/aggregate?'+'groupBy='+'<Days>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | Days  |
      | week  |
      | month |

  @FleetAggregate
  Scenario:   Test Fleet Aggregate -Daterange
    Given url TestQAURL+'/fleets/'+FLEETID+'/aggregate?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @FleetAggregate
  Scenario:   Test Fleet Aggregate -SKIP
    Given url TestQAURL+'/fleets/'+FLEETID+'/aggregate?'+'skip=0&limit=1&'+DATERANGE
    When method GET
    Then status 200
    And print response


  @DriverTrips
  Scenario:   Test driver trips -Skip
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/trips?'+'skip=0&limit=1&'+DATERANGE
    When method GET
    Then status 200
    And print response

  @DriverTrips
  Scenario:   Test driver trips by DateRange
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/trips?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @DriverTrips
  Scenario Outline:   Test driver trips by Division <divison>
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/trips?'+'division=<divison>&'+DATERANGE
    When method GET
    Then status 200
    #And def sortedkeys = karate.sort(response)
    And print response
    Examples:
      | divison |
      | east    |
      | west    |
      | north   |
      | south   |

  @DriverTrips
  Scenario Outline:   Test driver trips by <sortOrder>
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/trips?'+'sort=<sortOrder>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | sortOrder |
      | asc       |
      | desc      |

  @DriverAggregate
  Scenario:   Test driver Aggregate by Division
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/aggregate?'+'division=test&'+DATERANGE
    When method GET
    Then status 200
    And print response

  @DriverAggregate
  Scenario:   Test driver Aggregate by Daterange
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/aggregate?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @DriverAggregate
  Scenario:   Test driver Aggregate by Limit
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/aggregate?'+'skip=0&limit=1&'+DATERANGE
    When method GET
    Then status 200
    And print response

  @DriverAggregate
  Scenario Outline:   Test driver Aggregate by <sortOrder>
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/aggregate?'+'sort=<sortOrder>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | sortOrder |
      | asc       |
      | desc      |

  @DriverAggregate
  Scenario Outline:   Test driver Aggregate by DutyType <dutyType>
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/aggregate?'+'dutyType=<dutyType>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    #And def command = 'jq "-S ." response'
    #And def result = karate.exec(command)
    #And print 'Jq output:', result.stdout
    #And match result.exitCode == 0

    And print response
    Examples:
      | dutyType |
      | light    |
      | medium   |

  @AssetTrips
  Scenario Outline:   Test Asset trips by <sortOrder>
    Given url TestQAURL+'/fleets/'+FLEETID+'/assets/'+ASSET+'/trips?'+'sort='+'<sortOrder>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | sortOrder |
      | asc       |
      | desc      |

  @AssetTrips
  Scenario:   Test Asset trips by Daterange
    Given url TestQAURL+'/fleets/'+FLEETID+'/assets/'+ASSET+'/trips?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @AssetTrips
  Scenario:   Test Asset trips by limit
    Given url TestQAURL+'/fleets/'+FLEETID+'/assets/'+ASSET+'/trips?'+'skip=0&limit=1&'+DATERANGE
    When method GET
    Then status 200
    And print response

  @Assetaggregate
  Scenario:   Test Asset Aggregate by Limit
    Given url TestQAURL+'/fleets/'+FLEETID+'/assets/'+ASSET+'/aggregate?'+'skip=0&limit=1&'+DATERANGE
    When method GET
    Then status 200
    And print response

  @Assetaggregate
  Scenario:   Test Asset Aggregate by DateRange
    Given url TestQAURL+'/fleets/'+FLEETID+'/assets/'+ASSET+'/aggregate?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @Assetaggregate
  Scenario Outline:   Test Aggregate trips by GroupBy : <range>
    Given url TestQAURL+'/fleets/'+FLEETID+'/assets/'+ASSET+'/aggregate?'+'groupBy=<range>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | range |
      | day   |
      | week  |

  @FleetOngoing
  Scenario:   Test Fleet Ongoing trips
    Given url TestQAURL+'/fleets/'+FLEETID+'/ongoing-trips'
    When method GET
    Then status 200
    And print response

  @FleetOngoing
  Scenario Outline:   Test Fleet Ongoing trips <sortOrder>
    Given url TestQAURL+'/fleets/'+FLEETID+'/ongoing-trips?'+'sort=<sortOrder>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | sortOrder |
      | asc       |
      | desc      |

  @FleetOngoing
  Scenario:   Test Fleet Ongoing trips -Limit
    Given url TestQAURL+'/fleets/'+FLEETID+'/ongoing-trips?'+'limit=1&skip=0&'+DATERANGE
    When method GET
    Then status 200
    And print response

  @FleetOngoing
  Scenario:   Test Fleet Ongoing trips -lastUpdatedWithin
    Given url TestQAURL+'/fleets/'+FLEETID+'/ongoing-trips?'+'lastUpdatedWithin=3600'
    When method GET
    Then status 200
    And print response

  @FleetLatest
  Scenario Outline:   Test Fleet Latest trips -includeInsignificantTrips
    Given url TestQAURL+'/fleets/'+FLEETID+'/latest-trips-by-asset-id'+'?assetId='+ASSET+'&includeInsignificantTrips=<insignificant>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | insignificant |
      | true          |
      | false         |

  @FleetLatest
  Scenario:   Test Fleet Latest trips -Limit Skip
    Given url TestQAURL+'/fleets/'+FLEETID+'/latest-trips-by-asset-id'+'?limit=1&skip=0&'+DATERANGE+'&includeInsignificantTrips=true'
    When method GET
    Then status 200
    And print response

  @FleetLatest
  Scenario Outline:   Test Fleet Latest trips - <sortOrder>
    Given url TestQAURL+'/fleets/'+FLEETID+'/latest-trips-by-asset-id'+'?sort=<sortOrder>&'+DATERANGE+'&includeInsignificantTrips=true'
    When method GET
    Then status 200
    And print response
    Examples:
      | sortOrder |
      | asc       |
      | desc      |

  @DVRSTATS
  Scenario:   Test DVR Stat -Daterange
    Given url TestQAURL+'/fleets/'+FLEETID+'/violations/aggregate?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @AggregateDriverViolation
  Scenario:   Test Driver aggregate Violation
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/violations/aggregate?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @AggregateAssetViolation
  Scenario:   Test Asset aggregate Violation
    Given url TestQAURL+'/fleets/'+FLEETID+'/assets/'+ASSET+'/violations/aggregate?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @AggregateAssetViolation
  Scenario Outline:   Test Asset aggregate Violation GroupBy <range>
    Given url TestQAURL+'/fleets/'+FLEETID+'/assets/'+ASSET+'/violations/aggregate?'+'groupBy=<range>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | range |
      | day   |
      | week  |


  @ListdriverViolation
  Scenario:   Test Asset Driver Violation
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/violations?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @ListdriverViolation
  Scenario:   Test Asset driver Violation -bookmarkedOnly
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/violations?'+'bookmarkedOnly=true&'+DATERANGE
    When method GET
    Then status 200
    And print response

  @ListdriverViolation
  Scenario Outline:   Test Asset driver Violation -<sortOrder>
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/violations?'+'sort=<sortOrder>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | sortOrder |
      | asc       |
      | desc      |

  @ListdriverViolation
  Scenario Outline:   Test Asset driver Violation -Challenge
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/violations?'+'challengeRaised=<challengeRaised>&challengeResolved=<challengeResolved>&challengeAccepted=<challengeAccepted>&'+DATERANGE+'&sort=desc'
    When method GET
    Then status 200
    And print response
    Examples:
      | challengeRaised | challengeResolved | challengeAccepted |
      | true            | true              | true              |
      | false           | false             | false             |
      | true            | true              | false             |


  @ListdriverViolation
  Scenario Outline:   Test Asset Driver Violations Sortby
    Given url TestQAURL+'/fleets/'+FLEETID+'/drivers/'+DRIVERID+'/violations?'+'sortBy=<sortBy>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | sortBy    |
      | severity  |
      | timestamp |

  @ListFleetViolation
  Scenario:   Test Fleet  Violation -DateRange
    Given url TestQAURL+'/fleets/'+FLEETID+'/violations?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @ListFleetViolation
  Scenario:   Test Fleet  Violation
    Given url TestQAURL+'/fleets/'+FLEETID+'/violations?'+'bookmarkedOnly=true&'+DATERANGE
    When method GET
    Then status 200
    And print response

  @ListFleetViolation
  Scenario Outline:   Test Fleet  Violation- <sortOrder>
    Given url TestQAURL+'/fleets/'+FLEETID+'/violations?'+'sort=<sortOrder>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | sortOrder |
      | asc       |
      | desc      |

  @ListFleetViolation
  Scenario Outline:   Test Fleet  Violation -Challenge
    Given url TestQAURL+'/fleets/'+FLEETID+'/violations?'+'challengeRaised=<challengeRaised>&challengeResolved=<challengeResolved>&challengeAccepted=<challengeAccepted>&'+DATERANGE
    When method GET
    Then status 200
    And print response
    Examples:
      | challengeRaised | challengeResolved | challengeAccepted |
      | true            | true              | true              |
      | false           | false             | false             |
      | true            | true              | false             |


  @ListFleetViolation
  Scenario Outline:   Test Fleet  Violation -Challenge
    Given url TestQAURL+'/fleets/'+FLEETID+'/violations?'+DATERANGE+'&challengeRaisedBefore=<challengeRaisedBefore>&challengeRaisedAfter=<challengeRaisedAfter>&challengeResolvedBefore=<challengeResolvedBefore>&challengeResolvedAfter=<challengeResolvedAfter>'
    When method GET
    Then status 200
    And print response
    Examples:
      | challengeRaisedBefore | challengeRaisedAfter | challengeResolvedBefore | challengeResolvedAfter |
      | 2023-05-16            | 2023-04-27           | 2023-05-23              | 2023-04-27             |
      | 2023-05-23            | 2023-04-27           | 2023-05-10              | 2023-04-27             |

  @ListAssetViolation
  Scenario:   Test Asset  Violation
    Given url TestQAURL+'/fleets/'+FLEETID+'/assets/'+ASSET+'/violations?'+DATERANGE
    When method GET
    Then status 200
    And print response

  @ListAssetViolation
  Scenario:   Test Asset  Violation
    Given url TestQAURL+'/fleets/'+FLEETID+'/assets/'+ASSET+'/violations?'+'skip=0&limit=1&'+DATERANGE
    When method GET
    Then status 200
    And print response

  @ExternalEvents
  Scenario:   Test External Events
      #* def ExternalEvents = read('data/ExternalEventsV1.json')
    Given url TestQAURL+'/fleets/'+FLEETID+'/external-events?'+DATERANGE+'&limit=10&skip=0&sort=desc'
    When method GET
    Then status 200
      #And match response == ExternalEvents
    And print response

  @eDVRList
  Scenario: Test eDVR Request List
    Given url TestQAURL+'/fleets/'+FLEETID+'/edvr-requests/list'
    When method GET
    Then status 200
    And print response

  @eDVRList
  Scenario: Test eDVR Request List
    Given url TestQAURL+'/fleets/'+FLEETID+'/edvr-requests/list?status=FINISHED&'+DATERANGE
    When method GET
    Then status 200
    And print response

  @eDVRList
  Scenario Outline:  Test eDVR Request List by sortOrder <sortOrder> and <STATUS>
    Given url TestQAURL+'/fleets/'+FLEETID+'/edvr-requests/list?status=<STATUS>&'+DATERANGE+'&sort=<sortOrder>&limit=100&skip=0'
    When method GET
    Then status 200
    And print response
    Examples:
      | sortOrder | STATUS       |
      | desc      | PENDING      |
      | desc      | ACKNOWLEDGED |
      | desc      | STARTED      |
      | desc      | FINISHED     |
      | desc      | UNAVAILABLE  |
      | desc      | FAILED       |
      | desc      | CANCELED     |
      | asc       | FINISHED     |


  @eDVRList
  Scenario: Test Aggregate eDVR
    Given url TestQAURL+'/fleets/'+FLEETID+'/edvr-requests/aggregate?'+DATERANGE
    When method GET
    Then status 200
    And print response