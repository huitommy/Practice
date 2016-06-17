class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :chatrooms do |t|
      t.string :topic, null: false
    end

    create_table :messages do |t|
      t.belongs_to :chatroom, null: false
      t.string :username, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
