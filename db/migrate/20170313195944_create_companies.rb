class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name, required: true

      t.string :city, required: true
      t.string :state, required: true

      t.text :description
    end
  end
end
