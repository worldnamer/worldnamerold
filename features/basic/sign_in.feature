Feature: Sign In
  In order to keep my data private
  I want to log in to the website

  @javascript
  Scenario: Good user
    Given a user
    When I log in
    Then I should be logged in

  @javascript
  Scenario: Bad user
    Given a user
    When I fail to log in
    Then I should not be logged in