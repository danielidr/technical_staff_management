class Address < ApplicationRecord
    has_one :client, dependent: :nullify
end
