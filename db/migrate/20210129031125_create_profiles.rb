class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string     :name,       null: false
      t.string     :store_name, null: false
      t.text       :store_url,  null: false
      t.text       :text,       null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
