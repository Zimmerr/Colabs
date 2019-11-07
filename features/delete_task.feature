Feature: Task deletion
  In order keep my task board updated
  As a project's member
  I want to be able to delete a task

  Background: im logged in
    Given I login successfully
    And I have created a project "Projeto Teste" with description "Projeto para fins de teste"

  @javascript
  Scenario: Deleting an existing task
    Given I clicked on the task button of my project
    And got redirected to the task board page
    And click on the button related to the list page
    When I should fill the form with name "Fazendo" and description "Lista de tarefas sendo executadas no momento"
    Then I should click the Criar Lista button
    Then I should see a row on the Lists table containing "Fazendo" and "Lista de tarefas sendo executadas no momento"
    When I go back to the task board page
    And click on the Add a card button on the 'Fazendo' list
    And fill the task form creating the new one
    Then I should see the task on the appropriate list
    Given I click on the Edit button of the existing task
    When I click on the Delete button
    Then the number of tasks should decrease by one
    And the task should not be found on the page
