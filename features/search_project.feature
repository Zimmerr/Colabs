Feature: Search a project resource
  As a user
  In order to quick find my projects
  I want to be able to edit it

#Isso aqui faz o login de acordo com o fixedLogin_steps.rb
Background: im logged in
  Given I login successfully

@javascript
Scenario: search for a valid project
  Given I am on first page
  When click on the 'clicando aqui!' link
  And click on the 'Novo projeto' button
  And I fill the create project form with "Meu prjeto" as name and "Minha Descricao" as desc
  And click on the 'Create Project' button
  And click on the 'Buscar' button
  And I fill the search project form with "" as search_term
  Then I should be able to see it

