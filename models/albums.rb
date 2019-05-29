require('pg')
require_relative("../db/sql_runner")
require_relative("artist")

class Albums

  attr_accessor :album_name, :album_title, :album_genre
  attr_reader :id, :artist_id

  def initialize( options )
    @album_title = options['album_title']
    @album_genre = options['album_genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options["artist_id"].to_i
  end

  def save()
    sql = "INSERT INTO albums(album_title, album_genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@album_title, @album_genre, @artist_id]
    albums_result_hash = SqlRunner.run(sql, values).first
    @id = albums_result_hash["id"].to_i
  end

  def update()
    sql = "
    UPDATE albums SET (album_title, album_genre, artist_id) = ($1, $2, $3) WHERE id = $4"
    values = [@album_title, @album_genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()

    sql = "DELETE FROM albums where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)

  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_hash = results.first
    return Artist.new(artist_hash)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    album_hash = results.first
    album = Album.new(album_hash)
    return album
  end

  def self.delete_all()
      sql = "DELETE FROM albums"
      SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end


end
