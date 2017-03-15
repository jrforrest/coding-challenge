class CreateFounders < ActiveRecord::Migration[5.0]
  def change
    create_table :founders do |t|
      t.string :full_name, null: false
      t.string :position, null: false

      t.references :company

      t.timestamps
    end
  end
end
