require("pg") #"pg" is the gem
require_relative("../db/sql_runner")

class Artists

  attr_accessor :name
  attr_reader :id

  def initialize( options )
    @id = options["id"].to_i if options["id"]
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists(name) VALUES ($1) RETURNING id"
    values = [@name]
    artist_result_hash = SqlRunner.run(sql, values).first
    @id = artist_result_hash["id"].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@id]

    artist_album_hashes = SqlRunner.run(sql, values)

    artist_albums = artist_album_hashes.map {|artist_album_hash| Albums.new(artist_album_hash)}
    return artist_albums

  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map {|artist| Artists.new(artist)}
  end

end
