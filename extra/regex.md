# Olivia Rodrigo Regex XML Format


### Step 1. Find hard returns and get rid of them

Find: `^\s*\n` 

Replace: nothing


### Step 2. Sections 
* Replace "Verse" with the name of the section in square brackets you want to replace
* ex) [Bridge], [Chorus], [Outro]

Find: `\[Verse\s*\d*\]\n((?:.*(?:\n(?!(?:<|\[)).*)*))`

Replace: `<section type="verse">\n$1\n</section>`


### Step 3. Lyrics element over whole document

Find: `^([\s\S]*)$`

Replace: `<lyrics>\n$1\n</lyrics>\n`


### Step 4.  Line elements in sections

Find: `^(?!\s*<)(.+)$`

Replace: `<l>$1</l>`




### Notes (helpful regex if needed): 
 `\[(.*?)\]` Finding words in square brackets 
 
 ex: [Bridge], [Verse 1], [Chorus]