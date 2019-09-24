Feature: Login Click
  As a system user
  I want our users to be secured with a user login
  So that they have access to their projects and tasks

  Scenario: User clicks the login button
    Given I am on the homepage
    And There is an registered user
    When I fill the login form with login information
    And I click the Login button
    Then I should see the initial user page
