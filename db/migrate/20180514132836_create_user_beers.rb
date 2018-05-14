class CreateUserBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_beers do |t|
      t.integer :rating
      t.belongs_to :user
      t.belongs_to :beer
      t.timestamps
    end
  end
end
