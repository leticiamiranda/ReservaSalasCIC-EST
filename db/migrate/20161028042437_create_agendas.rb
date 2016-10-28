class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.datetime :data
      t.boolean :disponibilidade

      t.timestamps null: false
    end
  end
end
