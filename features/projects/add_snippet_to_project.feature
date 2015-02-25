Feature: Add Snippet to Project
  In order to keep track of web resources helpful to a project
  I want to add snippets to the project

  Scenario: Add snippet
    Given I am logged in
    And I have a project
    When I create a snippet
    Then I should have a snippet