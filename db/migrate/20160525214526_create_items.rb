class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.string :content
      t.string :author
      t.boolean :complete, default: false

      t.timestamps null: false
    end
  end
end
