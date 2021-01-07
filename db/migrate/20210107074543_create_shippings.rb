class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string    :postak_code,   null: false
      t.integer   :prefecture_id, null: false
      t.string    :municipality,  null: false
      t.string    :address,       null: false
      t.string    :building
      t.string    :phone_number,  null: false
      t.reference :order,         foreign_key: true

      t.timestamps
    end
  end
end
