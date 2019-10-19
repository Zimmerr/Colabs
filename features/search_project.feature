Feature: Search a project resource
  As a user
  In order to quick find my projects
  I want to be able to edit it

#Isso aqui faz o login de acordo com o fixedLogin_steps.rb
Background: im logged in
  Given I login successfully

Scenario: search for a valid project
  Given I am on first page
  When I fill the search project form with "Projeto Teste" as search_term
  And click on the 'Buscar' button
  Then at least one project should be finded
  And I should be able to see it

