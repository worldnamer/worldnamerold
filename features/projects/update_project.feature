Feature: Update Project
  So that I can correct mistakes and keep my records current
  I want to update projects

  @javascript
  Scenario: Simple update
    Given I am logged in
    And I have a project
    When I view my project
    And I update its name to 'Test This'
    Then my project should be updated

  @javascript
  Scenario: Successive updates
    Given I am logged in
    And I have a project
    When I view my project
    And I update its name to 'Test This'
    And I update its description to 'This is a lengthy description of many characters.'
    Then my project should be updated