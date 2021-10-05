class Client < ApplicationRecord
    belongs_to :address
    has_many :orders

    validates_presence_of :first_name, :last_name, :rut, :email, :phone
    validates :rut, :email, uniqueness: true

end
