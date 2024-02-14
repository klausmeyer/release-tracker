class RemoveLatestFromVersions < ActiveRecord::Migration[7.1]
  def change
    remove_column :versions, :latest, :boolean, null: false, default: false
  end
end
