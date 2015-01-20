Sequel.migration do

  change do
    create_table :users do
      primary_key :id

      String  :name, null: false
      Integer :age
      Integer :net_worth
    end
  end

end
