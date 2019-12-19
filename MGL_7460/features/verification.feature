Feature: Verifying User Information
  verify the user information with the data that was stored in the database and come from Github API

  Scenario: verify user's name
    Given Input user name by the user
    When verify the user's name with the database information
    Then show the result