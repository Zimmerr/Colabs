Feature: Insert Lists
    Como um usuário
    Para que eu possa dividir melhor as tarefas de um projeto
    Eu quero criar categorias de tarefas customizadas dentro de um projeto

    Scenario: Inserting first List
        Given I am on the page of my created project
        Given I go to the Edit Lists page
        And My project have X lists
        When I should fill the form with name "Fazendo" and description "Lista de tarefas sendo executadas no momento"
        Then I should click the Criar Lista button
        Then I should see a row on the Lists table containing "Fazendo" and "Lista de tarefas sendo executadas no momento"
        And My project should have X+1 lists