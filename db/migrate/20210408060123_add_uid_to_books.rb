class AddUidToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :uid, :int
  end
end
