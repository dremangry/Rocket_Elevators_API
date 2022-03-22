class LeadsController < ApplicationController
  before_action :set_lead, only: %i[ show edit update destroy ]
  include Freshdesk

    # GET /leads or /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1 or /leads/1.json
  def show
    @lead = Lead.find(params[:id])
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads or /leads.json
  def create
    @lead = Lead.new(lead_params)

    my_uri = "https://#{ENV['FRESHDESK_DOMAIN']}.freshdesk.com/api/v2/tickets"
    my_key = ENV['FRESHDESK_API_KEY']

    respond_to do |format|
      if @lead.save
        format.html { redirect_to lead_url(@lead), notice: "Thank you. We will communicate with you shortly!" }
        format.json { render :show, status: :created, location: @lead }

        data_hash = {
          :subject => "#{@lead.full_name} from #{@lead.company_name}", 
          :email => "#{@lead.email}",
          :type => "Question",
          :priority => 1,
          :status => 2,
          :custom_fields => {
              "cf_comment": "The contact #{@lead.full_name}  from company #{@lead.company_name} can be reached at email #{@lead.email} and at phone number #{@lead.phone}. #{@lead.department_in_charge_of_elevators} has a project named #{@lead.project_name} which would require contribution from Rocket Elevators.\nProject Description: #{@lead.project_description}",
              "cf_attached_message": "#{@lead.message}"
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
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1 or /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to lead_url(@lead), notice: "Lead was successfully updated." }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1 or /leads/1.json
  def destroy
    @lead.destroy

    respond_to do |format|
      format.html { redirect_to leads_url, notice: "Lead was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lead_params
      #params.require(:lead).permit(:full_name, :company_name, :email, :phone, :project_name, :project_description, :department_in_charge_of_elevators, :message, :attached_file_stored_as_binary)
      params.permit(:full_name, :company_name, :email, :phone, :project_name, :project_description, :department_in_charge_of_elevators, :message, :attached_file_stored_as_binary)
    end

end
