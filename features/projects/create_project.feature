Feature: Create a project
  In order to more quickly and less painfully complete projects
  I want to create projects in the app
  So I can organize resources and schedules

  Scenario: No projects
    Given I am logged in
    When I create a project
    Then I should have a project