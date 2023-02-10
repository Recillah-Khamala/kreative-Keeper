class AddPostscounterToPostscounter < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :postscounter, :integer, default: 0
  end
end
