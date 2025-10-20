class AllowNullUserOnComments < ActiveRecord::Migration[7.1]
  def change
    # comments tablosunda user_id sütunundaki NOT NULL kısıtlamasını kaldır.
    change_column_null :comments, :user_id, true
  end
end