declare variable $all := collection('lyricXML/.?select=*.xml;recurse=yes');
declare variable $countAll := count($all);
declare variable $billie := collection('lyricXML/billie/.?select=*.xml;recurse=yes');
declare variable $sabrina := collection('lyricXML/sabrina/.?select=*.xml;recurse=yes');
declare variable $taylor := collection('lyricXML/taylor/.?select=*.xml;recurse=yes');
declare variable $olivia := collection('lyricXML/olivia/.?select=*.xml;recurse=yes');
declare variable $sequenceAll := ($olivia, $taylor, $billie, $sabrina);
declare variable $artistNames := ('olivia', 'billie', 'sabrina', 'taylor');

declare variable $svgPlots := 
for $n in $artistNames

let $artist := $n
let $albumFilter := $all[substring-after(base-uri(), 'oliviarodrigo')[contains(., $n)]]
let $albumNames := $albumFilter ! base-uri() ! tokenize(., 'lyricXML/.+?/')[last()] ! substring-before(., '/') => distinct-values()
return 
<svg>

    {for $a in $albumNames 
    let $files := $all[base-uri() ! contains(., $a)]
    let $fileCount := count($files)
    return 
    <desc>Tell me {$a} and {$fileCount}</desc>

}


</svg>;



$svgPlots




(:let $songTitles := $s ! base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.xml') ! replace(., '%E2%80%8B', '') ! replace(., '%E2%80%99', '') ! replace(., '-', ' '):)





