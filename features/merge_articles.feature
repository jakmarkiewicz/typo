Feature: Merge Articles
  As an admin
  In order to better manage articles
  I want to merge articles together

  Background:
    Given the blog is set up
    And the following articles exist:
    | title      | author   | body                            | published    | 
    | Post no.1  | bloguser | Sample text in the first post.  | true         | 
    And the following users exist:
    | login     | password    | email             | name  | profile_id |
    | blogadmin | blogadminpw | admin@example.com | Admin | 1          |
    | bloguser  | bloguserpw  | user@example.com  | User  | 2          |
    
  Scenario: An admin can merge articles
    Given I am logged into the admin panel as "blogadmin"
    When I visit the edit page for "Post no.1"
    Then I should see "Merge Articles"
    
  Scenario: A non-admin cannot merge articles
    Given I am logged into the admin panel as "bloguser"
    When I visit the edit page for "Post no.1"
    Then I should not see "Merge Articles"

  Scenario: Merged article should contain the text of both old articles
    Given I am logged into the admin panel as "blogadmin"
    When I visit the edit page for "Post no.1"
    And I fill in "merge_with" with "1"
    And I press "Merge"
    Then I should be on the admin content page
    When I follow "Post no.1"
    Then I should see "Sample text in the first post.Welcome to Typo. This is your first article. Edit or delete it, then start blogging!"
    
  Scenario: Merged article should have 1 author
    Given I am logged into the admin panel as "blogadmin"
    When I visit the edit page for "Post no.1"
    And I fill in "merge_with" with "1"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "bloguser"

  Scenario: The title of the new article should be either one of merged articles 
    Given I am logged into the admin panel as "blogadmin"
    When I visit the edit page for "Post no.1"
    And I fill in "merge_with" with "1"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Post no.1"

  Scenario: Original comments should all carry over to the new article



  #Scenario: Create blog page not shown when blog created
  #  Given the blog is set up
  #  When I am on the home page
  #  Then I should not see "My Shiny Weblog!"
  #  And I should see "Teh Blag"