class CreateVersions < ActiveRecord::Migration[7.1]
  def change
    create_table :versions do |t|
      t.references :project,     null: false, foreign_key: true
      t.integer    :major,       null: false
      t.integer    :minor,       null: false
      t.integer    :patch,       null: true
      t.timestamp  :released_at, null: true

      t.timestamps
    end

    add_index :versions, [:project_id, :major, :minor, :patch], unique: true
  end
end
