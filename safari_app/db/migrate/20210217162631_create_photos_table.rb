class CreatePhotosTable < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.references :user
      t.references :animal
      t.timestamps
    end
  end
end
