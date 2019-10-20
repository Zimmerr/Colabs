Feature: Crate project
  As a user
  In order to organize myself and teamates
  I want to create projects

#Isso aqui faz o login de acordo com o fixedLogin_steps.rb
Background: im logged in
  Given I login successfully

@javascript
Scenario: created a project with no problems
  Given I am on the main page
  When click on the 'clicando aqui!' link
  And click on the 'Novo projeto' button
  And I fill the create project form with "Meu prjeto" as name and "Minha Descricao" as desc
  And click on the 'Create Project' button
  Then I should have at least one project
  And I should see my projects page

