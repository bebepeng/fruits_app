class Fruits < ActiveRecord::Migration
  def change
    create_table :fruits do |t|
        t.string  :name
        t.string  :description
    end
  end
end
