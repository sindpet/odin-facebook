class AddNameAndProfilePicUrlToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :profile_pic_url, :string
  end
end
