Feature: user
  In order to manage my information
  As a logged user
  I need to be able to view and change my information

  @user
  Scenario: User management should not be accessible if not logged
    Given I am on "/user"
    Then I should be on "/login"

  @user
  Scenario: User should be able to logout
    Given I am logged as "noncustomer@customer.com" - "1234"
    Then I should be on "/login"
    And I should see "incorrectos"
    And I should not see "Homer"

  @user
  Scenario: Wrong login
    Given I am logged as "customer@customer.com" - "1234"
    And I am on "/user"
    Then I should be on "/user"
    And I should see "Perfil"
    And I should see "Mis pedidos"
    And I should see "Mis direcciones"

  @user
  Scenario: User management should be accessible if logged
    Given I am logged as "customer@customer.com" - "1234"
    And I am on "/user"
    Then I should be on "/user"
    And I should see "Perfil"
    And I should see "Mis pedidos"
    And I should see "Mis direcciones"

  @user
  Scenario: User logged should see its data in edit tab
    Given I am logged as "customer@customer.com" - "1234"
    Then I am on "/user/edit"
    And the "store_user_form_type_profile_firstname" field should contain "Homer"
    And the "store_user_form_type_profile_lastname" field should contain "Simpson"
    And the "store_user_form_type_profile_email" field should contain "customer@customer.com"
    And the "store_user_form_type_profile_password_first" field should not contain "1234"
    And the "store_user_form_type_profile_password_second" field should not contain "1234"

  @user
  Scenario: User logged should see its data in all pages
    Given I am logged as "customer@customer.com" - "1234"
    And I am on "/"
    And I should see "Homer"

  @user
  Scenario: User logged should be able to change its data
    Given I am logged as "customer@customer.com" - "1234"
    And I am on "/user/edit"
    When I fill in the following:
      | store_user_form_type_profile_firstname | Engonga                 |
      | store_user_form_type_profile_lastname  | Flipencio               |
      | store_user_form_type_profile_email     | engonga@uhsinoseque.com |
    And I press "store_user_form_type_profile_send"
    And I am on "/user/edit"
    And the "store_user_form_type_profile_firstname" field should contain "Engonga"
    And the "store_user_form_type_profile_lastname" field should contain "Flipencio"
    And the "store_user_form_type_profile_email" field should contain "engonga@uhsinoseque.com"