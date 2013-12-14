class CreateCaseManagers < ActiveRecord::Migration
  def change
    create_table :case_managers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
