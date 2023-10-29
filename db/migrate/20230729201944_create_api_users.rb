# frozen_string_literal: true

class CreateApiUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :api_users do |t|
      t.string :email
      t.string :username
      t.string :name
      t.integer :role, default: 0
      t.string :password_digest
      t.string :token

      t.timestamps
    end
    add_index :api_users, :token, unique: true
  end
end
