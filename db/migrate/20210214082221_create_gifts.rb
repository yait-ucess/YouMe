class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.integer    :price,    null: false
      t.references :giver,    foreign_key: { to_table: :users }
      t.references :receiver, foreign_key: { to_table: :profiles }
      t.timestamps
    end
  end
end
