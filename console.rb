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

    artists3 = Artists.new({
      "name" => "Bon Jovi"
      })
      artists3.save()

      artists4 = Artists.new({
        "name" => "Carlos Santana"
        })
        artists4.save()

        artists5 = Artists.new({
          "name" => "James Bay"
          })
          artists5.save()

    albums1 = Albums.new({
      "album_title" => "Are you Experienced",
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

        albums3 = Albums.new({
          "album_title" => "Slippery When Wet",
          "album_genre" => "Rock",
          "artist_id" => artists3.id
          })
          albums3.save()

          albums4 = Albums.new({
            "album_title" => "Santana's Greatest Hits",
            "album_genre" => "Blues",
            "artist_id" => artists4.id
            })
            albums4.save()

            albums5 = Albums.new({
              "album_title" => "Electric Light",
              "album_genre" => "Prog Pop",
              "artist_id" => artists5.id
              })
              albums5.save()

              albums6 = Albums.new({
                "album_title" => "The Dark of the Morning",
                "album_genre" => "Prog Pop",
                "artist_id" => artists5.id
                })
                albums6.save()

                albums7 = Albums.new({
                  "album_title" => "Power of Peace",
                  "album_genre" => "Blues",
                  "artist_id" => artists4.id
                  })
                  albums7.save()



binding.pry
nil
