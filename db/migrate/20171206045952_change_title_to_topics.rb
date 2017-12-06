class ChangeTitleToTopics < ActiveRecord::Migration
  def up
	change_column :topics, :title, :string, :null => false
  end
  def down
	change_column :topics, :title, :string, :null => true
  end
end
