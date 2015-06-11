Feature: Delete Link From Media List
  So that I can clear my backlog of web articles I've read
  I want to delete links from the list

  Scenario: A link
    Given I am logged in
    And I have a link
    When I delete that link from my media list
    Then I should have no links