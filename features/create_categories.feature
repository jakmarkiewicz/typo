Feature: Create and edit categories
  As an admin
  In order to better manage articles
  I want to create and edit article's categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And I follow "Categories"
    
  Scenario: I can create new categories
    When I fill in "Name" with "Test_Category"
    And I fill in "Description" with "Test_Description"
    And I press "Save"
    Then I should see "Test_Category"
    And show me the page

  Scenario: I can edit current categories
    When I follow "General"
    And I fill in "Name" with "Test_Category"
    And I press "Save"
    Then I should see "Test_Category"
