require("pry")
require_relative("../models/albums")
require_relative("../models/artists")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "Jimi Hendrix"
  })
  artist1.save()

  artist2 = Artist.new({
    "artist_name" => "Eric Clapton"
    })
    artist2.save()

    album1 = Album1.new({
      "album_title" => "Are you Excperienced",
      "album_genre" => "Rock",
      "artist_id" => artist1.id
      })
      album1.save()

      album2 = Album2.new({
        "album_title" => "Unplugged",
        "album_genre" => "Blues",
        "artist_id" => artist2.id
        })
        album2.save()

binding.pry
nil
