Given (/^I created a predefined task after the predefined list$/) do

  steps %Q{
    When I go back to the task board page
    And click on the Add a card button on the 'Fazendo' list
    And fill the task form creating the new one
    Then I should see the task on the appropriate list
  }

end
