class CreateUsers < ActiveRecord::Migration
  # Write your migrations here
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :happiness
      t.integer :nausea
      t.integer :tickets
      t.integer :height
    end
  end
end
