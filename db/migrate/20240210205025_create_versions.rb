class CreateVersions < ActiveRecord::Migration[7.1]
  def change
    create_table :versions do |t|
      t.references :project,     null: false, foreign_key: true
      t.integer    :major,       null: false
      t.integer    :minor,       null: false
      t.integer    :patch,       null: true
      t.integer    :pre,         null: true
      t.string     :git_tag,     null: false
      t.string     :git_sha,     null: false
      t.timestamp  :released_at, null: true
      t.boolean    :latest,      null: false, default: false

      t.timestamps
    end

    add_index :versions, [:project_id, :major, :minor, :patch, :pre], unique: true
  end
end
