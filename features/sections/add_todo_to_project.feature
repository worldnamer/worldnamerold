Feature: Add Todo to project
  So that I can keep track of stuff that needs to be done for a project
  I want to add todos to that project

  Scenario: No todos
    Given I am logged in
    And I have a project
    When I add a todo to my project
    Then I should have that todo