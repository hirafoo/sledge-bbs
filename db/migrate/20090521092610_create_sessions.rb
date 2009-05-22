class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.text :a_session
      t.timestamp :updated_at
    end

    change_column :sessions, :id, :string
    execute "alter table sessions MODIFY updated_at timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP"
  end

  def self.down
    drop_table :sessions
  end
end
