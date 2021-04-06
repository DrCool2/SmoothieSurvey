class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :first_name
      t.string :last_name
      t.references :smoothiechoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
