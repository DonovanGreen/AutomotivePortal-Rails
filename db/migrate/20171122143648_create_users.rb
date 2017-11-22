class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :password_digest
      t.string :company
      t.string :email
      t.boolean :admin

      t.timestamps
    end
  end
end
