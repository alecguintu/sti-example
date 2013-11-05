class Computer < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.string :type

      t.string :owner
    end
  end
end
