class Paraphernalia < ActiveRecord::Migration
  def change
    create_table :paraphernalia do |t|
      t.references :computer
      t.string :type

      t.string :maker
      t.string :model

      t.hstore :properties
    end
  end
end
