class Permits < ActiveRecord::Migration[5.0]
  def change
    create_table :permits do |t|
      t.integer :document_id
      t.integer :host_id
      t.integer :guest_id

      t.timestamps
    end
  end
end
