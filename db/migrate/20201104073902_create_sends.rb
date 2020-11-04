class CreateSends < ActiveRecord::Migration[6.0]
  def change
    create_table :sends do |t|
      t.text       :content, null: false
      t.references :user,    null: false, foreign_key: true

      t.timestamps
    end
  end
end