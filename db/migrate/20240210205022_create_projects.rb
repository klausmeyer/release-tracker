class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string     :source,          null: false
      t.string     :slug,            null: false
      t.string     :name,            null: false
      t.references :version_pattern, null: true, foreign_key: true

      t.timestamps
    end

    add_index :projects, [ :source, :slug ], unique: true
  end
end
