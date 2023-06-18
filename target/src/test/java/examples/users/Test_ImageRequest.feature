Feature: Test Image Request
  karate.configure('readTimeout', 5000);

  Background:  Test ImageRequest
    # Set the Auth credentials here
    * configure headers = read('data/headers.js')
    # Change the environment for other API
    * def ENV = 'v1'
    * def URL = 'https://api-qa.lightmetrics.co/'

  @image
  Scenario Outline:  Test for all Image request formats
    Given url URL+ENV+'/dvr/create-capture-image-request'
    And request  {"deviceId":"353436105011125","imageQuality":<imagequality>,"imageTypeMainFrame":<imageTypeMainFrame>,"imageType":<imageType>,"imageResolution":<imageResolution>,"driverCameraImageQuality":10,"driverCameraImageResolution":"640x360"}
    When method POST
    Then status 200
    And print response.uploadRequestId
    * def UploadRequestID = response.uploadRequestId
    And print UploadRequestID
    And print response
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    * sleep(15000)
     #* def result = call ('Test_ImageRequest.feature@getImage') UploadRequestID
    Given url URL+ENV+'/device-management/devices/353436105011125/image-upload-requests/'+UploadRequestID
    When method GET
    Then status 200
    And print response.response.link
    #And match response.mediaFiles.imageDetails.imageQuality == <imagequality>
    Examples:
      | imagequality | imageType        | imageTypeMainFrame | imageResolution |
      | 1            | road             | road               | 1280x720        |
      | 10           | road             | driver             | 1280x720        |
      | 1            | separate         | road               | 640x360         |
      | 10           | sideBySide       | driver             | 640x360         |
      | 1            | pictureInPicture | road               | 640x360         |
      | 10           | pictureInPicture | driver             | 640x360         |
      | 1            | pictureInPicture | road               | 320x180         |
      | 10           | pictureInPicture | driver             | 320x180         |
      | 1            | pictureInPicture | road               | 1280x720        |
      | 10           | pictureInPicture | driver             | 1280x720        |
      | 1            | pictureInPicture | road               | 320x180         |
      | 10           | pictureInPicture | driver             | 640x360         |
      | 1            | pictureInPicture | road               | 1920x1080       |
      | 10           | pictureInPicture | driver             | 1920x1080       |