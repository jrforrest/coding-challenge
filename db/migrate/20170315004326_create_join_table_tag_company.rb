class CreateJoinTableTagCompany < ActiveRecord::Migration[5.0]
  def change
    create_join_table :tags, :companies do |t|
      t.index [:tag_id, :company_id]
      t.index [:company_id, :tag_id]
    end
  end
end
