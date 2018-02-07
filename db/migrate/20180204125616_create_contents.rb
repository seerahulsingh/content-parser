class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :tag
      t.text :text
      t.references :page

      t.timestamps
    end
  end
end
