class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :extension, default: "+91"
      t.string :contact_number
      t.integer :status, default: 0, index: true

      t.timestamps
    end
  end
end
