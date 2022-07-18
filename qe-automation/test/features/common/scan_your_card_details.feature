@regression @scanYourCardDetails
Feature: Scan your card details screen
  As a CrayonPayment customer/Merchant
  I want to navigate to Add a card/car list landing page
  So that I can - View list of cards added/linked to my wallet - Add/link my card to wallet

  @manual @NFS-775
  Scenario: TC_01: New/First time customer navigating to Scan your card details page
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    And I have an option to add funds on account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to my card landing page
    And I should not see any added cards in my cards list
    When I select the add a card tile
    Then I should be navigated to How to link a card page
    When I continue from the how to link a card screen
    Then I should be navigated to scan your card details page
    And I should see enter card details manually link
    When I go back from the scan card details screen
    Then I should be navigated to How to link a card page

  @manual @android @NFS-775
  Scenario: TC_02: New/First time customer navigating to Scan your card details page - Android only - Device back button
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    And I have an option to add funds on account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to my card landing page
    And I should not see any added cards in my cards list
    When I select the add a card tile
    Then I should be navigated to How to link a card page
    When I continue from the how to link a card screen
    Then I should be navigated to scan your card details page
    And I should see enter card details manually link
    When I click device back button
    Then I should be navigated to How to link a card page

  @NFS-775 @NFS-782
  Scenario: TC_03: Existing customer navigating to Scan your card details page when at least 1 card already added
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on my account
    And I click on manage cards
    And I should see any added cards in my cards list
    And I click on add new card link
    Then I select continue button on the add card overlay
    And I should be navigated to scan your card details page
    And I should see enter card details manually link
    When I go back from the scan card details screen
    And I should see my cards page

  @android
  @NFS-775 @NFS-782
  Scenario: TC_04: Existing customer navigating to Scan your card details page when at least 1 card already added - Android only - Device back button
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on my account
    And I click on manage cards
    And I should see any added cards in my cards list
    And I click on add new card link
    Then I select continue button on the add card overlay
    And I should be navigated to scan your card details page
    And I should see enter card details manually link
    When I click device back button
    And I should see my cards page
