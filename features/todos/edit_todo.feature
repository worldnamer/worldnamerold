Feature: Edit Todo
  So I can update a todo with more detail
  I would like to update todos

  @javascript
  Scenario: One todo
    Given I am logged in
    And I have a project with a todo
    When I update that todo to 'Updated Todo'
    Then my todo should be 'Updated Todo'