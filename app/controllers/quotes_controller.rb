class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy ]

  # GET /quotes or /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1 or /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes or /quotes.json
  def create
    @quote = Quote.new(quote_params)

    my_uri = "https://#{ENV['FRESHDESK_DOMAIN']}.freshdesk.com/api/v2/tickets"
    my_key = ENV['FRESHDESK_API_KEY']

    respond_to do |format|
      if @quote.save
        format.html { redirect_to '/',  notice: "Thank you! Your quote was successfully submitted."}
        format.json { render :show, status: :created, location: @quote }

        data_hash = {
          :subject => "New Request Quote from #{@quote.company_name}",
          :description => building_description(@quote.building_type, @quote),
          :email => "#{@quote.email}",
          :type => "Feature Request",
          :priority => 1,
          :status => 2,
          :custom_fields => {
            "cf_comment": "A new quote request for #{@quote.building_type}. The company #{@quote.company_name} can be reached at email #{@quote.email}."
          }
        }
        
        data_json = JSON.generate(data_hash)

        req = RestClient::Request.execute(
          method: :post,
          url: my_uri,
          user: my_key,
          payload: data_json,
          headers: {'Content-Type' => 'application/json'}
        )

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully updated." }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:building_type, :num_apts, :num_floors, :num_base, :num_comp, :num_park, :num_elev, :num_corps, :max_occ, :b_hours, :product_line, :unit_price, :elev_cost, :install_fee, :total_cost, :email, :company_name, :estimated_elev)
    end

    def building_description(building_type, quote)
      case building_type
      when "Residential"
        description = "Submission details as follows. Number of Apartments: #{quote.num_apts}, Number of Floors: #{quote.num_floors}, Number of Basements: #{quote.num_base}, Estimated Number of Elevators: #{quote.estimated_elev}, Product Line: #{quote.product_line}, Total Cost: #{quote.total_cost}"
      when "Commercial"
        description = "Submission details as follows. Number of Floors: #{quote.num_floors}, Number of Basements: #{quote.num_base}, Number of Companies: #{quote.num_comp}, Number of Parking Spots: #{quote.num_park}, Estimated Number of Elevators: #{quote.estimated_elev}, Product Line: #{quote.product_line}, Total Cost: #{quote.total_cost}"
      when "Corporate"
        description = "Submission details as follows. Number of Floors: #{quote.num_floors}, Number of Basements: #{quote.num_base}, Number of Parking Spots: #{quote.num_park}, Number of Corporation: #{quote.num_corps}, Maximum Occupancy: #{quote.max_occ}, Estimated Number of Elevators: #{quote.estimated_elev}, Product Line: #{quote.product_line}, Total Cost: #{quote.total_cost}"
      when "Hybrid"
        "Submission details as follows. Number of Floors: #{quote.num_floors}, Number of Basements: #{quote.num_base}, Number of Companies: #{quote.num_comp}, Number of Parking Spots: #{quote.num_park}, Maximum Occupancy: #{quote.max_occ}, Business Hours: #{quote.b_hours}, Estimated Number of Elevators: #{quote.estimated_elev}, Product Line: #{quote.product_line}, Total Cost: #{quote.total_cost}"
      end
    end



end
