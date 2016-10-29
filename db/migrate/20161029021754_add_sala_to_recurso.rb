class AddSalaToRecurso < ActiveRecord::Migration
  def change
    add_reference :recursos, :sala, index: true, foreign_key: true
  end
end
