Feature: Edit user information
  As a user
  In order to change info on my created lists
  I want to edit a lists that is registered on my project

Background: im logged in and there is a list
  Given I login successfully
  And There is a created list
  And I go to the Lists page of my project
  Then I should see my list
  Then I should click the edit button
 
Scenario: edit with valid input
  Then I will try a new name and description
  Then I should click the save button
  And I want to see a Updated message
  And I should see my edited list

Scenario: edit with invalid input
  Then I will try a invalid name and description
  Then I should click the save button
  And I want to see a not Updated message
  And I should see my original list without changes