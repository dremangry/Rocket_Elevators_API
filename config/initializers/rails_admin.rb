# include ActionController::Streaming
# require ActiveController::Streaming
# require 'app/helpers/home_helper.rb'

RailsAdmin.config do |config|
  # config.parent_controller = "::ApplicationController"
  require Rails.root.join('lib', 'rails_admin', 'custom_actions.rb')
  ### Popular gems integration
 
  ## == Devise ==
  # config.authorize_with do
  config.authorize_with do
    redirect_to main_app.root_path unless user_signed_in? and Employee.where(user_id: current_user.id).exists? 

    p ">>>> HEYYYYYYYY"
    client = Aws::Polly::Client.new
    resp = client.synthesize_speech({output_format: "mp3", sample_rate: "8000", text: "Hello world!", text_type: "text", voice_id: "Matthew",})
    audio = resp.audio_stream
    IO.copy_stream(audio, "hello.mp3") 
    # send_file "hello.mp3", type: "audio/mpeg", disposition: 'inline'
    # polly = Polly.new
    # polly.request
  
  end

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard 
    # do
    #   render do
    #     bindings[:view].render :partial => "rails_admin/main/_hello_world", :locals => {:field => self, :form => bindings[:form]}
    #   end
    # end                     # mandatory
    index                   # mandatory
    root
    map
    briefing 
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app do
      except ['Lead']
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
