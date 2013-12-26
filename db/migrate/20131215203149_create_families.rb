class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.string :church
      t.boolean :licensed, default: false
      t.date :licensed_date
      t.string :provider_id
      t.references :case_manager

      t.timestamps
    end
  end
end
