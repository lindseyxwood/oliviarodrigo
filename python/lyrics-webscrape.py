GENIUS_API_TOKEN='hmbNz6OGtNv2DNSTaZ0UMegsY9fUXxpoB9_el_rx59pgtbis-_Iydx1D_yB7nQm7'

from lyricsgenius import Genius

genius = Genius(GENIUS_API_TOKEN)
# artist = genius.search_artist("Olivia Rodrigo", max_songs=3, sort="title")
# print(artist.songs)

album = genius.search_album("Guts", "Olivia Rodrigo")

for track in album.tracks:
    file_name = track.song.title + ".txt"
    print("Downloading file: " + file_name)
    with open(file_name, 'w') as f:
        f.write(track.song.lyrics)
    #print(track.song.lyrics)

# album.save_lyrics()


