declare variable $all := collection('lyricXML/.?select=*.xml;recurse=yes');
declare variable $countAll := count($all);
declare variable $billie := collection('lyricXML/billie/.?select=*.xml;recurse=yes');
declare variable $sabrina := collection('lyricXML/sabrina/.?select=*.xml;recurse=yes');
declare variable $taylor := collection('lyricXML/taylor/.?select=*.xml;recurse=yes');
declare variable $olivia := collection('lyricXML/olivia/.?select=*.xml;recurse=yes');
declare variable $sequenceAll := ($olivia, $billie, $sabrina, $taylor);
declare variable $artistNames := ('olivia', 'billie', 'sabrina', 'taylor');
declare variable $xSpacer := 100;
declare variable $ySpacer := 10;
declare variable $colors := ("purple","blue","pink","red");

declare variable $svgPlot := 
<svg width="500" height="300" viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg">
      <desc>Song Number by Albums</desc>
      
      <g id="wholePlot" transform="translate(10, 200)">
      
      {
  for $n at $pos in $artistNames
  let $artist := $n
  let $albumFilter := $all[substring-after(base-uri(), 'oliviarodrigo')[contains(., $n)]]
  let $albumNames := $albumFilter ! base-uri() ! tokenize(., 'lyricXML/.+?/')[last()] ! substring-before(., '/') => distinct-values()
  let $albumCount := count($albumNames)
  let $albumfileCounts :=  
        for $a in $albumNames 
        let $files := $all[base-uri() ! contains(., $a)]
        let $fileCount := count($files)
        return $fileCount 
        
  let $albumRatio := sum($albumfileCounts) div $albumCount
  return
        
          <g id="{$n}">
            <desc> {$n} and {$albumRatio}</desc>
            <text font-size="2em" x="{$xSpacer * $pos}" y="50">{$n}</text>
            <text font-size="2em" x="{$xSpacer * $pos}" y="100">{$albumRatio}</text>
            <line stroke="{$colors[position() = $pos]}" stroke-width="{$xSpacer div 2}" 
       x1="{$xSpacer * $pos}" x2="{$xSpacer * $pos}" y1 = "0" y2="-{$albumRatio * $ySpacer}"/>
       
          </g>
      }
      
      </g>
    </svg>;


$svgPlot


(:let $songTitles := $s ! base-uri() ! tokenize(., '/')[last()] ! substring-before(., '.xml') ! replace(., '%E2%80%8B', '') ! replace(., '%E2%80%99', '') ! replace(., '-', ' '):)





