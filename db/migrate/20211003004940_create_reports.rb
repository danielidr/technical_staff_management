class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.text :tests_performed
      t.text :report_comments
      t.belongs_to :order, foreign_key: true

      t.timestamps
    end
  end
end
