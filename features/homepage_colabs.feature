Feature: Homepage Colabs
  As a product manager
  I want our users to be directly redirect to the login option when they visit our site
  So that they have a quicker experience

  Scenario: Users sees the login container
    When I go to the homepage
    Then I should see the login container
