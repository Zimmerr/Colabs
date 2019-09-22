Feature: Create Account Click
  As a system user
  I want our users to be secured with a user registration
  So that they have a desired and expected result

  Scenario: User clicks the cadastrar_usuario button
    Given I am on the cadastrar_usuario page
    When I fill the new user form with "Dummy" as name and "dummy@gmail.com" as email and "dummy123" as password and "dummy123" as confirmation
    And click on the 'Entrar no Colabs!' button
    Then the number of existent users shoulbe be increased by one
    And I should be sent back to the homepage
