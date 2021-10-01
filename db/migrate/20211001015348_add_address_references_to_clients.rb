class AddAddressReferencesToClients < ActiveRecord::Migration[5.2]
  def change
    add_reference :clients, :address, foreign_key: true
  end
end
