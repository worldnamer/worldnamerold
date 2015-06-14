Feature: Rename Section
  So that I can fix typos in section names
  I want to rename sections

  @javascript
  Scenario: Simple update
    Given I am logged in
    And I have a project
    When I update my links section to be named 'Updated Links'
    Then that section should be renamed