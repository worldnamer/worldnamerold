Feature: Create Section
  So that I can customize what kinds of things to add to a project and exclude irrelevant sections
  I want to create sections in my projects to house the different kinds of elements it contains

  Scenario: Empty project
    Given I am logged in
    And I have a project
    When I create a section in that project
    Then I should have that section