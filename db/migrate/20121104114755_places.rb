class Places < ActiveRecord::Migration
  def up
    create_table :countries do |t|
      t.string :name, :limit => 50, :null => false
      t.string :fips104, :limit => 2, :null => false
      t.string :iso2, :limit => 2, :null => false
      t.string :iso3, :limit => 3, :null => false
      t.string :ison, :limit => 4, :null => false
      t.string :internet, :limit => 2, :null => false
      t.string :capital, :limit => 25
      t.string :map_reference, :limit => 50
      t.string :nationality_singular, :limit => 35
      t.string :nationality_plural, :limit => 35
      t.string :currency, :limit => 30
      t.string :currency_code, :limit => 3
      t.integer :population
      t.string :title, :limit => 50
      t.string :comment, :limit => 255

      t.timestamps
    end

    create_table :states do |t|
       t.references :country, :null => false
       t.string :name, :limit => 45, :null => false
       t.string :code, :limit => 8, :null => false
       t.string :adm1code, :limit => 4, :null => false

       t.timestamps
     end

     create_table :cities do |t|
       t.references :country, :null => false
       t.references :state, :null => false
       t.string :name, :limit => 45, :null => false
       t.float :latitude, :null => false
       t.float :longitude, :null => false
       t.string :timezone, :limit => 10, :null => false
       t.integer :dma_id
       t.string :county, :limit => 25
       t.string :code, :limit => 4

       t.timestamps
     end
     add_index :cities, :name


  end

  def down
    drop_table :countries
    drop_table :states
    drop_table :cities
  end
end
