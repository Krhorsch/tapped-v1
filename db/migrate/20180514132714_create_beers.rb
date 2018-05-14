class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brewery
      t.string :style
      t.timestamps
    end
  end
end
