class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :scheduled_at
      t.text :comments
      t.integer :status
      t.belongs_to :client, foreign_key: true
      t.belongs_to :address, foreign_key: true
      t.references :user, foreign_key: true
      t.references :created_by, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
