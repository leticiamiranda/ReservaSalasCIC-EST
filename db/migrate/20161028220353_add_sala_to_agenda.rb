class AddSalaToAgenda < ActiveRecord::Migration
  def change
    add_reference :agendas, :sala, index: true, foreign_key: true
  end
end
