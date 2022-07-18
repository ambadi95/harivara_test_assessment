@regression @howToLinkACard
Feature: How to link a Card screen
  As a CrayonPayment customer
  I want to navigate to Add a card/car list landing page
  So that I can - View list of cards added/linked to my wallet - Add/link my card to wallet

  @manual @NFS-775
  Scenario: TC_01: New/First time customer on How to link a card page
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    And I have an option to add funds on account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to my card landing page
    And I should not see any added cards in my cards list
    When I select the add a card tile
    Then I should be navigated to How to link a card page
    And I should see the how to description with static text and image
    And I should see the continue button below the how to description
    When I go back from the how to link a card screen
    Then I should be navigated to my card landing page

  @manual @android @NFS-775
  Scenario: TC_02: New/First time customer on How to link a card page - Android only - Device back button
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    And I have an option to add funds on account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to my card landing page
    And I should not see any added cards in my cards list
    When I select the add a card tile
    Then I should be navigated to How to link a card page
    And I should see the how to description with static text and image
    And I should see the continue button below the how to description
    When I click device back button
    Then I should be navigated to my card landing page

  @manual @NFS-775
  Scenario: TC_03: Exception scenario - How to link card page is visible even if they have not added and logged in multiple times
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    And I have an option to add funds on account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to my card landing page
    And I should not see any added cards in my cards list
    When I select the add a card tile
    Then I should be navigated to How to link a card page
    And I should see the how to description with static text and image
    And I should see the continue button below the how to description
    When I relaunch the app
    Then I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    And I select the add funds link on the account overview page
    And I select the add a card tile
    Then I should be navigated to How to link a card page
    And I should see the how to description with static text and image
    And I should see the continue button below the how to description

  @manual @NFS-775
  Scenario: TC_04: Exception scenario - How to link card page is not visible if user has added a card already
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    And I have an option to add funds on account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to my card landing page
    And I should see any added cards in my cards list
    When I click on add new card link
    And I select continue button on the add card overlay
    Then I should not be navigated to How to link a card page
    And I should not see the how to description with static text and image

  @NFS-775
  Scenario: TC_05: Exception scenario - How to link card page is not visible if user has added a card already - Manage Cards
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I click on my account
    And I click on manage cards
    And I should see any added cards in my cards list
    When I click on add new card link
    And I select continue button on the add card overlay
#    todo investigate the below step
#    Then I should not be navigated to How to link a card page
#    And I should not see the how to description with static text and image
    And I should be navigated to scan your card details page
