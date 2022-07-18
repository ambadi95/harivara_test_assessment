@regression @myCards
Feature: My Cards screen
  As a CrayonPayment customer
  I want to navigate to Add a card/car list landing page
  So that I can - View list of cards added/linked to my wallet - Add/link my card to wallet

  @manual @NFS-768
  Scenario: TC_01: New/First time customer on Add a card landing page
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    And I have an option to add funds on account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to my card landing page
    And I should see the add a card tile
    And I should not see any added cards in my cards list
    When I select back button on the top
    Then I can see my account overview page

  @manual @android @NFS-768
  Scenario: TC_02: New/First time customer on Add a card landing page - Android only - Device back button
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    And I have an option to add funds on account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to my card landing page
    And I should see the add a card tile
    And I should not see any added cards in my cards list
    When I click device back button
    Then I can see my account overview page

  @NFS-768 @NFS-782 @NFS-445
  @NFS-1917
  Scenario: TC_03: Existing customer on Add a card landing page
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on my account
    And I click on manage cards
    And I should see any added cards in my cards list
    And I should see below details for added cards
      | cardName                  |
      | cardNumber                |
      | expiryDate                |
      | preferredCard_heading     |
      | greenTick_onPreferredCard |
      | changeNickName_link       |
      | DeleteCard_link           |
      | Transaction_placeholder   |
    And I should not see toggle button on the screen
    When I select back button on the my card page
    And I should see manage account page

  @android @NFS-768 @NFS-782
  Scenario: TC_04: Existing customer on Add a card landing page - Android only - Device back button
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on my account
    And I click on manage cards
    And I should see any added cards in my cards list
    And I should see below details for added cards
      | cardName   |
      | cardNumber |
      | expiryDate |
    When I click on add new card link
    Then I should see the add card information overlay
    When I select cancel button on the add card overlay
    Then I should see my cards page
    When I click device back button
    And I should see manage account page

  @pending @NFS-768
  Scenario: TC_05: Existing or New customer - Add a card landing page (API is down and none/some of the information are retrieved from the API)
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on my account
    And I click on manage cards
    Then I should be navigated to an error page
    And I should see the error message on the page

  @NFS-443 @NFS-782 @NFS-545 @NFS-546
  Scenario: TC_06: Should be able to view my list of linked cards
    Given I am on the login page
    And I login with the CrayonPayment_linked_cards_user user
    And I can see my account overview page
    And I click on my account
    And I click on manage cards
    Then I should see any added cards in my cards list
    And I should see below details for added cards
      | cardName   |
      | cardNumber |
      | expiryDate |
    When I click on add new card link
    Then I select continue button on the add card overlay
    Then I should be navigated to scan your card details page
    When I select to enter my card details manually
    Then I should be navigated to card details page
    And I should see below fields required for card details
      | nickname            |
      | cardNumber          |
      | expiryDate          |
      | cvv                 |
      | preferredCardSwitch |

  @NFS-782 @NFS-545 @NFS-546 @manual
  Scenario: TC_07: Updated card list page with success message overlay if the card is selected as a preferred card
    Given I am on the login page
    And I login with the CrayonPayment_linked_cards_user user
    And I can see my account overview page
    And I click on my account
    And I click on manage cards
    Then I should see any added cards in my cards list
    When I click on add new card link
    Then I select continue button on the add card overlay
    Then I should be navigated to scan your card details page
    When I select to enter my card details manually
    Then I should be navigated to card details page
    When I enter all the card details
      | nickName | cardNumber       | expiryDate | cvv | preferredCard |
      | newCard  | 5436031030606378 | 01/23      | 257 | false         |
    And I continue to add the card with the filled in details
    Then I should see card added modal
    When I close the add card modal
    Then I should see my cards page
    And I should see the below card as the default card in my cards list
      | nickName  | cardNumber       | preferredCard |
      | secondary | 5436031030606378 | true          |

  @NFS-782 @NFS-545 @NFS-546 @manual
  Scenario: TC_08: Updated card list page with success message overlay if the card is not selected as a preferred card
    Given I am on the login page
    And I login with the CrayonPayment_linked_cards_user user
    And I can see my account overview page
    And I click on my account
    And I click on manage cards
    Then I should see any added cards in my cards list
    When I click on add new card link
    Then I select continue button on the add card overlay
    Then I should be navigated to scan your card details page
    When I select to enter my card details manually
    Then I should be navigated to card details page
    When I enter all the card details
      | nickName | cardNumber       | expiryDate | cvv | preferredCard |
      | newCard  | 5436031030606378 | 01/23      | 257 | false         |
    And I continue to add the card with the filled in details
    Then I should see card added modal
    When I close the add card modal
    Then I should see my cards page
    And I should not see the below card as the default card in my cards list
      | nickName | cardNumber       | preferredCard |
      | newCard  | 5436031030606378 | false         |

  @NFS-782 @NFS-545 @NFS-546 @manual
  Scenario: TC_09: Card details page with error message overlay
    Given I am on the login page
    And I login with the CrayonPayment_linked_cards_user user
    And I can see my account overview page
    And I click on my account
    And I click on manage cards
    Then I should see any added cards in my cards list
    When I click on add new card link
    Then I select continue button on the add card overlay
    Then I should be navigated to scan your card details page
    When I select to enter my card details manually
    Then I should be navigated to card details page
    When I enter all the card details
      | nickName | cardNumber       | expiryDate | cvv | preferredCard |
      | newCard  | 5436031030606378 | 01/23      | 257 | false         |
    And I continue to add the card with the filled in details
    Then I should see card not added error modal
    When I close the add card modal
    Then I should see my cards page
    And I should not see the below card as the default card in my cards list
      | nickName | cardNumber       | preferredCard |
      | newCard  | 5436031030606378 | false         |
