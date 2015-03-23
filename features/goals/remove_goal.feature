Feature: Remove goal
  So that I can discard outdated goals as my life evolves
  I want to remove goals from my list

  Scenario: One goal
    Given I am logged in
    And I have a goal
    When I delete that goal
    Then I should have no goals