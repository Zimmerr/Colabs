Given (/^I created a project$/) do
    # Verificar se dá pra usar helper methods por boas praticas
    steps %Q{
      Given I am on the homepage
      And There is an registered user
      When I fill the login form with login information
      And I click the Login button
      And click on the 'clicando aqui!' link
      And click on the 'Novo projeto' button
      And I fill the create project form with "Meu prjeto" as name and "Minha Descricao" as desc
      And click on the 'Create Project' button
      Then I should have at least one project
      And I should see my projects page
    }
end

