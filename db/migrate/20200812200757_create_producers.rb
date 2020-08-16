class CreateProducers < ActiveRecord::Migration[6.0]
  def change
    create_table :producers do |t|
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :producers, :user_id
  end
end
