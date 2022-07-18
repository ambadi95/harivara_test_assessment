@regression @p2p_journey @customer @Test
Feature: P2P Journey - Customer only
  As a customer or merchant
  I want to see Transaction history link on the dashboard
  so that I must be able to see all wallet transaction history.

  @NFS-1835
  @NFS-T1937
  Scenario: Verify default send money - select recipient view
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    And I can see my account overview page
    Then I should see send money option on the screen

  @NFS-1835
  @NFS-T1938
  Scenario: A CrayonPayment pay user clicks on “Send Money” option on the homepage and allow the access
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    And I can see my account overview page
    And I should see send money option on the screen
    And I click on p2p link
    Then I must be landed to Send Money-Select Recipient screen
    And I click on back button in contacts screen
    And I can see my account overview page

  @NFS-1835
  @NFS-T1938 @android
  Scenario: A CrayonPayment pay user clicks on “Send Money” option on the homepage and allow the access
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    And I can see my account overview page
    And I should see send money option on the screen
    And I click on p2p link
    Then I must be landed to Send Money-Select Recipient screen
    And I click device back button
    And I can see my account overview page

  @NFS-1836
  @NFS-T2176
  Scenario: Verify search contact - if contact available
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    And I can see my account overview page
    And I should see send money option on the screen
    And I click on p2p link
    Then I must be landed to Send Money-Select Recipient screen
    And I should see the below fields on transfer to screen
      | contacts_tab     |
      | mobileNumber_Tab |
      | Search_bar       |
      | contact_list     |
    And I enter Saumya in the search box field
    Then I should see the searched result

  @NFS-1836
  @NFS-T2177
  Scenario: Verify search contact - if contact not available
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    And I can see my account overview page
    And I should see send money option on the screen
    And I click on p2p link
    Then I must be landed to Send Money-Select Recipient screen
    And I should see the below fields on transfer to screen
      | contacts_tab     |
      | mobileNumber_Tab |
      | Search_bar       |
      | contact_list     |
    And I enter Ze in the search box field
    Then I should see the message for no contacts

  @NFS-1836
  @NFS-T2178
  Scenario: Verify search mobile number -if available
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    And I can see my account overview page
    And I should see send money option on the screen
    And I click on p2p link
    And I must be landed to Send Money-Select Recipient screen
    And I should see the below fields on transfer to screen
      | contacts_tab     |
      | mobileNumber_Tab |
      | Search_bar       |
      | contact_list     |
    And I click mobile number tab
    And I enter 5874123 in the mobile search box field
    Then I should see the searched result

  @NFS-1836
  @NFS-T2202
  Scenario: Verify entering new mobile number if user is not in a contact list
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    And I can see my account overview page
    And I should see send money option on the screen
    And I click on p2p link
    And I must be landed to Send Money-Select Recipient screen
    And I should see the below fields on transfer to screen
      | contacts_tab     |
      | mobileNumber_Tab |
      | Search_bar       |
      | contact_list     |
    And I click mobile number tab
    And I enter 7895645 in the mobile search box field
    Then I should redirected to send money screen

  @NFS-1837
  @NFS-T2179
  Scenario: Verify Send money default screen view
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on p2p link
    And I must be landed to Send Money-Select Recipient screen
    And I select the contact
    Then I should redirected to send money screen
    And I should see the below fields on send money
      | amount_field   |
      | remark         |
      | wallet_balance |
      | contact_number |
      | contact_name   |

  @NFS-1837
  @NFS-T2201
  Scenario: Enter valid amount in decimal point and pay
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on p2p link
    And I must be landed to Send Money-Select Recipient screen
    And I select the contact
    Then I should redirected to send money screen
    And I should see the below fields on send money
      | amount_field   |
      | remark         |
      | wallet_balance |
      | contact_number |
      | contact_name   |
    And I enter 4.12 SAR to pay
    And I enter the remark
    And I should see send money button
    Then I should be able to make payment

  @NFS-1837
  @NFS-T2180
  Scenario: Validate error message after entering the  amount less than the one
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on p2p link
    And I must be landed to Send Money-Select Recipient screen
    And I select the contact
    Then I should redirected to send money screen
    And I should see the below fields on send money
      | amount_field   |
      | remark         |
      | wallet_balance |
      | contact_number |
      | contact_name   |
    And I enter .5 SAR to pay
    Then I should see error message for less amount

  @NFS-1837
  @NFS-T2181 @manual
  Scenario: Validate error message after entering amount more available balance
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on p2p link
    And I must be landed to Send Money-Select Recipient screen
    And I select the contact
    Then I should redirected to send money screen
    And I should see the below fields on send money
      | amount_field   |
      | remark         |
      | wallet_balance |
      | contact_number |
      | contact_name   |
    And I enter 1000 SAR to pay
    Then I should see error message for insufficient funds

  @manual
  @NFS-2077
  @NFS-T2186
  Scenario: Verify entering valid passcode for payment
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on p2p link
    And I must be landed to Send Money-Select Recipient screen
    And I select the contact
    And I should redirected to send money screen
    And I enter 4 SAR to pay
    And I enter the remark
    And I should see send money button
    Then I should be able to make payment
    And I should see the below fields on payment authorization screen
      | heading              |
      | amount_tosend        |
      | passcode_field       |
      | icon                 |
      | forgot_passcode_link |
    And I enter 258741 in passcode field
    Then I should redirected to payment confirmation screen

  @NFS-2077
  @NFS-T2187
  Scenario: Verify entering invalid passcode- first attempt
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on p2p link
    And I must be landed to Send Money-Select Recipient screen
    And I select the contact
    And I should redirected to send money screen
    And I enter 4 SAR to pay
    And I enter the remark
    And I should be able to make payment
    And I should see the below fields on payment authorization screen
      | heading              |
      | amount_tosend        |
      | passcode_field       |
      | icon                 |
      | forgot_passcode_link |
    And I enter 123456 in passcode field
    Then I should see the error message

  @manual
  @NFS-2077
  @NFS-T2188
  Scenario: Verify entering invalid passcode- second & third attempt
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on p2p link
    And I must be landed to Send Money-Select Recipient screen
    And I select the contact
    And I should redirected to send money screen
    And I enter 4 SAR to pay
    And I enter the remark
    And I should be able to make payment
    And I should see the below fields on payment authorization screen
      | heading              |
      | amount_tosend        |
      | passcode_field       |
      | icon                 |
      | forgot_passcode_link |
    And I enter 123456 in passcode field
    Then I should see the error message
    And I enter 123456 in passcode field
    Then I should see forgot password popup on the screen
    And I click enter passcode button
    And I enter 123456 in passcode field
    Then I should see account locked popup on the screen
    And I click on ok button

  @NFS-2038
  @NFS-T2182
  Scenario: Verify payment confirmation screen default view
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on p2p link
    And I select the contact
    And I enter 4 SAR to pay
    And I enter the remark
    And I should be able to make payment
    And I enter 258741 in passcode field
    Then I should redirected to payment confirmation screen
    And I should see below fields on corfirmation screen
      | amount                       |
      | date_time                    |
      | note                         |
      | reference                    |
      | share_button                 |
      | download_button              |
      | makeAnother_transafer_button |

  @NFS-2038
  @NFS-T2203 @ios
  Scenario: Verify share and download button
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on p2p link
    And I select the contact
    And I enter 4 SAR to pay
    And I should be able to make payment
    And I enter 258741 in passcode field
    Then I should redirected to payment confirmation screen
#    Need to add a step to verify that download button is not visible for IOS
#    And I click download button
    And I click share button

  @NFS-2038
  @NFS-T2203 @android
  Scenario: Verify share and download button
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on p2p link
    And I select the contact
    And I enter 4 SAR to pay
    And I should be able to make payment
    And I enter 258741 in passcode field
    Then I should redirected to payment confirmation screen
    And I click download button
    And I click share button

  @NFS-2038
  @NFS-T2204
  Scenario: Verify on clicking make another transfer button redirected to homepage
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on p2p link
    And I select the contact
    And I enter 4 SAR to pay
    And I should be able to make payment
    And I enter 258741 in passcode field
    Then I should redirected to payment confirmation screen
    And I click make another transfer button
    Then I must be landed to Send Money-Select Recipient screen
