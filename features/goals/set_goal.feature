Feature: Set New Goal
  So that I can continually improve
  I want to set new goals for myself.

  Scenario: No goals
    Given I am logged in
    When I set a new goal
    Then I should have a goal