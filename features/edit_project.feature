Feature: Edit project information
  As a user
  In order to change project data
  I want to edit it

#Isso aqui faz o login de acordo com o fixedLogin_steps.rb
Background: im logged in
  Given I login successfully

Scenario: using a valid project
  Given I am on the Edit Project page
  When I fill the edit project form with "Projeto Teste" as name and "Descricao Teste" as desc and 1 as id
  And click on the 'Atualizar' button
  Then the number of existent projects shoulbe be the same
  And I should be sent back to the meus_projetos
