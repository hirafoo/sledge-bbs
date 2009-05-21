class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.text :a_session

      t.timestamps
    end

    change_column :sessions, :id, :string
  end

  def self.down
    drop_table :sessions
  end
end
