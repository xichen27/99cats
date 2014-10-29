class NotNullToStartdateAndCatid < ActiveRecord::Migration
  def change
    change_column :cat_rental_requests, :start_date, :date, :null => false
    change_column :cat_rental_requests, :cat_id, :integer, :null => false
  end
end
