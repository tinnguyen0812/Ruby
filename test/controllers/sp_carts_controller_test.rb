require "test_helper"

class SpCartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sp_cart = sp_carts(:one)
  end

  test "should get index" do
    get sp_carts_url
    assert_response :success
  end

  test "should get new" do
    get new_sp_cart_url
    assert_response :success
  end

  test "should create sp_cart" do
    assert_difference("SpCart.count") do
      post sp_carts_url, params: { sp_cart: { id_product: @sp_cart.id_product, quantity: @sp_cart.quantity } }
    end

    assert_redirected_to sp_cart_url(SpCart.last)
  end

  test "should show sp_cart" do
    get sp_cart_url(@sp_cart)
    assert_response :success
  end

  test "should get edit" do
    get edit_sp_cart_url(@sp_cart)
    assert_response :success
  end

  test "should update sp_cart" do
    patch sp_cart_url(@sp_cart), params: { sp_cart: { id_product: @sp_cart.id_product, quantity: @sp_cart.quantity } }
    assert_redirected_to sp_cart_url(@sp_cart)
  end

  test "should destroy sp_cart" do
    assert_difference("SpCart.count", -1) do
      delete sp_cart_url(@sp_cart)
    end

    assert_redirected_to sp_carts_url
  end
end
