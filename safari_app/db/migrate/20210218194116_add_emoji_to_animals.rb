class AddEmojiToAnimals < ActiveRecord::Migration[6.0]
  def change
    add_column :animals, :emoji, :string
  end
end
