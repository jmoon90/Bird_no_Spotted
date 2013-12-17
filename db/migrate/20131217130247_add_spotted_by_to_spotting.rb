class AddSpottedByToSpotting < ActiveRecord::Migration
  def up
    add_column :spottings, :spotted_by, :string
  end

  def down
    remove_column :spottings, :spotted_by
  end
end
