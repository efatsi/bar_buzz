class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :type
      t.string :value
      t.string :core_id

      t.timestamps
    end
  end
end
