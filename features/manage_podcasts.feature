@podcasts
Feature: Podcasts
  In order to have podcasts on my website
  As an administrator
  I want to manage podcasts

  Background:
    Given I am a logged in refinery user
    And I have no podcasts

  @podcasts-list @list
  Scenario: Podcasts List
   Given I have podcasts titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of podcasts
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @podcasts-valid @valid
  Scenario: Create Valid Podcast
    When I go to the list of podcasts
    And I follow "Add New Podcast"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 podcast

  @podcasts-invalid @invalid
  Scenario: Create Invalid Podcast (without title)
    When I go to the list of podcasts
    And I follow "Add New Podcast"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 podcasts

  @podcasts-edit @edit
  Scenario: Edit Existing Podcast
    Given I have podcasts titled "A title"
    When I go to the list of podcasts
    And I follow "Edit this podcast" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of podcasts
    And I should not see "A title"

  @podcasts-duplicate @duplicate
  Scenario: Create Duplicate Podcast
    Given I only have podcasts titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of podcasts
    And I follow "Add New Podcast"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 podcasts

  @podcasts-delete @delete
  Scenario: Delete Podcast
    Given I only have podcasts titled UniqueTitleOne
    When I go to the list of podcasts
    And I follow "Remove this podcast forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 podcasts
 