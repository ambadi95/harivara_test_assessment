@regression @addFunds
Feature: Add Funds journey
  As a CrayonPayment Pay customer app user,
  I want to add money to the wallet

  @NFS-1054 @NFS-534 @NFS-608
  @NFS-T81 @NFS-T116
  Scenario: When user add funds they are redirected to wait screen when backend action is taking place
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I enter 500 SAR into the amount field
    And I add the funds
    And I click on Add Funds Btn in Confirm Screen
    Then I should see success message screen

  @manual
  @NFS-931 @NFS-932
  @NFS-108 @NFS-T84
  Scenario: When transaction fails display error message and card is not linked into the wallet
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user_9 user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    When I select the add a card tile
    When I continue from the how to link a card screen
    When I select to enter my card details manually
    And I enter all the card details
      | nickName  | cardNumber       | expiryDate | cvv | preferredCard |
      | myDefault | 4826952611708872 | 01/23      | 123 | false         |
    When I continue to add the card with the filled in details
    And I enter 500 SAR into the amount field
    And I add the funds
    And I click on Add Funds on CVV Page
    Then I see transaction unsuccessful error
    Then I should be navigated to the add funds page

  @manual
  @NFS-931 @NFS-608
  @NFS-T107 @NFS-T127
  Scenario: success message for amount added and card linked into the wallet
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    When I select the add a card tile
    When I continue from the how to link a card screen
    When I select to enter my card details manually
    And I enter all the card details
      | nickName  | cardNumber       | expiryDate | cvv | preferredCard |
      | myDefault | 4826952611708872 | 01/23      | 123 | false         |
    When I continue to add the card with the filled in details
    And I enter 500 SAR into the amount field
    And I add the funds
    And I click on Add Funds on CVV Page
    Then I should see success message screen
    Then I should be navigated to the add funds page

  @NFS-931
  @NFS-T104 @manual
  Scenario: A existing user with no linked cards clicks on “add funds” link on dashboard
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    Then I should see the add a card tile

  @manual
  @NFS-931
  @NFS-T105
  Scenario: Post capturing card details -user is redirected to “ADD AMOUNT” screen
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    When I select the add a card tile
    When I continue from the how to link a card screen
    When I select to enter my card details manually
    And I enter all the card details
      | nickName  | cardNumber       | expiryDate | cvv | preferredCard |
      | myDefault | 4826952611708872 | 01/23      | 123 | false         |
    When I continue to add the card with the filled in details
    And I enter 500 SAR into the amount field
    Then I should see select card model with default card

  @NFS-1028
  @NFS-T766
  Scenario: An existing user with linked cards doesn't input amount and selects add new card
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I click on default card
    And I proceed to add a new card
    When I select to enter my card details manually
    And I enter all the card details
      | nickName  | cardNumber       | expiryDate | cvv | preferredCard |
      | myDefault | 4826952611708872 | 01/23      | 123 | false         |
    When I continue to add the card with the filled in details
    And I enter 500 SAR into the amount field
#    Then I should see select card model with default card
#    TODO need to verify the card that is added present in addfund screen

  @NFS-1028
  @NFS-T767
  Scenario: An existing user with linked cards where user inputs amount and selects add new card
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I enter 50 SAR into the amount field
    And I click on default card
    And I proceed to add a new card
    When I select to enter my card details manually
    And I enter all the card details
      | nickName  | cardNumber       | expiryDate | cvv | preferredCard |
      | myDefault | 4826952611708872 | 01/23      | 123 | false         |
    When I continue to add the card with the filled in details
#    TODO amount entered before adding card should be shown after the card is added
    And I enter 20 SAR into the amount field
#    Then I should see select card model with default card
    #    TODO need to verify the card that is added present in addfund screen

  @NFS-1028 @NFS-608
  @NFS-T768 @NFS-T126
  Scenario: Display of transaction success message for amount added and card linked into the wallet
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I click on default card
    And I proceed to add a new card
    When I select to enter my card details manually
    And I enter all the card details
      | nickName  | cardNumber       | expiryDate | cvv | preferredCard |
      | myDefault | 4826952611708872 | 01/23      | 123 | false         |
    When I continue to add the card with the filled in details
    And I enter 500 SAR into the amount field
    And I add the funds
    And I click on Add Funds Btn in Confirm Screen
    Then I should see success message screen
    Then I should be navigated to the add funds page

  @NFS-1028
  @NFS-T769 @manual
  Scenario: when transaction fails display error message and card is not linked into the wallet
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user_8 user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I click on default card
    And I proceed to add a new card
    When I select to enter my card details manually
    And I enter all the card details
      | nickName  | cardNumber       | expiryDate | cvv | preferredCard |
      | myDefault | 4826952611708872 | 01/23      | 123 | false         |
    When I continue to add the card with the filled in details
    And I enter 500 SAR into the amount field
    And I add the funds
    And I click on Add Funds on CVV Page
    Then I see transaction unsuccessful error
    Then I should be navigated to the add funds page

  @NFS-534
  @NFS-T123
  Scenario: Existing user with linked cards and adding funds by adding a new card
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I click on default card
    And I proceed to add a new card
    When I select to enter my card details manually
    And I enter all the card details
      | nickName  | cardNumber       | expiryDate | cvv | preferredCard |
      | myDefault | 4826952611708872 | 01/23      | 123 | false         |
    When I continue to add the card with the filled in details
    And I enter 500 SAR into the amount field
    And I add the funds
    And I click on Add Funds Btn in Confirm Screen

  @manual
  @NFS-534
  @NFS-T122 @NFS-T121 @manual
  Scenario: New user with linked cards and adding funds by adding a new card
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user_1 user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    When I select the add a card tile
    When I continue from the how to link a card screen
    When I select to enter my card details manually
    And I enter all the card details
      | nickName  | cardNumber       | expiryDate | cvv | preferredCard |
      | myDefault | 4826952611708872 | 01/23      | 123 | false         |
    When I continue to add the card with the filled in details
    And I enter 500 SAR into the amount field
    And I add the funds
    And I click on Add Funds Btn in Confirm Screen
