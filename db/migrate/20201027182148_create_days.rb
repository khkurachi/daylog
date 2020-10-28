class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.references :user, foreign_key: true
      t.string :want_do
      t.string :must_do
      t.string :idea
      t.integer :today_point
      t.string :happy
      t.string :sad
      t.string :effort
      t.string :could_not
      t.string :learn
      t.text :impression
      t.timestamps
    end
  end
end
