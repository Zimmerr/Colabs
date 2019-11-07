Given (/^I created a predefined list$/) do

  steps %Q{
    Given I clicked on the task button of my project
  	And got redirected to the task board page
  	And click on the button related to the list page
    When I should fill the form with name "Fazendo" and description "Lista de tarefas sendo executadas no momento"
    Then I should click the Criar Lista button
    Then I should see a row on the Lists table containing "Fazendo" and "Lista de tarefas sendo executadas no momento"
  }

end
