# module PollyHelper
    class Polly < ApplicationController
        def self.hello
            p "Hello"
        end

        def self.request_polly
            client = Aws::Polly::Client.new
            resp = client.synthesize_speech({output_format: "mp3", sample_rate: "8000", text: "Hello world!", text_type: "text", voice_id: "Matthew",})
            audio = resp.audio_stream
            IO.copy_stream(audio, "hello.mp3") 
            send_file "hello.mp3", :type=>"audio/mp3"
        end
    end
# end