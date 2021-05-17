---
layout: default
title : Algebras.Congruences module (The Agda Universal Algebra Library)
date : 2021-01-13
author: William DeMeo
---

### <a id="congruence-relations">Congruence Relations</a>
This section presents the [Algebras.Congruences][] module of the [Agda Universal Algebra Library][].

<pre class="Agda">

<a id="313" class="Symbol">{-#</a> <a id="317" class="Keyword">OPTIONS</a> <a id="325" class="Pragma">--without-K</a> <a id="337" class="Pragma">--exact-split</a> <a id="351" class="Pragma">--safe</a> <a id="358" class="Symbol">#-}</a>

<a id="363" class="Keyword">open</a> <a id="368" class="Keyword">import</a> <a id="375" href="Algebras.Signatures.html" class="Module">Algebras.Signatures</a> <a id="395" class="Keyword">using</a> <a id="401" class="Symbol">(</a><a id="402" href="Algebras.Signatures.html#626" class="Function">Signature</a><a id="411" class="Symbol">;</a> <a id="413" href="Overture.Preliminaries.html#8157" class="Generalizable">𝓞</a><a id="414" class="Symbol">;</a> <a id="416" href="Universes.html#262" class="Generalizable">𝓥</a><a id="417" class="Symbol">)</a>

<a id="420" class="Keyword">module</a> <a id="427" href="Algebras.Congruences.html" class="Module">Algebras.Congruences</a> <a id="448" class="Symbol">{</a><a id="449" href="Algebras.Congruences.html#449" class="Bound">𝑆</a> <a id="451" class="Symbol">:</a> <a id="453" href="Algebras.Signatures.html#626" class="Function">Signature</a> <a id="463" href="Overture.Preliminaries.html#8157" class="Generalizable">𝓞</a> <a id="465" href="Universes.html#262" class="Generalizable">𝓥</a><a id="466" class="Symbol">}</a> <a id="468" class="Keyword">where</a>

<a id="475" class="Keyword">open</a> <a id="480" class="Keyword">import</a> <a id="487" href="Algebras.Products.html" class="Module">Algebras.Products</a> <a id="505" class="Symbol">{</a><a id="506" class="Argument">𝑆</a> <a id="508" class="Symbol">=</a> <a id="510" href="Algebras.Congruences.html#449" class="Bound">𝑆</a><a id="511" class="Symbol">}</a> <a id="513" class="Keyword">public</a>

</pre>

A *congruence relation* of an algebra `𝑨` is defined to be an equivalence relation that is compatible with the basic operations of `𝑨`.  This concept can be represented in a number of alternative but equivalent ways.
<!-- Informally, a relation is a congruence of `𝑨` provided it is both an equivalence relation on the domain of `𝑨` and a subalgebra of the square `𝑨 × 𝑨`.  The latter simply means that a congruence must be compatible with all operations of the algebra. -->
Formally, we define a record type (`IsCongruence`) to represent the property of being a congruence, and we define a Sigma type (`Con`) to represent the type of congruences of a given algebra.

<pre class="Agda">

<a id="1215" class="Keyword">module</a> <a id="1222" href="Algebras.Congruences.html#1222" class="Module">_</a> <a id="1224" class="Symbol">{</a><a id="1225" href="Algebras.Congruences.html#1225" class="Bound">𝓦</a> <a id="1227" href="Algebras.Congruences.html#1227" class="Bound">𝓤</a> <a id="1229" class="Symbol">:</a> <a id="1231" href="Universes.html#205" class="Function">Universe</a><a id="1239" class="Symbol">}</a> <a id="1241" class="Keyword">where</a>

 <a id="1249" class="Keyword">record</a> <a id="1256" href="Algebras.Congruences.html#1256" class="Record">IsCongruence</a> <a id="1269" class="Symbol">(</a><a id="1270" href="Algebras.Congruences.html#1270" class="Bound">𝑨</a> <a id="1272" class="Symbol">:</a> <a id="1274" href="Algebras.Algebras.html#968" class="Function">Algebra</a> <a id="1282" href="Algebras.Congruences.html#1227" class="Bound">𝓤</a> <a id="1284" href="Algebras.Congruences.html#449" class="Bound">𝑆</a><a id="1285" class="Symbol">)(</a><a id="1287" href="Algebras.Congruences.html#1287" class="Bound">θ</a> <a id="1289" class="Symbol">:</a> <a id="1291" href="Relations.Discrete.html#4335" class="Function">Rel</a> <a id="1295" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="1297" href="Algebras.Congruences.html#1270" class="Bound">𝑨</a> <a id="1299" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="1301" href="Algebras.Congruences.html#1225" class="Bound">𝓦</a><a id="1302" class="Symbol">)</a> <a id="1304" class="Symbol">:</a> <a id="1306" href="Algebras.Products.html#2676" class="Function">ov</a> <a id="1309" href="Algebras.Congruences.html#1225" class="Bound">𝓦</a> <a id="1311" href="Agda.Primitive.html#636" class="Function Operator">⊔</a> <a id="1313" href="Algebras.Congruences.html#1227" class="Bound">𝓤</a> <a id="1315" href="Universes.html#403" class="Function Operator">̇</a>  <a id="1318" class="Keyword">where</a>
  <a id="1326" class="Keyword">constructor</a> <a id="1338" href="Algebras.Congruences.html#1338" class="InductiveConstructor">mkcon</a>
  <a id="1346" class="Keyword">field</a>       <a id="1358" href="Algebras.Congruences.html#1358" class="Field">is-equivalence</a> <a id="1373" class="Symbol">:</a> <a id="1375" href="Relations.Quotients.html#2373" class="Record">IsEquivalence</a> <a id="1389" href="Algebras.Congruences.html#1287" class="Bound">θ</a>
              <a id="1405" href="Algebras.Congruences.html#1405" class="Field">is-compatible</a>  <a id="1420" class="Symbol">:</a> <a id="1422" href="Algebras.Algebras.html#6070" class="Function">compatible</a> <a id="1433" href="Algebras.Congruences.html#1270" class="Bound">𝑨</a> <a id="1435" href="Algebras.Congruences.html#1287" class="Bound">θ</a>

 <a id="1439" href="Algebras.Congruences.html#1439" class="Function">Con</a> <a id="1443" class="Symbol">:</a> <a id="1445" class="Symbol">(</a><a id="1446" href="Algebras.Congruences.html#1446" class="Bound">𝑨</a> <a id="1448" class="Symbol">:</a> <a id="1450" href="Algebras.Algebras.html#968" class="Function">Algebra</a> <a id="1458" href="Algebras.Congruences.html#1227" class="Bound">𝓤</a> <a id="1460" href="Algebras.Congruences.html#449" class="Bound">𝑆</a><a id="1461" class="Symbol">)</a> <a id="1463" class="Symbol">→</a> <a id="1465" href="Algebras.Congruences.html#1227" class="Bound">𝓤</a> <a id="1467" href="Agda.Primitive.html#636" class="Function Operator">⊔</a> <a id="1469" href="Algebras.Products.html#2676" class="Function">ov</a> <a id="1472" href="Algebras.Congruences.html#1225" class="Bound">𝓦</a> <a id="1474" href="Universes.html#403" class="Function Operator">̇</a>
 <a id="1477" href="Algebras.Congruences.html#1439" class="Function">Con</a> <a id="1481" href="Algebras.Congruences.html#1481" class="Bound">𝑨</a> <a id="1483" class="Symbol">=</a> <a id="1485" href="MGS-MLTT.html#3074" class="Function">Σ</a> <a id="1487" href="Algebras.Congruences.html#1487" class="Bound">θ</a> <a id="1489" href="MGS-MLTT.html#3074" class="Function">꞉</a> <a id="1491" class="Symbol">(</a> <a id="1493" href="Relations.Discrete.html#4335" class="Function">Rel</a> <a id="1497" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="1499" href="Algebras.Congruences.html#1481" class="Bound">𝑨</a> <a id="1501" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="1503" href="Algebras.Congruences.html#1225" class="Bound">𝓦</a> <a id="1505" class="Symbol">)</a> <a id="1507" href="MGS-MLTT.html#3074" class="Function">,</a> <a id="1509" href="Algebras.Congruences.html#1256" class="Record">IsCongruence</a> <a id="1522" href="Algebras.Congruences.html#1481" class="Bound">𝑨</a> <a id="1524" href="Algebras.Congruences.html#1487" class="Bound">θ</a>


</pre>

Each of these types captures what it means to be a congruence and they are equivalent in the sense that each implies the other. One implication is the "uncurry" operation and the other is the second projection.

<pre class="Agda">

 <a id="1767" href="Algebras.Congruences.html#1767" class="Function">IsCongruence→Con</a> <a id="1784" class="Symbol">:</a> <a id="1786" class="Symbol">{</a><a id="1787" href="Algebras.Congruences.html#1787" class="Bound">𝑨</a> <a id="1789" class="Symbol">:</a> <a id="1791" href="Algebras.Algebras.html#968" class="Function">Algebra</a> <a id="1799" href="Algebras.Congruences.html#1227" class="Bound">𝓤</a> <a id="1801" href="Algebras.Congruences.html#449" class="Bound">𝑆</a><a id="1802" class="Symbol">}(</a><a id="1804" href="Algebras.Congruences.html#1804" class="Bound">θ</a> <a id="1806" class="Symbol">:</a> <a id="1808" href="Relations.Discrete.html#4335" class="Function">Rel</a> <a id="1812" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="1814" href="Algebras.Congruences.html#1787" class="Bound">𝑨</a> <a id="1816" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="1818" href="Algebras.Congruences.html#1225" class="Bound">𝓦</a><a id="1819" class="Symbol">)</a> <a id="1821" class="Symbol">→</a> <a id="1823" href="Algebras.Congruences.html#1256" class="Record">IsCongruence</a> <a id="1836" href="Algebras.Congruences.html#1787" class="Bound">𝑨</a> <a id="1838" href="Algebras.Congruences.html#1804" class="Bound">θ</a> <a id="1840" class="Symbol">→</a> <a id="1842" href="Algebras.Congruences.html#1439" class="Function">Con</a> <a id="1846" href="Algebras.Congruences.html#1787" class="Bound">𝑨</a>
 <a id="1849" href="Algebras.Congruences.html#1767" class="Function">IsCongruence→Con</a> <a id="1866" href="Algebras.Congruences.html#1866" class="Bound">θ</a> <a id="1868" href="Algebras.Congruences.html#1868" class="Bound">p</a> <a id="1870" class="Symbol">=</a> <a id="1872" href="Algebras.Congruences.html#1866" class="Bound">θ</a> <a id="1874" href="MGS-MLTT.html#2929" class="InductiveConstructor Operator">,</a> <a id="1876" href="Algebras.Congruences.html#1868" class="Bound">p</a>

 <a id="1880" href="Algebras.Congruences.html#1880" class="Function">Con→IsCongruence</a> <a id="1897" class="Symbol">:</a> <a id="1899" class="Symbol">{</a><a id="1900" href="Algebras.Congruences.html#1900" class="Bound">𝑨</a> <a id="1902" class="Symbol">:</a> <a id="1904" href="Algebras.Algebras.html#968" class="Function">Algebra</a> <a id="1912" href="Algebras.Congruences.html#1227" class="Bound">𝓤</a> <a id="1914" href="Algebras.Congruences.html#449" class="Bound">𝑆</a><a id="1915" class="Symbol">}</a> <a id="1917" class="Symbol">→</a> <a id="1919" class="Symbol">(</a><a id="1920" href="Algebras.Congruences.html#1920" class="Bound">(θ</a> <a id="1923" href="Algebras.Congruences.html#1920" class="Bound">,</a> <a id="1925" href="Algebras.Congruences.html#1920" class="Bound">_)</a> <a id="1928" class="Symbol">:</a> <a id="1930" href="Algebras.Congruences.html#1439" class="Function">Con</a> <a id="1934" href="Algebras.Congruences.html#1900" class="Bound">𝑨</a><a id="1935" class="Symbol">)</a> <a id="1937" class="Symbol">→</a> <a id="1939" href="Algebras.Congruences.html#1256" class="Record">IsCongruence</a> <a id="1952" href="Algebras.Congruences.html#1900" class="Bound">𝑨</a> <a id="1954" href="Algebras.Congruences.html#1921" class="Bound">θ</a>
 <a id="1957" href="Algebras.Congruences.html#1880" class="Function">Con→IsCongruence</a> <a id="1974" href="Algebras.Congruences.html#1974" class="Bound">θ</a> <a id="1976" class="Symbol">=</a> <a id="1978" href="Overture.Preliminaries.html#13884" class="Function Operator">∥</a> <a id="1980" href="Algebras.Congruences.html#1974" class="Bound">θ</a> <a id="1982" href="Overture.Preliminaries.html#13884" class="Function Operator">∥</a>

</pre>

#### <a id="example">Example</a>
We defined the *zero relation* `𝟎` in the [Relations.Discrete][] module.  We now build the *trivial congruence*, which has `𝟎` as its underlying relation. Observe that `𝟎` is equivalent to the identity relation `≡` and these are obviously both equivalence relations. In fact, we already proved this of `≡` in the [Overture.Equality][] module, so we simply apply the corresponding proofs.

<pre class="Agda">

<a id="𝟎-IsEquivalence"></a><a id="2433" href="Algebras.Congruences.html#2433" class="Function">𝟎-IsEquivalence</a> <a id="2449" class="Symbol">:</a> <a id="2451" class="Symbol">{</a><a id="2452" href="Algebras.Congruences.html#2452" class="Bound">A</a> <a id="2454" class="Symbol">:</a> <a id="2456" href="Universes.html#260" class="Generalizable">𝓤</a> <a id="2458" href="Universes.html#403" class="Function Operator">̇</a><a id="2459" class="Symbol">}</a> <a id="2461" class="Symbol">→</a>  <a id="2464" href="Relations.Quotients.html#2373" class="Record">IsEquivalence</a> <a id="2478" class="Symbol">{</a><a id="2479" class="Argument">A</a> <a id="2481" class="Symbol">=</a> <a id="2483" href="Algebras.Congruences.html#2452" class="Bound">A</a><a id="2484" class="Symbol">}</a> <a id="2486" href="Relations.Discrete.html#5395" class="Function">𝟎</a>
<a id="2488" href="Algebras.Congruences.html#2433" class="Function">𝟎-IsEquivalence</a> <a id="2504" class="Symbol">=</a> <a id="2506" class="Keyword">record</a> <a id="2513" class="Symbol">{</a><a id="2514" href="Relations.Quotients.html#2434" class="Field">rfl</a> <a id="2518" class="Symbol">=</a> <a id="2520" href="Identity-Type.html#162" class="InductiveConstructor">refl</a><a id="2524" class="Symbol">;</a> <a id="2526" href="Relations.Quotients.html#2449" class="Field">sym</a> <a id="2530" class="Symbol">=</a> <a id="2532" href="Overture.Equality.html#2999" class="Function">≡-sym</a><a id="2537" class="Symbol">;</a> <a id="2539" href="Relations.Quotients.html#2464" class="Field">trans</a> <a id="2545" class="Symbol">=</a> <a id="2547" href="Overture.Equality.html#3061" class="Function">≡-trans</a><a id="2554" class="Symbol">}</a>

</pre>

Next we formally record another obvious fact---that `𝟎-rel` is compatible with all operations of all algebras.

<pre class="Agda">

<a id="𝟎-compatible-op"></a><a id="2695" href="Algebras.Congruences.html#2695" class="Function">𝟎-compatible-op</a> <a id="2711" class="Symbol">:</a> <a id="2713" href="MGS-FunExt-from-Univalence.html#393" class="Function">funext</a> <a id="2720" href="Algebras.Congruences.html#465" class="Bound">𝓥</a> <a id="2722" href="Universes.html#260" class="Generalizable">𝓤</a> <a id="2724" class="Symbol">→</a> <a id="2726" class="Symbol">{</a><a id="2727" href="Algebras.Congruences.html#2727" class="Bound">𝑨</a> <a id="2729" class="Symbol">:</a> <a id="2731" href="Algebras.Algebras.html#968" class="Function">Algebra</a> <a id="2739" href="Universes.html#260" class="Generalizable">𝓤</a> <a id="2741" href="Algebras.Congruences.html#449" class="Bound">𝑆</a><a id="2742" class="Symbol">}</a> <a id="2744" class="Symbol">(</a><a id="2745" href="Algebras.Congruences.html#2745" class="Bound">𝑓</a> <a id="2747" class="Symbol">:</a> <a id="2749" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="2751" href="Algebras.Congruences.html#449" class="Bound">𝑆</a> <a id="2753" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a><a id="2754" class="Symbol">)</a> <a id="2756" class="Symbol">→</a> <a id="2758" class="Symbol">(</a><a id="2759" href="Algebras.Congruences.html#2745" class="Bound">𝑓</a> <a id="2761" href="Algebras.Algebras.html#3204" class="Function Operator">̂</a> <a id="2763" href="Algebras.Congruences.html#2727" class="Bound">𝑨</a><a id="2764" class="Symbol">)</a> <a id="2766" href="Relations.Discrete.html#8308" class="Function Operator">|:</a> <a id="2769" href="Relations.Discrete.html#5395" class="Function">𝟎</a>
<a id="2771" href="Algebras.Congruences.html#2695" class="Function">𝟎-compatible-op</a> <a id="2787" href="Algebras.Congruences.html#2787" class="Bound">fe</a> <a id="2790" class="Symbol">{</a><a id="2791" href="Algebras.Congruences.html#2791" class="Bound">𝑨</a><a id="2792" class="Symbol">}</a> <a id="2794" href="Algebras.Congruences.html#2794" class="Bound">𝑓</a> <a id="2796" class="Symbol">{</a><a id="2797" href="Algebras.Congruences.html#2797" class="Bound">i</a><a id="2798" class="Symbol">}{</a><a id="2800" href="Algebras.Congruences.html#2800" class="Bound">j</a><a id="2801" class="Symbol">}</a> <a id="2803" href="Algebras.Congruences.html#2803" class="Bound">ptws0</a>  <a id="2810" class="Symbol">=</a> <a id="2812" href="MGS-MLTT.html#6613" class="Function">ap</a> <a id="2815" class="Symbol">(</a><a id="2816" href="Algebras.Congruences.html#2794" class="Bound">𝑓</a> <a id="2818" href="Algebras.Algebras.html#3204" class="Function Operator">̂</a> <a id="2820" href="Algebras.Congruences.html#2791" class="Bound">𝑨</a><a id="2821" class="Symbol">)</a> <a id="2823" class="Symbol">(</a><a id="2824" href="Algebras.Congruences.html#2787" class="Bound">fe</a> <a id="2827" href="Algebras.Congruences.html#2803" class="Bound">ptws0</a><a id="2832" class="Symbol">)</a>

<a id="𝟎-compatible"></a><a id="2835" href="Algebras.Congruences.html#2835" class="Function">𝟎-compatible</a> <a id="2848" class="Symbol">:</a> <a id="2850" href="MGS-FunExt-from-Univalence.html#393" class="Function">funext</a> <a id="2857" href="Algebras.Congruences.html#465" class="Bound">𝓥</a> <a id="2859" href="Universes.html#260" class="Generalizable">𝓤</a> <a id="2861" class="Symbol">→</a> <a id="2863" class="Symbol">{</a><a id="2864" href="Algebras.Congruences.html#2864" class="Bound">𝑨</a> <a id="2866" class="Symbol">:</a> <a id="2868" href="Algebras.Algebras.html#968" class="Function">Algebra</a> <a id="2876" href="Universes.html#260" class="Generalizable">𝓤</a> <a id="2878" href="Algebras.Congruences.html#449" class="Bound">𝑆</a><a id="2879" class="Symbol">}</a> <a id="2881" class="Symbol">→</a> <a id="2883" href="Algebras.Algebras.html#6070" class="Function">compatible</a> <a id="2894" href="Algebras.Congruences.html#2864" class="Bound">𝑨</a> <a id="2896" href="Relations.Discrete.html#5395" class="Function">𝟎</a>
<a id="2898" href="Algebras.Congruences.html#2835" class="Function">𝟎-compatible</a> <a id="2911" href="Algebras.Congruences.html#2911" class="Bound">fe</a> <a id="2914" class="Symbol">{</a><a id="2915" href="Algebras.Congruences.html#2915" class="Bound">𝑨</a><a id="2916" class="Symbol">}</a> <a id="2918" class="Symbol">=</a> <a id="2920" class="Symbol">λ</a> <a id="2922" href="Algebras.Congruences.html#2922" class="Bound">𝑓</a> <a id="2924" href="Algebras.Congruences.html#2924" class="Bound">args</a> <a id="2929" class="Symbol">→</a> <a id="2931" href="Algebras.Congruences.html#2695" class="Function">𝟎-compatible-op</a> <a id="2947" href="Algebras.Congruences.html#2911" class="Bound">fe</a> <a id="2950" class="Symbol">{</a><a id="2951" href="Algebras.Congruences.html#2915" class="Bound">𝑨</a><a id="2952" class="Symbol">}</a> <a id="2954" href="Algebras.Congruences.html#2922" class="Bound">𝑓</a> <a id="2956" href="Algebras.Congruences.html#2924" class="Bound">args</a>

</pre>

Finally, we have the ingredients need to construct the zero congruence of any algebra we like.

<pre class="Agda">

<a id="Δ"></a><a id="3084" href="Algebras.Congruences.html#3084" class="Function">Δ</a> <a id="3086" class="Symbol">:</a> <a id="3088" class="Symbol">(</a><a id="3089" href="Algebras.Congruences.html#3089" class="Bound">𝑨</a> <a id="3091" class="Symbol">:</a> <a id="3093" href="Algebras.Algebras.html#968" class="Function">Algebra</a> <a id="3101" href="Universes.html#260" class="Generalizable">𝓤</a> <a id="3103" href="Algebras.Congruences.html#449" class="Bound">𝑆</a><a id="3104" class="Symbol">){</a><a id="3106" href="Algebras.Congruences.html#3106" class="Bound">fe</a> <a id="3109" class="Symbol">:</a> <a id="3111" href="MGS-FunExt-from-Univalence.html#393" class="Function">funext</a> <a id="3118" href="Algebras.Congruences.html#465" class="Bound">𝓥</a> <a id="3120" href="Universes.html#260" class="Generalizable">𝓤</a><a id="3121" class="Symbol">}</a> <a id="3123" class="Symbol">→</a> <a id="3125" href="Algebras.Congruences.html#1256" class="Record">IsCongruence</a> <a id="3138" href="Algebras.Congruences.html#3089" class="Bound">𝑨</a> <a id="3140" href="Relations.Discrete.html#5395" class="Function">𝟎</a>
<a id="3142" href="Algebras.Congruences.html#3084" class="Function">Δ</a> <a id="3144" href="Algebras.Congruences.html#3144" class="Bound">𝑨</a> <a id="3146" class="Symbol">{</a><a id="3147" href="Algebras.Congruences.html#3147" class="Bound">fe</a><a id="3149" class="Symbol">}</a> <a id="3151" class="Symbol">=</a> <a id="3153" href="Algebras.Congruences.html#1338" class="InductiveConstructor">mkcon</a> <a id="3159" href="Algebras.Congruences.html#2433" class="Function">𝟎-IsEquivalence</a> <a id="3175" class="Symbol">(</a><a id="3176" href="Algebras.Congruences.html#2835" class="Function">𝟎-compatible</a> <a id="3189" href="Algebras.Congruences.html#3147" class="Bound">fe</a><a id="3191" class="Symbol">)</a>

<a id="𝟘"></a><a id="3194" href="Algebras.Congruences.html#3194" class="Function">𝟘</a> <a id="3196" class="Symbol">:</a> <a id="3198" class="Symbol">(</a><a id="3199" href="Algebras.Congruences.html#3199" class="Bound">𝑨</a> <a id="3201" class="Symbol">:</a> <a id="3203" href="Algebras.Algebras.html#968" class="Function">Algebra</a> <a id="3211" href="Universes.html#260" class="Generalizable">𝓤</a> <a id="3213" href="Algebras.Congruences.html#449" class="Bound">𝑆</a><a id="3214" class="Symbol">){</a><a id="3216" href="Algebras.Congruences.html#3216" class="Bound">fe</a> <a id="3219" class="Symbol">:</a> <a id="3221" href="MGS-FunExt-from-Univalence.html#393" class="Function">funext</a> <a id="3228" href="Algebras.Congruences.html#465" class="Bound">𝓥</a> <a id="3230" href="Universes.html#260" class="Generalizable">𝓤</a><a id="3231" class="Symbol">}</a> <a id="3233" class="Symbol">→</a> <a id="3235" href="Algebras.Congruences.html#1439" class="Function">Con</a><a id="3238" class="Symbol">{</a><a id="3239" href="Universes.html#260" class="Generalizable">𝓤</a><a id="3240" class="Symbol">}</a> <a id="3242" href="Algebras.Congruences.html#3199" class="Bound">𝑨</a>
<a id="3244" href="Algebras.Congruences.html#3194" class="Function">𝟘</a> <a id="3246" href="Algebras.Congruences.html#3246" class="Bound">𝑨</a> <a id="3248" class="Symbol">{</a><a id="3249" href="Algebras.Congruences.html#3249" class="Bound">fe</a><a id="3251" class="Symbol">}</a> <a id="3253" class="Symbol">=</a> <a id="3255" href="Algebras.Congruences.html#1767" class="Function">IsCongruence→Con</a> <a id="3272" href="Relations.Discrete.html#5395" class="Function">𝟎</a> <a id="3274" class="Symbol">(</a><a id="3275" href="Algebras.Congruences.html#3084" class="Function">Δ</a> <a id="3277" href="Algebras.Congruences.html#3246" class="Bound">𝑨</a> <a id="3279" class="Symbol">{</a><a id="3280" href="Algebras.Congruences.html#3249" class="Bound">fe</a><a id="3282" class="Symbol">})</a>

</pre>


A concrete example is `⟪𝟎⟫[ 𝑨 ╱ θ ]`, presented in the next subsection.

#### <a id="quotient-algebras">Quotient algebras</a>
In many areas of abstract mathematics the *quotient* of an algebra `𝑨` with respect to a congruence relation `θ` of `𝑨` plays an important role. This quotient is typically denoted by `𝑨 / θ` and Agda allows us to define and express quotients using this standard notation.<sup>[1](Algebras.Congruences.html#fn1)</sup>

<pre class="Agda">

<a id="3757" class="Keyword">module</a> <a id="3764" href="Algebras.Congruences.html#3764" class="Module">_</a> <a id="3766" class="Symbol">{</a><a id="3767" href="Algebras.Congruences.html#3767" class="Bound">𝓤</a> <a id="3769" href="Algebras.Congruences.html#3769" class="Bound">𝓦</a> <a id="3771" class="Symbol">:</a> <a id="3773" href="Universes.html#205" class="Function">Universe</a><a id="3781" class="Symbol">}</a> <a id="3783" class="Keyword">where</a>

 <a id="3791" href="Algebras.Congruences.html#3791" class="Function Operator">_╱_</a> <a id="3795" class="Symbol">:</a> <a id="3797" class="Symbol">(</a><a id="3798" href="Algebras.Congruences.html#3798" class="Bound">𝑨</a> <a id="3800" class="Symbol">:</a> <a id="3802" href="Algebras.Algebras.html#968" class="Function">Algebra</a> <a id="3810" href="Algebras.Congruences.html#3767" class="Bound">𝓤</a> <a id="3812" href="Algebras.Congruences.html#449" class="Bound">𝑆</a><a id="3813" class="Symbol">)</a> <a id="3815" class="Symbol">→</a> <a id="3817" href="Algebras.Congruences.html#1439" class="Function">Con</a><a id="3820" class="Symbol">{</a><a id="3821" href="Algebras.Congruences.html#3769" class="Bound">𝓦</a><a id="3822" class="Symbol">}</a> <a id="3824" href="Algebras.Congruences.html#3798" class="Bound">𝑨</a> <a id="3826" class="Symbol">→</a> <a id="3828" href="Algebras.Algebras.html#968" class="Function">Algebra</a> <a id="3836" class="Symbol">(</a><a id="3837" href="Algebras.Congruences.html#3767" class="Bound">𝓤</a> <a id="3839" href="Agda.Primitive.html#636" class="Function Operator">⊔</a> <a id="3841" href="Algebras.Congruences.html#3769" class="Bound">𝓦</a> <a id="3843" href="Universes.html#181" class="Function Operator">⁺</a><a id="3844" class="Symbol">)</a> <a id="3846" href="Algebras.Congruences.html#449" class="Bound">𝑆</a>

 <a id="3850" href="Algebras.Congruences.html#3850" class="Bound">𝑨</a> <a id="3852" href="Algebras.Congruences.html#3791" class="Function Operator">╱</a> <a id="3854" href="Algebras.Congruences.html#3854" class="Bound">θ</a> <a id="3856" class="Symbol">=</a> <a id="3858" class="Symbol">(</a><a id="3859" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="3861" href="Algebras.Congruences.html#3850" class="Bound">𝑨</a> <a id="3863" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="3865" href="Relations.Quotients.html#4337" class="Function Operator">/</a> <a id="3867" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="3869" href="Algebras.Congruences.html#3854" class="Bound">θ</a> <a id="3871" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a><a id="3872" class="Symbol">)</a>  <a id="3875" href="MGS-MLTT.html#2929" class="InductiveConstructor Operator">,</a>                               <a id="3907" class="Comment">-- the domain of the quotient algebra</a>

         <a id="3955" class="Symbol">λ</a> <a id="3957" href="Algebras.Congruences.html#3957" class="Bound">𝑓</a> <a id="3959" href="Algebras.Congruences.html#3959" class="Bound">𝑎</a> <a id="3961" class="Symbol">→</a> <a id="3963" href="Relations.Quotients.html#4550" class="Function Operator">⟪</a> <a id="3965" class="Symbol">(</a><a id="3966" href="Algebras.Congruences.html#3957" class="Bound">𝑓</a> <a id="3968" href="Algebras.Algebras.html#3204" class="Function Operator">̂</a> <a id="3970" href="Algebras.Congruences.html#3850" class="Bound">𝑨</a><a id="3971" class="Symbol">)(λ</a> <a id="3975" href="Algebras.Congruences.html#3975" class="Bound">i</a> <a id="3977" class="Symbol">→</a>  <a id="3980" href="Overture.Preliminaries.html#13836" class="Function">fst</a> <a id="3984" href="Overture.Preliminaries.html#13884" class="Function Operator">∥</a> <a id="3986" href="Algebras.Congruences.html#3959" class="Bound">𝑎</a> <a id="3988" href="Algebras.Congruences.html#3975" class="Bound">i</a> <a id="3990" href="Overture.Preliminaries.html#13884" class="Function Operator">∥</a><a id="3991" class="Symbol">)</a> <a id="3993" href="Relations.Quotients.html#4550" class="Function Operator">⟫</a>           <a id="4005" class="Comment">-- the basic operations of the quotient algebra</a>

</pre>

**Example**. If we adopt the notation `𝟎[ 𝑨 ╱ θ ]` for the zero (or identity) relation on the quotient algebra `𝑨 ╱ θ`, then we define the zero relation as follows.

<pre class="Agda">


 <a id="4248" href="Algebras.Congruences.html#4248" class="Function Operator">𝟘[_╱_]</a> <a id="4255" class="Symbol">:</a> <a id="4257" class="Symbol">(</a><a id="4258" href="Algebras.Congruences.html#4258" class="Bound">𝑨</a> <a id="4260" class="Symbol">:</a> <a id="4262" href="Algebras.Algebras.html#968" class="Function">Algebra</a> <a id="4270" href="Algebras.Congruences.html#3767" class="Bound">𝓤</a> <a id="4272" href="Algebras.Congruences.html#449" class="Bound">𝑆</a><a id="4273" class="Symbol">)(</a><a id="4275" href="Algebras.Congruences.html#4275" class="Bound">θ</a> <a id="4277" class="Symbol">:</a> <a id="4279" href="Algebras.Congruences.html#1439" class="Function">Con</a> <a id="4283" class="Symbol">{</a><a id="4284" href="Algebras.Congruences.html#3769" class="Bound">𝓦</a><a id="4285" class="Symbol">}</a> <a id="4287" href="Algebras.Congruences.html#4258" class="Bound">𝑨</a><a id="4288" class="Symbol">)</a> <a id="4290" class="Symbol">→</a> <a id="4292" href="Relations.Discrete.html#4335" class="Function">Rel</a> <a id="4296" class="Symbol">(</a><a id="4297" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="4299" href="Algebras.Congruences.html#4258" class="Bound">𝑨</a> <a id="4301" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="4303" href="Relations.Quotients.html#4337" class="Function Operator">/</a> <a id="4305" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="4307" href="Algebras.Congruences.html#4275" class="Bound">θ</a> <a id="4309" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a><a id="4310" class="Symbol">)(</a><a id="4312" href="Algebras.Congruences.html#3767" class="Bound">𝓤</a> <a id="4314" href="Agda.Primitive.html#636" class="Function Operator">⊔</a> <a id="4316" href="Algebras.Congruences.html#3769" class="Bound">𝓦</a> <a id="4318" href="Universes.html#181" class="Function Operator">⁺</a><a id="4319" class="Symbol">)</a>
 <a id="4322" href="Algebras.Congruences.html#4248" class="Function Operator">𝟘[</a> <a id="4325" href="Algebras.Congruences.html#4325" class="Bound">𝑨</a> <a id="4327" href="Algebras.Congruences.html#4248" class="Function Operator">╱</a> <a id="4329" href="Algebras.Congruences.html#4329" class="Bound">θ</a> <a id="4331" href="Algebras.Congruences.html#4248" class="Function Operator">]</a> <a id="4333" class="Symbol">=</a> <a id="4335" class="Symbol">λ</a> <a id="4337" href="Algebras.Congruences.html#4337" class="Bound">u</a> <a id="4339" href="Algebras.Congruences.html#4339" class="Bound">v</a> <a id="4341" class="Symbol">→</a> <a id="4343" href="Algebras.Congruences.html#4337" class="Bound">u</a> <a id="4345" href="Identity-Type.html#121" class="Datatype Operator">≡</a> <a id="4347" href="Algebras.Congruences.html#4339" class="Bound">v</a>

</pre>

From this we easily obtain the zero congruence of `𝑨 ╱ θ` by applying the `Δ` function defined above.

<pre class="Agda">

 <a id="4480" href="Algebras.Congruences.html#4480" class="Function Operator">𝟎[_╱_]</a> <a id="4487" class="Symbol">:</a> <a id="4489" class="Symbol">(</a><a id="4490" href="Algebras.Congruences.html#4490" class="Bound">𝑨</a> <a id="4492" class="Symbol">:</a> <a id="4494" href="Algebras.Algebras.html#968" class="Function">Algebra</a> <a id="4502" href="Algebras.Congruences.html#3767" class="Bound">𝓤</a> <a id="4504" href="Algebras.Congruences.html#449" class="Bound">𝑆</a><a id="4505" class="Symbol">)(</a><a id="4507" href="Algebras.Congruences.html#4507" class="Bound">θ</a> <a id="4509" class="Symbol">:</a> <a id="4511" href="Algebras.Congruences.html#1439" class="Function">Con</a><a id="4514" class="Symbol">{</a><a id="4515" href="Algebras.Congruences.html#3769" class="Bound">𝓦</a><a id="4516" class="Symbol">}</a> <a id="4518" href="Algebras.Congruences.html#4490" class="Bound">𝑨</a><a id="4519" class="Symbol">){</a><a id="4521" href="Algebras.Congruences.html#4521" class="Bound">fe</a> <a id="4524" class="Symbol">:</a> <a id="4526" href="MGS-FunExt-from-Univalence.html#393" class="Function">funext</a> <a id="4533" href="Algebras.Congruences.html#465" class="Bound">𝓥</a> <a id="4535" class="Symbol">(</a><a id="4536" href="Algebras.Congruences.html#3767" class="Bound">𝓤</a> <a id="4538" href="Agda.Primitive.html#636" class="Function Operator">⊔</a> <a id="4540" href="Algebras.Congruences.html#3769" class="Bound">𝓦</a> <a id="4542" href="Universes.html#181" class="Function Operator">⁺</a><a id="4543" class="Symbol">)}</a> <a id="4546" class="Symbol">→</a> <a id="4548" href="Algebras.Congruences.html#1439" class="Function">Con</a> <a id="4552" class="Symbol">(</a><a id="4553" href="Algebras.Congruences.html#4490" class="Bound">𝑨</a> <a id="4555" href="Algebras.Congruences.html#3791" class="Function Operator">╱</a> <a id="4557" href="Algebras.Congruences.html#4507" class="Bound">θ</a><a id="4558" class="Symbol">)</a>
 <a id="4561" href="Algebras.Congruences.html#4480" class="Function Operator">𝟎[</a> <a id="4564" href="Algebras.Congruences.html#4564" class="Bound">𝑨</a> <a id="4566" href="Algebras.Congruences.html#4480" class="Function Operator">╱</a> <a id="4568" href="Algebras.Congruences.html#4568" class="Bound">θ</a> <a id="4570" href="Algebras.Congruences.html#4480" class="Function Operator">]</a> <a id="4572" class="Symbol">{</a><a id="4573" href="Algebras.Congruences.html#4573" class="Bound">fe</a><a id="4575" class="Symbol">}</a> <a id="4577" class="Symbol">=</a> <a id="4579" href="Algebras.Congruences.html#4248" class="Function Operator">𝟘[</a> <a id="4582" href="Algebras.Congruences.html#4564" class="Bound">𝑨</a> <a id="4584" href="Algebras.Congruences.html#4248" class="Function Operator">╱</a> <a id="4586" href="Algebras.Congruences.html#4568" class="Bound">θ</a> <a id="4588" href="Algebras.Congruences.html#4248" class="Function Operator">]</a> <a id="4590" href="MGS-MLTT.html#2929" class="InductiveConstructor Operator">,</a> <a id="4592" href="Algebras.Congruences.html#3084" class="Function">Δ</a> <a id="4594" class="Symbol">(</a><a id="4595" href="Algebras.Congruences.html#4564" class="Bound">𝑨</a> <a id="4597" href="Algebras.Congruences.html#3791" class="Function Operator">╱</a> <a id="4599" href="Algebras.Congruences.html#4568" class="Bound">θ</a><a id="4600" class="Symbol">)</a> <a id="4602" class="Symbol">{</a><a id="4603" href="Algebras.Congruences.html#4573" class="Bound">fe</a><a id="4605" class="Symbol">}</a>

</pre>


Finally, the following elimination rule is sometimes useful.

<pre class="Agda">

<a id="4697" class="Keyword">module</a> <a id="4704" href="Algebras.Congruences.html#4704" class="Module">_</a> <a id="4706" class="Symbol">{</a><a id="4707" href="Algebras.Congruences.html#4707" class="Bound">𝓤</a> <a id="4709" href="Algebras.Congruences.html#4709" class="Bound">𝓦</a> <a id="4711" class="Symbol">:</a> <a id="4713" href="Universes.html#205" class="Function">Universe</a><a id="4721" class="Symbol">}{</a><a id="4723" href="Algebras.Congruences.html#4723" class="Bound">𝑨</a> <a id="4725" class="Symbol">:</a> <a id="4727" href="Algebras.Algebras.html#968" class="Function">Algebra</a> <a id="4735" href="Algebras.Congruences.html#4707" class="Bound">𝓤</a> <a id="4737" href="Algebras.Congruences.html#449" class="Bound">𝑆</a><a id="4738" class="Symbol">}</a> <a id="4740" class="Keyword">where</a>
 <a id="4747" class="Keyword">open</a> <a id="4752" href="Algebras.Congruences.html#1256" class="Module">IsCongruence</a>

 <a id="4767" href="Algebras.Congruences.html#4767" class="Function">/-≡</a> <a id="4771" class="Symbol">:</a> <a id="4773" class="Symbol">(</a><a id="4774" href="Algebras.Congruences.html#4774" class="Bound">θ</a> <a id="4776" class="Symbol">:</a> <a id="4778" href="Algebras.Congruences.html#1439" class="Function">Con</a><a id="4781" class="Symbol">{</a><a id="4782" href="Algebras.Congruences.html#4709" class="Bound">𝓦</a><a id="4783" class="Symbol">}</a> <a id="4785" href="Algebras.Congruences.html#4723" class="Bound">𝑨</a><a id="4786" class="Symbol">){</a><a id="4788" href="Algebras.Congruences.html#4788" class="Bound">u</a> <a id="4790" href="Algebras.Congruences.html#4790" class="Bound">v</a> <a id="4792" class="Symbol">:</a> <a id="4794" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="4796" href="Algebras.Congruences.html#4723" class="Bound">𝑨</a> <a id="4798" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a><a id="4799" class="Symbol">}</a> <a id="4801" class="Symbol">→</a> <a id="4803" href="Relations.Quotients.html#4550" class="Function Operator">⟪</a> <a id="4805" href="Algebras.Congruences.html#4788" class="Bound">u</a> <a id="4807" href="Relations.Quotients.html#4550" class="Function Operator">⟫</a> <a id="4809" class="Symbol">{</a><a id="4810" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="4812" href="Algebras.Congruences.html#4774" class="Bound">θ</a> <a id="4814" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a><a id="4815" class="Symbol">}</a> <a id="4817" href="Identity-Type.html#121" class="Datatype Operator">≡</a> <a id="4819" href="Relations.Quotients.html#4550" class="Function Operator">⟪</a> <a id="4821" href="Algebras.Congruences.html#4790" class="Bound">v</a> <a id="4823" href="Relations.Quotients.html#4550" class="Function Operator">⟫</a> <a id="4825" class="Symbol">→</a> <a id="4827" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="4829" href="Algebras.Congruences.html#4774" class="Bound">θ</a> <a id="4831" href="Overture.Preliminaries.html#13832" class="Function Operator">∣</a> <a id="4833" href="Algebras.Congruences.html#4788" class="Bound">u</a> <a id="4835" href="Algebras.Congruences.html#4790" class="Bound">v</a>
 <a id="4838" href="Algebras.Congruences.html#4767" class="Function">/-≡</a> <a id="4842" href="Algebras.Congruences.html#4842" class="Bound">θ</a> <a id="4844" href="Identity-Type.html#162" class="InductiveConstructor">refl</a> <a id="4849" class="Symbol">=</a> <a id="4851" href="Relations.Quotients.html#2434" class="Field">IsEquivalence.rfl</a> <a id="4869" class="Symbol">(</a><a id="4870" href="Algebras.Congruences.html#1358" class="Field">is-equivalence</a> <a id="4885" href="Overture.Preliminaries.html#13884" class="Function Operator">∥</a> <a id="4887" href="Algebras.Congruences.html#4842" class="Bound">θ</a> <a id="4889" href="Overture.Preliminaries.html#13884" class="Function Operator">∥</a><a id="4890" class="Symbol">)</a>

</pre>

--------------------------------------

<sup>1</sup><span class="footnote" id="fn1"> **Unicode Hints**. Produce the `╱` symbol in [agda2-mode][] by typing `\---` and then `C-f` a number of times.</span>



<br>
<br>

[← Algebras.Products](Algebras.Products.html)
<span style="float:right;">[Homomorphisms →](Homomorphisms.html)</span>

{% include UALib.Links.md %}
