class CreateChemoinformatics < ActiveRecord::Migration
  def self.up
    create_table :chemoinformatics do |t|
      t.text :input_process
      t.text :output_process

      t.timestamps
    end
  end

  def self.down
    drop_table :chemoinformatics
  end
end
