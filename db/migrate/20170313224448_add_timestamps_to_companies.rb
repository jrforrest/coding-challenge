class AddTimestampsToCompanies < ActiveRecord::Migration[5.0]
  def up
    column_names.each do |column_name|
      add_column table_name, column_name, :datetime, null: true
    end

    set_all_timestamps

    column_names.each do |column_name|
      change_column_null table_name, column_name, false
    end
  end

  def down
    column_names.each {|cn| remove_column(table_name, cn) }
  end

  private

  def set_all_timestamps
    temporary_model.update_all(default_values)
  end

  def temporary_model
    Class.new(ActiveRecord::Base).tap {|mc| mc.table_name = table_name }
  end

  def default_values
    @default_values ||= column_names.map {|cn| [cn, default_time] }.to_h
  end

  def default_time
    1.week.ago
  end

  def column_names
    [:created_at, :updated_at, :founded_at]
  end

  def table_name
    :companies
  end
end
