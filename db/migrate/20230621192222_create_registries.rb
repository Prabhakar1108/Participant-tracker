class CreateRegistries < ActiveRecord::Migration[7.0]
  def change
    create_table :registries do |t|
      t.string :name
      t.string :location
      t.string :state
      t.integer :status, default: 0


      t.timestamps
    end
  end
end
