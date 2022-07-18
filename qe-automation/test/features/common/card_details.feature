@regression @cardDetails
Feature: Card details screen
  As a CrayonPayment customer/Merchant
  I want to navigate to Add a card/car list landing page
  So that I can - View list of cards added/linked to my wallet - Add/link my card to wallet

  @manual @NFS-775
  Scenario: TC_01: New/First time customer navigating to Card details page
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    And I have an option to add funds on account overview page
    When I select the add funds link on the account overview page
    Then I should not see any added cards in my cards list
    When I select the add a card tile
    Then I should be navigated to How to link a card page
    When I continue from the how to link a card screen
    Then I should be navigated to scan your card details page
    When I select to enter my card details manually
    Then I should be navigated to card details page
    And I should see below fields required for card details
      | nickname            |
      | cardNumber          |
      | expiryDate          |
      | cvv                 |
      | preferredCardSwitch |
    And I should see confirm button is disabled on the card details page
    When I select back button on the top
    Then I should be navigated to scan your card details page

  @manual @android @NFS-775
  Scenario: TC_02: New/First time customer navigating to Card details page - Android only - Device back button
    Given I am on the login page
    When I login with the CrayonPayment_no_linked_card_user user
    Then I can see my account overview page
    And I have an option to add funds on account overview page
    When I select the add funds link on the account overview page
    Then I should not see any added cards in my cards list
    When I select the add a card tile
    Then I should be navigated to How to link a card page
    When I continue from the how to link a card screen
    Then I should be navigated to scan your card details page
    When I select to enter my card details manually
    Then I should be navigated to card details page
    And I should see below fields required for card details
      | nickname            |
      | cardNumber          |
      | expiryDate          |
      | cvv                 |
      | preferredCardSwitch |
    And I should see confirm button is disabled on the card details page
    When I click device back button
    Then I should be navigated to scan your card details page

  @NFS-775 @NFS-782
  Scenario: TC_03: Existing customer navigating to Card details page when at least 1 card already added
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
    And I should see below fields required for card details
      | nickname            |
      | cardNumber          |
      | expiryDate          |
      | cvv                 |
      | preferredCardSwitch |
    And I should see confirm button is disabled on the card details page
    When I select back button on the top
    Then I should be navigated to scan your card details page

  @android @NFS-775 @NFS-782
  Scenario: TC_04: Existing customer navigating to Card details page when at least 1 card already added - Android only - Device back button
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
    And I should see below fields required for card details
      | nickname            |
      | cardNumber          |
      | expiryDate          |
      | cvv                 |
      | preferredCardSwitch |
    And I should see confirm button is disabled on the card details page
    When I click device back button
    Then I should be navigated to scan your card details page

  @NFS-775 @NFS-782
  Scenario: TC_05: New/Existing customer trying to enter data into the Card details fields
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on my account
    And I click on manage cards
    And I should see any added cards in my cards list
    And I click on add new card link
    And I select continue button on the add card overlay
    And I should be navigated to scan your card details page
    And I select to enter my card details manually
    Then I should be navigated to card details page
    And I enter all the card details
      | nickName  | cardNumber       | expiryDate | cvv | preferredCard |
      | myDefault | 4826952611708872 | 01/23      | 123 | false         |
    And I validate data being entered into the card detail fields
      | field    | type         | enteredValue     | expectedValue   | continueButtonEnabled |
      | nickname | default      | blank            |                 | disabled              |
      | nickname | minLength    | a                | A               | disabled              |
      | nickname | minLength    | aa               | Aa              | enabled               |
      | nickname | maxLength    | abcdefghijklmn   | Abcdefghijklmn  | enabled               |
      | nickname | maxLength    | abcdefghijklmno  | Abcdefghijklmno | enabled               |
      | nickname | maxLength    | abcdefghijklmnop | Abcdefghijklmno | disabled              |
      | nickname | alphanumeric | a1b2c3d4         | A1b2c3d4        | enabled               |
      | nickname | withSpaces   | a1 b2 c3 d4      | A1 B2 C3 D4     | enabled               |

  @NFS-775 @NFS-782
  Scenario: TC_06: New/Existing customer trying to enter data into the Card details fields
    Given I am on the login page
    When I login with the CrayonPayment_linked_cards_user user
    Then I can see my account overview page
    And I click on my account
    And I click on manage cards
    And I should see any added cards in my cards list
    And I click on add new card link
    And I select continue button on the add card overlay
    And I should be navigated to scan your card details page
    And I select to enter my card details manually
    Then I should be navigated to card details page
    Then I should see the card scheme for the respective card number below
      | card_scheme    | card_number         |
      | visa           | 4826952611708872    |
      | mastercard     | 5105105105105100    |
      | mastercard     | 5200828282828210    |
      | mastercard     | 5301250070000191    |
      | mastercard     | 5534213456453458    |
      | mastercard     | 2222405343248877    |
      | mastercard     | 2223577120017656    |
      | chinaUnionPay  | 6243030000000001    |
      | chinaUnionPay  | 627627500944103534  |
      | chinaUnionPay  | 6220215511910850654 |
      | amex           | 379276975189050     |
      | amex           | 347478691155097     |
      | amex           | 342879445683398     |
      | amex           | 370263454650314     |
      | dinersClub     | 5455431590442729    |
      | dinersClub     | 5401280974331680    |
      | dinersClub     | 5456219795293310    |
      | dinersClubIntl | 36911118914241      |
      | dinersClubIntl | 367882333154746     |
      | dinersClubIntl | 3656838481243131    |
      | dinersClubIntl | 36636500720273445   |
      | dinersClubIntl | 360008601228566621  |
      | dinersClubIntl | 3622384282718373416 |
      | mada           | 605141              |
      | mada           | 968204              |
      | mada           | 968203              |
      | mada           | 636120              |
      | madaMasterCard | 537767              |
      | madaMasterCard | 513213              |
      | madaMasterCard | 585265              |
      | madaMasterCard | 521076              |
      | madaMasterCard | 504300              |
      | madaVisa       | 440647              |
      | madaVisa       | 493428              |
      | madaVisa       | 417633              |
      | madaVisa       | 446393              |
      | madaVisa       | 588847              |
