Feature: Add Media To List
  So that I can keep a backlog of stuff to watch or read
  I want to record media in a list that I can review when appropriate

  Scenario: No media
    Given I am logged in
    When I add a link to the media list
    Then I should have that link in my media list