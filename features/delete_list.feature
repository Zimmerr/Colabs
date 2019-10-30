Feature: Edit user information
  As a user
  In order to manage my lists being used or not
  I want to delete lists that doesnt contain any task

#Isso aqui faz o login de acordo com o fixedLogin_steps.rb
Background: im logged in and there is a project with one empty list and one list with a task
  Given I login successfully
  And There is a created project with some lists
  And I go to the Lists page of my project
 
 @javascript
Scenario: deleting a empty list
  Then I should see my empty list
  Then I will delete the empty list
  Then The empty list should be gone
  And I want to see a confirmation message

@javascript
Scenario: trying to delete a list with tasks and failing
  Then I should see my filled list
  Then I will try to delete the filled list
  Then The filled list should still be there
  And I want to see a failure message warnig about the filled list still being ther