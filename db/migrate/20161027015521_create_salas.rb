class CreateSalas < ActiveRecord::Migration
  def change
    create_table :salas do |t|
      t.string :nome
      t.integer :qtd_lugares
      t.boolean :disponivel

      t.timestamps null: false
    end
  end
end
