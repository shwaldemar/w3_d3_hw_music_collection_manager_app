require("pg") #"pg" is the gem
require_relative("../db/sql_runner")

class Artist

  attr_accessor :artist_name
  attr_reader :id

  def initialize( options )
    @id = options["id"].to_i if options["id"]
    @artist_name = options['artist_name']
  end

  def save()
    sql = "INSERT INTO artists(artist_name) VALUES ($1) RETURNING id"
    values = [@artist_name]
    artist_result_hash = SqlRunner.run(sql, values).first
    @id = artist_result_hash["id"].to_i
  end

  def albums()
    sql = "SELECT * FROM music_manager WHERE artist_id = $1"
    values = [@id]
    artist_album_hashes = SqlRunner.run(sql, values)
    artist_albums = artist_album_hashes.map {|artist_album_hash| Artist.new(artist_album_hash)}
    return artist_albums
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map {|artist| Artist.new(artist)}
  end

end
