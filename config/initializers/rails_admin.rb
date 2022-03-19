RailsAdmin.config do |config|
  # config.parent_controller = "::ApplicationController"
  require Rails.root.join('lib', 'rails_admin', 'custom_actions.rb')

  ### Popular gems integration
 
  ## == Devise ==
  # config.authorize_with do
  config.authorize_with do
    redirect_to main_app.root_path unless user_signed_in? and Employee.where(user_id: current_user.id).exists? 
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
    dashboard                     # mandatory
    index                         # mandatory
    root
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
