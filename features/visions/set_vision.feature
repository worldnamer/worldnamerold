Feature: Set Vision
  So that I know what I envision my best self being and can use that best self to identify what goals I should set
  I want to be able to specify my vision for myself in each life area.

  @javascript
  Scenario: Set heart vision
    Given I am logged in
    When I set my 'heart' vision
    Then my 'heart' vision should be updated