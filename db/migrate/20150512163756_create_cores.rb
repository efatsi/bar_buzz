class CreateCores < ActiveRecord::Migration
  def change
    create_table :cores do |t|
      t.string :name
      t.string :spark_id

      t.timestamps
    end
  end
end
