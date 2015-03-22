Feature: Complete Todo
  So I can track my progress on a project
  I would like to mark todos as done

  @javascript
  Scenario: One todo
    Given I am logged in
    And I have a project with a todo
    When I mark that todo complete
    Then my todo should be done