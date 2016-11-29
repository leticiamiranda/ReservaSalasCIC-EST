class ConfirmaUsuarios < ActiveRecord::Migration[5.0]
  def change
    execute("UPDATE users SET confirmed_at = date('now')")
  end
end
