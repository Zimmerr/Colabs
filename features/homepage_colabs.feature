Feature: Homepage Colabs
  As a product manager
  I want our users to be directly redirect to the login option when they visit our site
  So that they have a quicker experience

  Scenario: Users not logged in
    When I go to the homepage
    Then I should see the login container

  Scenario: User is logged in and there are projects
    Given I login successfully
    And I have created a project "Projeto Teste" with description "Projeto para fins de teste"
    When I go to the homepage
    Then I should see my project named "Projeto Teste"

  Scenario: User is logged in and no projects are created
    Given I login successfully
    When I go to the homepage
    Then I should see that there is no projects to be shown

  