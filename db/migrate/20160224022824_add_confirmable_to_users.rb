#
class AddConfirmableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_token, :string
    # t.string   :confirmation_token
    add_column :users, :confirmed_at, :datetime
    # t.datetime :confirmed_at
    add_column :users, :confirmation_sent_at, :datetime
    # t.datetime :confirmation_sent_at
  end
end
