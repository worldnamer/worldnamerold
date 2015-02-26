Feature: Delete Snippet
  So I can keep resources for a project current
  I want to delete snippets from a project

  Scenario: Clean deletion
    Given I am logged in
    And I have a project
    And I have a snippet
    When I delete the snippet
    Then I should have no snippets