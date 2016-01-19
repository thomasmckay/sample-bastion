class CreateSamples < ActiveRecord::Migration
  def change
    create_table :sample_bastion_plugin_samples do |t|
      t.string :name
      t.text :description
      t.integer :number

      t.timestamps
    end
  end
end
