Feature: List Visions
  So that I know what I envision my best self being and can use that best self to identify what goals I should set
  I want to be able to see my vision for myself in each life area.

  Scenario: No visions specified
    Given I am logged in
    When I view my visions
    Then I should see all the life areas

  Scenario: Heart vision specified
    Given I am logged in
    And I have this vision
      | life_area | identity        | vision                                                                           | purpose                       |
      | heart     | I embrace life. | I am close to the impossible, the grand, the ever-shifting potential of humanity | so I constantly renew my wonder, hope and awe. |
    When I view my visions
    Then I should see the 'heart' vision