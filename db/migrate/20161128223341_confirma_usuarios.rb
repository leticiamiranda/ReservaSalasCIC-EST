require "date"
class ConfirmaUsuarios < ActiveRecord::Migration[5.0]
  def change
    Users.all.update_all confirmed_at: Time.now
  end
end
