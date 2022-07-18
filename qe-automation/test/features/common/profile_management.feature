@regression @profile_management
Feature: Profile Management - Share IBAN
  As a customer or merchant
  I want to see profile management link on the dashboard
  so that I must be able to see all manage account details.

  @NFS-414 @NFS-T1873
  @NFS-418 @NFS-T1878
  Scenario: Existing user should be able to copy IBAN details
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I click on my account
    And I click on manage wallet
    Then I should see manage account screen
    And I should see below details on the screen
      | Bank_name   |
      | IBAN_number |
    And I can see copy detail button
    When I click on copy detail button
    Then I should see popup message for copied details

  @manual
  @NFS-414 @NFS-T1874
  @NFS-418 @NFS-T1879
  Scenario: New user should be able to copy IBAN details
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    When I click on my account
    And I click on manage wallet
    Then I should see manage account screen
    And I should see below details on the screen
      | Bank_name   |
      | IBAN_number |
    And I can see copy detail button
    When I click on copy detail button
    Then I should see popup message for copied details

  @NFS-413 @NFS-T1883
  @NFS-417 @NFS-T1887
  Scenario: Existing CrayonPayment user to view IBAN and bank name
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I click on my account
    And I click on manage wallet
    Then I must see following details on the screen
      | Wallet_accountHeading     |
      | Bank_name                 |
      | IBAN_number               |
      | CopyDetail_button         |
      | Account_limit_placeholder |

  @manual
  @NFS-413 @NFS-T1885
  @NFS-417 @NFS-T1889
  Scenario: New CrayonPayment user to view IBAN and bank name
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    When I click on my account
    And I click on manage wallet
    And I must see following details on the screen
      | Wallet_accountHeading     |
      | Bank_name                 |
      | IBAN_number               |
      | CopyDetail_button         |
      | Account_limit_placeholder |

  @manual
  @NFS-413 @NFS-T1884 @NFS-413 @NFS-T1886
  @NFS-417 @NFS-1888 @NFS-417 @NFS-1890
  Scenario: Existing user should see server side error
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user_7 user
    Then I can see my account overview page
    When I click on my account
    And I click on manage wallet
    Then I should see error page details
    And I click on ok button and redirected to homepage
    Then I can see my account overview page
