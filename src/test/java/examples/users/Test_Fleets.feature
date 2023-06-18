#noinspection SpellCheckingInspection
Feature: Get Fleet List
  #@report=false

  Background:  Set Specific URL and details
    # Set the Auth credentials here
    * configure headers = read('data/headers.js')
    # Change the environment for other API
    * def ENV = 'v1'

    * def schema =
  """
		{fleetId: '#string'  , fleetName: '##string'}
		"""

  Scenario: Get Fleet List  #1
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets' + '?limit=500&skip=0'
    When method GET
    Then status 200
    And print response
    And match response.fleetId == '#present'
		#And match each response.rows[0] == schema
    #And match each response.rows == '#[] schema'

  @fleet
  Scenario: Get Fleet Details  #2
    * def FleetSchema =
	"""
	{ fleetId: '#string',fleetName:'#string',dateOfCreation:'#string',lastUpdated:'#string' }
	"""
	#* def FleetJson = """
	#{
	#"fleetId":"qatest001","fleetName":"Clear","dateOfCreation":"2022-09-06T16:13:22.586Z","lastUpdated":"2022-09-27T08:42:26.683Z"
	#}
	#"""
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001'
    * def fleetDetailsBeta = read('data/FleetDetailBetaV1.json')
    When method GET
    Then status 200
    And print response
    And match response contains { fleetId: "#string", fleetName:"#string",dateOfCreation:"#string",lastUpdated:"#string"}
    And match response == fleetDetailsBeta
    And match response == '#[] FleetSchema'


  Scenario: Get Fleet drivers  #3
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/drivers'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet Trips   #4
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/trips'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet Ongoing Trips   #5
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/ongoing-trips'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet Latest Trips   #6
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/latest-trips-by-asset-id'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet Trips by Ignition ID   #7
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/ignitions/ignition_2022_12_04_01_28_56_884_353436105011125_YfwXk/trips'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet Fetch Ignition Trips  #8
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/ignitions/ignition_2022_12_04_01_28_56_884_353436105011125_YfwXk'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet Violations  #9
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/violations'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet Violation Aggregate  #10
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/violations/aggregate'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet Coaching Events  #11
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/coaching-events'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet Trips Aggregate  #12
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/aggregate'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet Upload DVR  #13
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/uploadRequests'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet Upload e-DVR  #14
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/edvr-requests/list'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet DVR Aggregate #15
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/dvr-requests/aggregate'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet eDVR Aggregate #16
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/edvr-requests/aggregate'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet External Events #17
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/external-events'
    When method GET
    Then status 200
    And print response

  Scenario: Get Fleet External Events Aggregate #18
    Given url 'https://api-beta.lightmetrics.co/v1/'+'fleets/qatest001/external-events/aggregate'
    When method GET
    Then status 200
    And print response


  Scenario: Get Fleet Assets by Incorrect mounting Camera #19
    Given url 'https://api-beta.lightmetrics.co/v1/'+'incorrect-camera-mounting/assets'
    When method GET
    Then status 200
    And print response
