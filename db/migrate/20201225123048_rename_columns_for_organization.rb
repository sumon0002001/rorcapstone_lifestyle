

class RenameColumnsForOrganization < ActiveRecord::Migration[6.0]
  def change
    rename_column :organizations, :categoryId, :category_id
    rename_column :organizations, :articleId, :article_id
    rename_column :votes, :articleId, :article_id
    rename_column :votes, :userId, :user_id
    rename_column :articles, :authorId, :author_id
  end
end
