require("pry")
require_relative("models/albums.rb")
require_relative("models/artists.rb")


Albums.delete_all()
Artists.delete_all()

artists1 = Artists.new({
  "name" => "Jimi Hendrix"
  })
  artists1.save()

  artists2 = Artists.new({
    "name" => "Eric Clapton"
    })
    artists2.save()

    albums1 = Albums.new({
      "album_title" => "Are you Excperienced",
      "album_genre" => "Rock",
      "artist_id" => artists1.id
      })
      albums1.save()

      albums2 = Albums.new({
        "album_title" => "Unplugged",
        "album_genre" => "Blues",
        "artist_id" => artists2.id
        })
        albums2.save()

binding.pry
nil
