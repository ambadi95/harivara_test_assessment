@regression @addFunds
Feature: Add Funds Screen
  As a CrayonPayment Pay customer app user,
  I want to see “Add funds” option on homepage
  So that user can add money to the wallet

  @NFS-528 @NFS-529
  @NFS-T55 @NFS-T35
  Scenario: A user of CrayonPayment pay wallet having no linked or saved cards on the wallet
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to the add funds page
    And I click on back button in add funds page
    Then I can see my account overview page

  @NFS-528 @NFS-529
  @NFS-T55 @NFS-T35 @android
  Scenario: A user of CrayonPayment pay wallet having no linked or saved cards on the wallet
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to the add funds page
    And I click device back button
    Then I can see my account overview page

  @NFS-528 @NFS-529 @NFS-533 @NFS-532
  @NFS-T54 @NFS-T36 @NFS-T37 @NFS-T59 @NFS-60
  Scenario: An existing user on CrayonPayment pay wallet having linked or saved cards on the wallet
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I should be navigated to the add funds page
    And I click on default card
    And I should see select card model with default card

  @NFS-533 @NFS-532
  @NFS-T61 @NFS-62 @NFS-63 @NFS-66 @manual
  Scenario: Change default card from select card modal
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I click on default card
    Then I should see select card model
#    And I click on secondary card
#  todo change above step to select non default card

  @NFS-533 @NFS-532
  @NFS-760
  Scenario: Exit select source modal by clicking on close button
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I click on default card
    And I click on close icon on select card modal
    And I should be navigated to the add funds page

  @NFS-533 @NFS-532
  @NFS-760
  Scenario: Exit select source modal by clicking out of the window
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I click on default card
    And I should be navigated to the add funds page

  @NFS-530 @NFS-1168
  @NFS-T5
  Scenario: Verify required field on add funds screen and should be able add amount
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to the add funds page
    And I should see the below fields in the screen
      | amount field   |
      | card selection |
      | heading        |
    And I should see add fund button is disabled
    And I enter 500 SAR into the amount field
    And I add the funds
    And I click on back button in add funds confirm page
    And I should be navigated to the add funds page

  @NFS-530 @NFS-1168
  @NFS-T5 @android
  Scenario: Verify required field on add funds screen and should be able add amount
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to the add funds page
    And I should see the below fields in the screen
      | amount field   |
      | card selection |
      | heading        |
    And I should see add fund button is disabled
    And I enter 500 SAR into the amount field
    And I add the funds
    And I click device back button
    And I should be navigated to the add funds page

  @NFS-T6
  Scenario: Enter amount greater than the max limit
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I should be navigated to the add funds page
    And I enter 200001 SAR into the amount field
    Then I should see add fund button is disabled

  @NFS-T56
  Scenario: Verify user is not able proceed with amount less than 1 SAR.
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I should be navigated to the add funds page
    And I enter .1 SAR into the amount field
    Then I should see add fund button is disabled

  @NFS-958 @NFS-1828
  @NFS-T153
  Scenario: User should see current and remaining wallet balance
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    Then I should see below fields
      | amount_field      |
      | current_balance   |
      | Remaining_balance |

  @NFS-1828
  Scenario: Enter amount greater than the max limit
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I enter 251000 SAR into the amount field
    Then I should see error message on the screen

  @NFS-2821
  @NFS-T2192
  Scenario: Verify user is not able to add amount less than 1 in decimanl
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I should be navigated to the add funds page
    And I enter .09 SAR into the amount field
    And I should see add fund button is disabled

  @NFS-2821
  @NFS-T2193
  Scenario: Verify user is able to add amount less than the wallet limit in decimal point
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I should be navigated to the add funds page
    And I enter 500.56 SAR into the amount field
    Then I should see add fund button is disabled
    And I add the funds

  @NFS-2821
  @NFS-T2194
  Scenario: Verify user is able to add amount more than wallet limit in decimal point
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    And I should be navigated to the add funds page
    And I enter 20000.56 SAR into the amount field
    Then I should see error message on the screen
