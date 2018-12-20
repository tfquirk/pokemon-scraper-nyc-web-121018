class Pokemon

    attr_accessor :name, :id, :type, :db

    def initialize(attributes)

    end

    def self.save(name, type, db)
        db.execute( "INSERT INTO pokemon ( name, type ) VALUES ( ?, ? )", [name, type])
    end

    def self.find(num, db)
      retrieve_pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [num])
      new_pokemon = self.new(retrieve_pokemon)
      new_pokemon.id = retrieve_pokemon[0][0]
      new_pokemon.name = retrieve_pokemon[0][1]
      new_pokemon.type = retrieve_pokemon[0][2]
      new_pokemon
    end

end #end Pokemon class
