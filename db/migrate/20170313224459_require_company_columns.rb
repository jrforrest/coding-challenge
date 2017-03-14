class RequireCompanyColumns < ActiveRecord::Migration[5.0]
  def change
    column_names.each {|c| change_column_null :companies, c, false}
  end

  private

  def column_names
    [:name, :description, :city, :state]
  end
end
