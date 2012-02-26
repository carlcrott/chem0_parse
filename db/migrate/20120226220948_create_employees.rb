class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :name
      # integers >> integer for postgres?
      t.integer :extension

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
