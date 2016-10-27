class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.datetime :data

      t.timestamps null: false
    end
  end
end
