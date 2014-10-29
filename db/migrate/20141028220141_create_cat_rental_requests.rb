class CreateCatRentalRequests < ActiveRecord::Migration
  def change
    create_table :cat_rental_requests do |t|
      t.integer :cat_id, not_null: true
      t.date :start_date, not_null: true
      t.date :end_date
      t.string :status, :default => "PENDING"

      t.timestamps
    end
    
    add_index(:cat_rental_requests, :cat_id)
  end
end
