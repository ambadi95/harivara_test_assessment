@e2e
Feature: E2E journey - Customer only.
  As a CrayonPayment customer
  I want to navigate to Add a card/car list landing page
  So that I can - View list of cards added/linked to my wallet - Add/link my card to wallet

  @NFS-545 @NFS-546 @NFS-3266 @manual
  Scenario Outline: Login with New Customer then add funds by adding <type> card and verify transaction details
    Given I am on the login page
    When I login with the CrayonPayment_no_inked_card_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to the add funds page
    When I proceed to select the card
    And I proceed to add a new card
    Then I should be navigated to scan your card details page
    When I select to enter my card details manually
    Then I should be navigated to card details page
    And I enter all the card details
      | nickName   | cardNumber   | expiryDate   | cvv   | preferredCard   |
      | <nickName> | <cardNumber> | <expiryDate> | <cvv> | <preferredCard> |
    When I continue to add the card with the filled in details
    Then I should be navigated to the add funds page
    When I enter 1 SAR into the amount field
    And I add the funds
    And I click on Add Funds Btn in Confirm Screen
    Then I should see success message screen
    Then I click on View Transaction history option
    And I click on particular transaction
    Then I must see main section
    #todo need to add a step to verify transaction details

    @non3ds
    Examples:
      | nickName   | cardNumber       | expiryDate | cvv | preferredCard | type   |
      | nonThreeDS | 4539360659413827 | 01/23      | 100 | false         | non3ds |

    @3ds
    Examples:
      | nickName | cardNumber       | expiryDate | cvv | preferredCard | type |
      | ThreeDS  | 4485040371536584 | 01/23      | 100 | false         | 3ds  |

  @NFS-3266
  Scenario Outline: Login with existing customer then add funds by selecting <type> card and verify transaction details
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to the add funds page
   #todo need to add a step to change the card type
    When I enter 1 SAR into the amount field
    And I add the funds
    And I click on Add Funds Btn in Confirm Screen
    Then I should see success message screen
    Then I click on View Transaction history option
    And I click on particular transaction
    Then I must see main section
    #todo need to add a step to verify transaction details

    @non3ds
    Examples:
      | nickName   | type   |
      | nonThreeDS | non3ds |

    @3ds @manual
    Examples:
      | nickName | type |
      | ThreeDS  | 3ds  |

  @NFS-3266
  Scenario Outline: Login with existing customer then add funds by adding <type> card and verify transaction details
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    When I select the add funds link on the account overview page
    Then I should be navigated to the add funds page
    When I proceed to select the card
    And I proceed to add a new card
    Then I should be navigated to scan your card details page
    When I select to enter my card details manually
    Then I should be navigated to card details page
    And I enter all the card details
      | nickName   | cardNumber   | expiryDate   | cvv   | preferredCard   |
      | <nickName> | <cardNumber> | <expiryDate> | <cvv> | <preferredCard> |
    When I continue to add the card with the filled in details
    Then I should be navigated to the add funds page
    When I enter 1 SAR into the amount field
    And I add the funds
    And I click on Add Funds Btn in Confirm Screen
    Then I should see success message screen
    Then I click on View Transaction history option
    And I click on particular transaction
    Then I must see main section
    #todo need to add a step to verify transaction details

    @non3ds
    Examples:
      | nickName   | cardNumber       | expiryDate | cvv | preferredCard | type   |
      | nonThreeDS | 4539360659413827 | 01/23      | 100 | false         | non3ds |

    @3ds @manual
    Examples:
      | nickName | cardNumber       | expiryDate | cvv | preferredCard | type |
      | ThreeDS  | 4485040371536584 | 01/23      | 100 | false         | 3ds  |

  @NFS-782 @NFS-545 @NFS-546
  Scenario: TC_02: Customer is able to add a card via manage cards
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on my account
    And I click on manage cards
    And I should see any added cards in my cards list
    And I click on add new card link
    And I select continue button on the add card overlay
    And I should be navigated to scan your card details page
    When I select to enter my card details manually
    Then I should be navigated to card details page
    And I enter all the card details
      | nickName  | cardNumber       | expiryDate | cvv | preferredCard |
      | myDefault | 4826952611708872 | 01/23      | 123 | false         |
    And I continue to add the card with the filled in details
    And I should see card added modal

  @NFS-3266
  Scenario: Login with existing user and make p2p payment and verify transaction details
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on p2p link
    And I select the contact
    And I enter 1 SAR to pay
    And I should be able to make payment
    And I enter 258741 in passcode field
    Then I should redirected to payment confirmation screen
    And I click make another transfer button
    Then I must be landed to Send Money-Select Recipient screen
    And I click on back button in contacts screen
    Then I click on View Transaction history option
    And I click on particular transaction
    Then I must see main section
    #todo need to add a step to verify transaction details
