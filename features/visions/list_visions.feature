Feature: List Visions
  So that I know what I envision my best self being and can use that best self to identify what goals I should set
  I want to be able to see my vision for myself in each life area.

  @javascript
  Scenario: No visions specified
    Given I am logged in
    When I view my visions
    Then I should see all the life areas
    And no visions should be present