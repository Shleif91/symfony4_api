Feature:
  In system to prove that the users can work with information
  As a user
  I want to have a create/read/update/delete for users

  Scenario: Can add new user
    Given the request body is:
      """
      {
        "username": "Testuser",
        "plainPassword": "123456",
        "email": "testuser@example.com"
      }
      """
    And the "Content-Type" request header contains "application/ld+json"
    When I request "/api/users" using HTTP POST
    Then the response code is 201
