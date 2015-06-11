Feature: Add Link To Media List
  So that I can keep a backlog of web articles to read
  I want to record links in a list that I can review when appropriate

  Scenario: No links
    Given I am logged in
    When I add a link to the media list
    Then I should have that link in my media list