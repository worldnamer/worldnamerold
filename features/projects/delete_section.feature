Feature: Delete Section
  In order to remove irrelevant sections or sections that shouldn't have been added to a project
  I want to delete sections

  Scenario: One section
    Given I am logged in
    And I have a project
    And I have a section in that project
    When I delete that section
    Then I should have no sections in that project