Feature: Update Goal
  So that I can correct mistakes and keep my records current
  I want to update goals

  @javascript
  Scenario: Simple update
    Given I am logged in
    And I have a goal
    When I view my goals
    And I update the goal description to 'Test This'
    Then my goal should be updated