class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
    before_action :request_polly

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

    def request_polly
        if user_signed_in?
            if Employee.where(user_id: current_user.id).exists?
                text = "Greetings #{current_user.first_name}. There are currently #{Elevator.all.count} elevators deployed in the #{Building.all.count} buildings of your #{Customer.all.count} customers. Currently, #{Elevator.where(status: "Intervention").count} are not in Running Status and are being serviced. You currently have #{Quote.all.count} awaiting for processing and #{Lead.where(date_of_contact_request: nil).count} in your contact requests. #{Battery.all.count} batteries are deployed accross #{Address.where(entity: "building").distinct.count(:city)} cities"
                client = Aws::Polly::Client.new
                resp = client.synthesize_speech({output_format: "mp3", sample_rate: "8000", text: text, text_type: "text", voice_id: "Russell",})
                audio = resp.audio_stream
                IO.copy_stream(audio, "app/assets/audio/greetings.mp3") 
            end
        end 
    end

end