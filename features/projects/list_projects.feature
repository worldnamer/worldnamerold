Feature: List projects
  In order to select the project I want to work on
  I want to see a list of all my projcets

  Scenario: A project
    Given I am logged in
    And I have a project
    When I view my projects
    Then I should see my project in the list

  Scenario: Multiple users
    Given I am logged in
    And I have a project
    And another user has a project
    When I view my projects
    Then I should see one project in the list