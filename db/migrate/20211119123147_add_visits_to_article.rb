class AddVisitsToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :visits, :integer
  end
end
