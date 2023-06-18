Feature: Test Webhooks
  #@report=false

  Background:  Test Webhooks
    # Set the Auth credentials here
    * configure headers = read('data/headers.js')
    #* configure headers = read('data/OAuth2-Vikram.js')  // Uncomment this when V2 is implemented
    # Change the environment for other API
    * def TestQAURL = 'https://api-beta.lightmetrics.co/v2'

  Scenario Outline: Register and Unregister Webhooks -LIST_WEBHOOK for <Webhook>
    Given url TestQAURL+'/webhooks/unsubscribe'+'?trigger='+'<Webhook>'
    When method POST
    Then status 200
    And print response
    Examples:
      | Webhook                    |
      | EVENT_CREATED              |
      | EVENT_VIDEO_UPLOADED       |
      | DEBUG_EVENT_CREATED        |
      | DEBUG_EVENT_VIDEO_UPLOADED |
      | TRIP_DATA_UPLOADED         |
      | EVENT_DVR_UPLOADED         |
      | EVENT_DVR_EXECUTED         |
      | DVR_EXECUTED               |
      | DVR_UPLOADED               |
      | VEHICLE_IGNITION_ON        |
      | VEHICLE_IGNITION_OFF       |
      | IMAGE_UPLOAD_EXECUTED      |
      | LIVESTREAM_STATUS_UPDATE   |
      | BAD_CAMERA_MOUNTING        |

  Scenario Outline: Register and Unregister Webhooks -LIST_WEBHOOK: <Webhook>
    Given url TestQAURL+'/webhooks/register'
    And request {"trigger":<Webhook>,"url":'https://white-qa.lightmetrics.co/webhooks/lm/lightmetrics_qa/event-handler' ,"authorization":""}
    When method POST
    Then status 200
    And print response
    Given url 'https://api-beta.lightmetrics.co'+'/v1/webhooks'
    When method GET
    Then status 200
    And print response
    #And match response.rows.trigger[0] == "<Webhook>"
    Examples:
      | Webhook                    |
      | EVENT_CREATED              |
      | EVENT_VIDEO_UPLOADED       |
      | DEBUG_EVENT_CREATED        |
      | DEBUG_EVENT_VIDEO_UPLOADED |
      | TRIP_DATA_UPLOADED         |
      | EVENT_DVR_UPLOADED         |
      | EVENT_DVR_EXECUTED         |
      | DVR_EXECUTED               |
      | DVR_UPLOADED               |
      | VEHICLE_IGNITION_ON        |
      | VEHICLE_IGNITION_OFF       |
      | IMAGE_UPLOAD_EXECUTED      |
      | LIVESTREAM_STATUS_UPDATE   |
      | BAD_CAMERA_MOUNTING        |