Given (/^I login successfully$/) do
    # Verificar se dá pra usar helper methods por boas praticas
    steps %Q{
      Given I am on the homepage
      And There is an registered user
      When I fill the login form with login information
      And I click the Login button
      Then I should see the initial user page
    }
end 