require( 'pg' )

class Bounty

  attr_accessor :name, :home_world, :last_known_location, :favourite_weapon
  attr_reader :id

  def initialize( options )
    @name = options['name']
    @home_world = options['home_world']
    @last_known_location = options['last_known_location']
    @favourite_weapon = options['favourite_weapon']
    @id = options['id'].to_i if options['id']
  end

  def save()
    db = PG.connect( { dbname: 'cowboys', host: 'localhost' } )
    sql =
      "INSERT INTO space_cowboys
      (name, home_world, last_known_location, favourite_weapon )
      VALUES
      ('#{ @name }','#{ @home_world }','#{ @last_known_location }','#{ @favourite_weapon }')
      returning id;"
    @id = db.exec(sql)[0]["id"].to_i
    db.close
  end

  def update()
    db = PG.connect( { dbname: 'cowboys', host: 'localhost' } )
    sql = "UPDATE space_cowboys
          SET (name, home_world, last_known_location, favourite_weapon) =
          ('#{@name}', '#{@home_world}', '#{@last_known_location}', '#{@favourite_weapon}' )
          WHERE id = #{@id}"
    db.exec(sql)
    db.close
  end

  def self.delete_all()
    db = PG.connect( { dbname: 'cowboys', host: 'localhost' } )
    sql = "DELETE FROM space_cowboys"
    db.exec(sql)
    db.close
  end

  def delete()
    db = PG.connect( { dbname: 'cowboys', host: 'localhost' } )
    sql = "DELETE FROM space_cowboys where id = #{@id}"
    db.exec(sql)
    db.close
  end

  def self.find(id)
    db = PG.connect( { dbname: 'cowboys', host: 'localhost' } )
    sql = "SELECT * FROM space_cowboys WHERE id = #{id};"
    details = db.exec(sql)
    db.close
    return details
  end

end
