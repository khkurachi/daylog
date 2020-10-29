class AddDoNotToDays < ActiveRecord::Migration[6.0]
  def change
    add_column :days, :do_not, :string
  end
end
