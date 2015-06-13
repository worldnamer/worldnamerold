Feature: Export Data
  So that I can quickly get data from the web to my development environment
  I want to be able to export data from the site to a file I can download

  Scenario: Authentication
    Given I am not logged in
    When I export data
    Then I should get an error

  Scenario: Export
    Given I am logged in
    When I export data
    Then I should get a file