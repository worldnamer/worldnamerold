Feature: Splash Page
  In order to make a good impression
  I want a splash page for the website

  Scenario: Unauthenticated
    Given I am not logged in
    When I view the home page
    Then I should see the splash page