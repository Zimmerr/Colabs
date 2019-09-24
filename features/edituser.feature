Feature: Edit user information
  As a user
  In order to change my data
  I want to edit it

#Isso aqui faz o login de acordo com o fixedLogin_steps.rb
Background: im logged in
  Given I login successfully
 
Scenario: using a valid user
  Given I am on the Edit User page
  When I fill the edit user form with "Dummy Silva" as name and "dummy@gmail.com" as email and "dummy1234" as password and "dummy1234" as confirmation
  And click on the 'Atualizar' button
  Then the number of existent users shoulbe be the same
  And I should see a confirmation message