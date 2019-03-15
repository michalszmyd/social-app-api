class AddFirstNameAndLastNameForUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    User.reset_column_information

    User.find_each do |user|
      splitted = user.email.split(/[@\.]/)

      user.update(first_name: splitted.first, last_name: splitted.second)
    end

    change_column :users, :first_name, :string, null: false
    change_column :users, :last_name, :string, null: false
  end
end
