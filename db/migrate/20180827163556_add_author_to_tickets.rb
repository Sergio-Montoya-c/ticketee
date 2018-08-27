class AddAuthorToTickets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :author
  end
end
