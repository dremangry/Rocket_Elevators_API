require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'
require_relative 'polly_helper'
module RailsAdmin
    module Config
        module Actions
            # include PollyHelper

            class Root < RailsAdmin::Config::Actions::Base
            RailsAdmin::Config::Actions.register(self)
                register_instance_option :root do
                    true
                end
                register_instance_option :link_icon do
                    'fa fa-bar-chart' # use any of font-awesome icons
                end
            end
            
            class Map < RailsAdmin::Config::Actions::Base
                RailsAdmin::Config::Actions.register(self)
                register_instance_option :root do
                    true
                end
                register_instance_option :link_icon do
                    'fa fa-map-marker' # use any of font-awesome icons
                end
            end
        
            class Briefing < RailsAdmin::Config::Actions::Base
                # include PollyHelper
                RailsAdmin::Config::Actions.register(self)
                register_instance_option :root do
                    true
                end
                register_instance_option :link_icon do
                    'fa fa-audio' # use any of font-awesome icons
                end
                
                # register_instance_option :http_methods do
                #     [:get]
                # end

                register_instance_option :controller do
                    proc do
                        p ">>>> HEYYYYYYYY"
                        client = Aws::Polly::Client.new
                        resp = client.synthesize_speech({output_format: "mp3", sample_rate: "8000", text: "Hello world!", text_type: "text", voice_id: "Matthew",})
                        audio = resp.audio_stream
                        IO.copy_stream(audio, "hello.mp3") 
                        send_file "hello.mp3", type: "audio/mpeg", disposition: 'inline'
                        # send_data resp.audio_stream.read, type: "audio/mpeg", disposition: 'inline'

                    end

                 
                end
            end

        end
    end
end