Feature: Delete Project
  So that I can get rid of projects that I no longer need
  I want to delete projects

  Scenario: A project
    Given I am logged in
    And I have a project
    When I delete that project
    Then I should have no projects