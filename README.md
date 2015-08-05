<html>
<body lang=EN-US style='tab-interval:.5in'>

<div class=WordSection1>

<p class=MsoNormal># <span class=SpellE>FiveMinWordpressOnAWS</span><o:p></o:p></p>

<p class=MsoNormal># <span class=GramE>personal</span> blog project translated
to <span class=SpellE>TerraForm</span> code, just for fun.<o:p></o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal># The Script need administrator permissions and the access
keys, please find and edit all of the keyword &quot;----REPLACE----&quot;<o:p></o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>#install terraform<o:p></o:p></p>

<p class=MsoNormal># <span class=GramE>test</span> the code<o:p></o:p></p>

<p class=MsoNormal><span class=GramE>terraform</span> plan<o:p></o:p></p>

<p class=MsoNormal># deploy or upgrade the environment<o:p></o:p></p>

<p class=MsoNormal><span class=GramE>terraform</span> apply<o:p></o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal># <span class=GramE>Create</span> graphs<o:p></o:p></p>

<p class=MsoNormal><span class=GramE>apt-get</span> install <span class=SpellE>graphviz</span><o:p></o:p></p>

<p class=MsoNormal><span class=SpellE><span class=GramE>sudo</span></span>
apt-get install <span class=SpellE>graphviz</span><o:p></o:p></p>

<p class=MsoNormal><span class=GramE>terraform</span> graph | dot -<span
class=SpellE>Tpng</span> &gt;graph.png<o:p></o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>#Integrate with Atlas if you want<o:p></o:p></p>

<p class=MsoNormal>https://consul.io/docs/guides/atlas.html<o:p></o:p></p>

<p class=MsoNormal>https://atlas.hashicorp.com/</p>

</div>

</body>

</html>
