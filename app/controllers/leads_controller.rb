class LeadsController < ApplicationController
  before_action :set_lead, only: %i[ show edit update destroy ]

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
    puts "create lead function works ---------------------------------------------"
    @post = Post.new(post_params)
    if NewGoogleRecaptcha.human?(
        params[:new_google_recaptcha_token],
        "checkout",
        NewGoogleRecaptcha.minimum_score,
        @post
      ) && @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end
  
  def create
    puts "create lead function works ---------------------------------------------"
    @lead = Lead.new(lead_params)

    respond_to do |format|
      if @lead.save
        format.html { redirect_to '/', notice: "Thank you. We will communicate with you shortly!" }
        format.json { render :show, status: :created, location: @lead }
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
