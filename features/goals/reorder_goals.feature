Feature: Reorder goals
  So that I can reflect the importance of a goal within my life
  I want to be able to reorder my goals

  @javascript
  Scenario: Two goals
    Given I am logged in
    And I have the following goals
      | description |
      | Goal one    |
      | Goal two    |
    When I move the top goal to the bottom
    Then it should reorder that goal as last