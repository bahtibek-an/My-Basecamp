class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
        t.text :message
        t.integer :user_id , null: false
        t.references :topic, null: false, foreign_key: true
        t.timestamps
    end
  end
end
