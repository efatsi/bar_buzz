class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :type
      t.integer :value
      t.integer :core_id

      t.timestamps
    end
  end
end
