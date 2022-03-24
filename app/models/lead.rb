class Lead < ApplicationRecord
    has_one_attached :attached_file_stored_as_binary
end
