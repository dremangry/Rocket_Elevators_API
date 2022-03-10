require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one)
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "creating a Quote" do
    visit quotes_url
    click_on "New Quote"

    fill_in "B hours", with: @quote.b_hours
    fill_in "Building type", with: @quote.building_type
    fill_in "Elev cost", with: @quote.elev_cost
    fill_in "Install fee", with: @quote.install_fee
    fill_in "Max occ", with: @quote.max_occ
    fill_in "Num apts", with: @quote.num_apts
    fill_in "Num base", with: @quote.num_base
    fill_in "Num comp", with: @quote.num_comp
    fill_in "Num corps", with: @quote.num_corps
    fill_in "Num elev", with: @quote.num_elev
    fill_in "Num floors", with: @quote.num_floors
    fill_in "Num park", with: @quote.num_park
    fill_in "Product line", with: @quote.product_line
    fill_in "Total cost", with: @quote.total_cost
    fill_in "Unit price", with: @quote.unit_price
    click_on "Create Quote"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "updating a Quote" do
    visit quotes_url
    click_on "Edit", match: :first

    fill_in "B hours", with: @quote.b_hours
    fill_in "Building type", with: @quote.building_type
    fill_in "Elev cost", with: @quote.elev_cost
    fill_in "Install fee", with: @quote.install_fee
    fill_in "Max occ", with: @quote.max_occ
    fill_in "Num apts", with: @quote.num_apts
    fill_in "Num base", with: @quote.num_base
    fill_in "Num comp", with: @quote.num_comp
    fill_in "Num corps", with: @quote.num_corps
    fill_in "Num elev", with: @quote.num_elev
    fill_in "Num floors", with: @quote.num_floors
    fill_in "Num park", with: @quote.num_park
    fill_in "Product line", with: @quote.product_line
    fill_in "Total cost", with: @quote.total_cost
    fill_in "Unit price", with: @quote.unit_price
    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote" do
    visit quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote was successfully destroyed"
  end
end
