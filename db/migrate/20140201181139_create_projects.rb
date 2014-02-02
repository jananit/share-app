class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
        t.attachment :avatar
      t.timestamps
    end
  end
end
