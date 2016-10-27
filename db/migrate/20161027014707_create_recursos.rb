class CreateRecursos < ActiveRecord::Migration
  def change
    create_table :recursos do |t|
      t.string :nome
      t.integer :qtd

      t.timestamps null: false
    end
  end
end
