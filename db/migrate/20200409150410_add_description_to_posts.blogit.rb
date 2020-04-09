# This migration comes from blogit (originally 20150618184415)
class AddDescriptionToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :blogit_posts, :description, :text
  end
end
