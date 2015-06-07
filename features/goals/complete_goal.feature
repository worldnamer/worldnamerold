Feature: Complete Goal
  So that I can keep completed goals as part of my goals history
  I want to mark goals completed when I finish them
  So I can look at the completed ones later.

  @javascript
  Scenario: Simple update
    Given I am logged in
    And I have a goal
    When I view my goals
    And I complete my goal
    Then my goal should be completed
    And my goal should not be visible on the goals page