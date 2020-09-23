class CreateTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :texts do |t|
      t.text :answer
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
