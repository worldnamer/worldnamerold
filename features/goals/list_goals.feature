Feature: List goals
  So that I can review my goals and modify them as my life changes
  I want to be able to see all the goals I've created

  @javascript
  Scenario: A goal
    Given I am logged in
    And I have a goal
    When I view my goals
    Then I should see my goal in the list

  Scenario: Multiple users
    Given I am logged in
    And I have a goal
    And another user has a goal
    When I view my goals
    Then I should see one goal in the list