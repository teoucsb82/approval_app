class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :dob
      t.string :ssn

      t.timestamps
    end
  end
end
