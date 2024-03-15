# Regex Ex. 5

1. Find: `all-american bitch` Replace: `<title>\0</title>`
2. Find: `Lyrics` Replace: `<doc type="lyrics">\0</doc>`
3. Find: `.+` Replace: `<xml>\0</xml>`
4. Find: `(\[Verse 1\])` Replace: `\0<verse n="1">`
5. Find: `(\[Chorus\])` Replace: `\0<chorus>`
5. FInd: `(\[Verse 2\])` Replace: `\0<verse n="2">`
5. Find: `(\[Outro\])` Replace: `\0<outro>`
5. Find: `\n` Replace: `</p>\0<p>`