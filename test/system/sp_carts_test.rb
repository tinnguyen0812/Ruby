require "application_system_test_case"

class SpCartsTest < ApplicationSystemTestCase
  setup do
    @sp_cart = sp_carts(:one)
  end

  test "visiting the index" do
    visit sp_carts_url
    assert_selector "h1", text: "Sp carts"
  end

  test "should create sp cart" do
    visit sp_carts_url
    click_on "New sp cart"

    fill_in "Id product", with: @sp_cart.id_product
    fill_in "Quantity", with: @sp_cart.quantity
    click_on "Create Sp cart"

    assert_text "Sp cart was successfully created"
    click_on "Back"
  end

  test "should update Sp cart" do
    visit sp_cart_url(@sp_cart)
    click_on "Edit this sp cart", match: :first

    fill_in "Id product", with: @sp_cart.id_product
    fill_in "Quantity", with: @sp_cart.quantity
    click_on "Update Sp cart"

    assert_text "Sp cart was successfully updated"
    click_on "Back"
  end

  test "should destroy Sp cart" do
    visit sp_cart_url(@sp_cart)
    click_on "Destroy this sp cart", match: :first

    assert_text "Sp cart was successfully destroyed"
  end
end
