@EndToEnd
Feature: Automate end to end scenario

  Background:  Generate Token
    Given url "https://tek-insurance-api.azurewebsites.net"
   And path "/api/token"
   And request {"username": "supervisor","password": "tek_supervisor"}"
   When method post
   Then status 200
    And print response
    * def generatedToken = response.token
    And print generatedToken 
   
    Scenario: End to End
    And path "/api/accounts/add-primary-account"
    * def generator = Java.type('api.assignment.test.APIDataGenerator')
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def title = generator.getTitle()
    * def dob = generator.DateOfBirth()
    * def phoneNumber = generator.getPhoneNumber()
    * def phoneExtension = generator.getExtentsionphone()
		* def address = generator.getStreetAdress()
		* def cityName = generator.getCity()
		* def state = generator. getState()
	* def zipCode = generator.getPostalCode()
	* def countryCode = generator.getCountryCode()
 
    And request
    """
     {
     
    "email": "#(email)", 
    "firstName": "#(firstName)",
    "lastName": "#(lastName)",
    "title": "#(title)",
    "gender": "FEMALE",
    "maritalStatus": "SINGLE",
     "employmentStatus": "employee", 
      "dateOfBirth": "#(dob)",
      "new": true
      }
      """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response 
    * def dynamicId = response.id
    * def expectedResult = response.email
  
    Then assert expectedResult == email
 
 And path "/api/accounts/add-account-phone"
 And param primaryPersonId = dynamicId
 And request
 """
 {
 "id": 0,
  "phoneNumber": "#(phoneNumber)",
  "phoneExtension": "#(phoneExtension)",
  "phoneTime": "Morning",
  "phoneType": "Work"
}
"""
And header Authorization = "Bearer " + generatedToken
When method post
Then status 201
And print response

And path "/api/accounts/add-account-address"
And param primaryPersonId = dynamicId
And request
"""
{
  "id": 0,
  "addressType": "#(address)",
  "addressLine1": "4633 tower ct",
  "city": "#(cityName)",
  "state": "#(state)",
  "postalCode": "#(zipCode)",
  "countryCode": "#(countryCode)",
  "current": true
}
"""
And header Authorization = "Bearer " + generatedToken
When method post
Then status 201
And print response


 And path "/api/accounts/add-account-car"
 And param primaryPersonId = dynamicId
 And request
 """
 {
  "id": 0,
  "make": "Toyota",
  "model": "camry",
  "year": "2019",
  "licensePlate": "VA-2233"
}
 """
 And header Authorization = "Bearer " + generatedToken
 When method post
 Then status 201
 And print response
 
       