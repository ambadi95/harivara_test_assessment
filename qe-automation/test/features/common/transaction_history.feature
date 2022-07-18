@regression @transactionHistory
Feature: Transaction History
  As a customer or merchant
  I want to see Transaction history link on the dashboard
  so that I must be able to see all wallet transaction history.

  @NFS-447
  @NFS-T113 @NFS-T114
  Scenario: Verify View Transaction History link on the homepage
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    Then I should see the View Transaction History option
    And I click on View Transaction history option
    And I must be redirected to Transaction History Result screen
    And I click on back button in transaction history page
    And I can see my account overview page

  @NFS-447
  @NFS-T113 @NFS-T114 @android
  Scenario: Verify View Transaction History link on the homepage
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    Then I should see the View Transaction History option
    And I click on View Transaction history option
    And I must be redirected to Transaction History Result screen
    And I click device back button
    And I can see my account overview page

  @NFS-448 @NFS-340
  @NFS-T154 @NFS-T156
  Scenario: Verify default transaction screen view
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on View Transaction history option
    And I must be redirected to Transaction History Result screen
    And I must be able to see below fields
      | TransactionType_All |
      | TransactionType_OUT |
      | TransactionType_IN  |
      | Duration_Filter     |
      | Search bar          |

  @manual
  @NFS-448 @NFS-340
  @NFS-T155 @NFS-T157
  Scenario: Verify empty transaction screen
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    And I click on View Transaction history option
    And I must be redirected to Transaction History Result screen
    And I must see no transaction details available message

  @NFS-613 @NFS-380
  @NFS-T762 @NFS-T764 @NFS-T763 @NFS-T765 @ios
  Scenario: Verify transaction detail screen with expand option
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on View Transaction history option
    And I click on particular transaction
    Then I must see main section
    And I click to expand the section
#    Need to add step to verify that download button is present in IOS
#    And I must see download jpg option
    And I click on download jpg option

  @NFS-613 @NFS-380
  @NFS-T762 @NFS-T764 @NFS-T763 @NFS-T765 @android
  Scenario: Verify transaction detail screen with expand option
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on View Transaction history option
    And I click on particular transaction
    Then I must see main section
    And I click to expand the section
    And I must see download jpg option
    And I click on download jpg option

  @NFS-2621
  @NFS-T1922 @ios
  Scenario: User should see download option a transaction detail screen
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on View Transaction history option
    And I must be redirected to Transaction History Result screen
    And I click on particular transaction
    And I should see transaction detail screen
   # Need to add step to verify that download button is present in IOS
#    And I must see download jpg option
    And I click on download jpg option
    Then I should see the success popup on the screen

  @NFS-2621
  @NFS-T1922 @android
  Scenario: User should see download option a transaction detail screen
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on View Transaction history option
    And I must be redirected to Transaction History Result screen
    And I click on particular transaction
    And I should see transaction detail screen
    And I must see download jpg option
    And I click on download jpg option
    Then I should see the success popup on the screen

  @NFS-2621
  @NFS-T1923
  Scenario: User must be able to see share option of an transaction detail screen
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on View Transaction history option
    And I must be redirected to Transaction History Result screen
    And I click on particular transaction
    And I should see transaction detail screen
    And I must see share option on the screen
    Then I should be able to share transaction detail

  @pending
  @NFS-1542 @NFS-T1923
  Scenario: Verify Refund Transaction on Transaction History Screen
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on View Transaction history option.
    And I must be redirected to Transaction History Result screen
    And I scroll the transactions screen
    Then I must see Refund transaction on the screen

  @pending
  @NFS-1542 @NFS-T813
  Scenario: Verify detailed refund transaction view
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on View Transaction history option.
    And I must be redirected to Transaction History Result screen
    And I scroll the screen to see refund transaction
    And I click on Refund transaction
    And I should redirected to transaction history screen
    And I should see the below transaction fields on the screen
      | Merchant_name  |
      | Total_amount   |
      | Transaction_ID |
      | order_ID       |
      | date           |
      | time           |
      | category       |
      | purchase       |
      | status         |
      | payment_method |
      | start_ballance |
      | end_ballance   |
      | notes          |
    And I scroll the page to see refund details
    And I should see below refund section field
    And I click on refund ID hyperlink
    Then I should see transaction detail screen

  @pending
  @NFS-1542 @NFS-T1916
  Scenario: Verify purchase transaction detail screen
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on View Transaction history option.
    And I must be redirected to Transaction History Result screen
    And I scroll the screen to see refund transaction
    And I click on Refund transaction
    And I should redirected to transaction history screen
    And I should see the below transaction fields on the screen
      | Merchant_name  |
      | Total_amount   |
      | Transaction_ID |
      | order_ID       |
      | date           |
      | time           |
      | category       |
      | purchase       |
      | status         |
      | payment_method |
      | start_ballance |
      | end_ballance   |
      | notes          |
    And I scroll the page to see refund details
    And I should see below refund section field
    And I click on refund ID hyperlink
    Then I should see transaction detail screen
