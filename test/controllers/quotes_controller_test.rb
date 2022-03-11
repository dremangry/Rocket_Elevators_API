require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { b_hours: @quote.b_hours, building_type: @quote.building_type, elev_cost: @quote.elev_cost, install_fee: @quote.install_fee, max_occ: @quote.max_occ, num_apts: @quote.num_apts, num_base: @quote.num_base, num_comp: @quote.num_comp, num_corps: @quote.num_corps, num_elev: @quote.num_elev, num_floors: @quote.num_floors, num_park: @quote.num_park, product_line: @quote.product_line, total_cost: @quote.total_cost, unit_price: @quote.unit_price } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { b_hours: @quote.b_hours, building_type: @quote.building_type, elev_cost: @quote.elev_cost, install_fee: @quote.install_fee, max_occ: @quote.max_occ, num_apts: @quote.num_apts, num_base: @quote.num_base, num_comp: @quote.num_comp, num_corps: @quote.num_corps, num_elev: @quote.num_elev, num_floors: @quote.num_floors, num_park: @quote.num_park, product_line: @quote.product_line, total_cost: @quote.total_cost, unit_price: @quote.unit_price } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
