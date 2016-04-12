Feature: Set Why
  So that I know I have a guide by which to pick my self vision, I want to set my why.

  @javascript
  Scenario: Set why
    Given I am logged in
    When I view my visions
    And I set my why contribution to 'do right by others'
    And I set my why impact to 'everyone succeeds'
    Then my why should be updated