class AddcopyToposts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :copy, :text
  end
end
