class CreateWatches < ActiveRecord::Migration[7.0]
  def change
    create_table :watches do |t|
      t.string :name
      t.string :description
      t.string :image_url
    end
  end
end
