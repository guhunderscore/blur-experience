class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.string :title
      t.text :description
      t.string :thank_to
      t.string :image

      t.timestamps
    end
  end
end
