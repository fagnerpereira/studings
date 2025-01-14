class CreateSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :sessions do |t|
      t.string :user_agent
      t.string :ip_address
      t.string :request_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
