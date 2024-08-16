class CreateVersionPatterns < ActiveRecord::Migration[7.1]
  def change
    create_table :version_patterns do |t|
      t.string :name,     null: false, index: { unique: true }
      t.string :examples, null: false
      t.string :regexp,   null: false

      t.timestamps
    end
  end
end
