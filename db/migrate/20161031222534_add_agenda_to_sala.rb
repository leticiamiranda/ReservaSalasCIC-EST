class AddAgendaToSala < ActiveRecord::Migration
  def change
    add_reference :salas, :agenda, index: true, foreign_key: true
  end
end
