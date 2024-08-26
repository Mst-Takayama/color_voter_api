class CreateVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :votes do |t|
      t.string :user_name, null: false
      t.string :user_token, null: false
      t.references :dress, null: false, foreign_key: true
      t.timestamps
    end
  end
end
