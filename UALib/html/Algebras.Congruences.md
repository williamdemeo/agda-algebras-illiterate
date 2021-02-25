---
layout: default
title : UALib.Algebras.Congruences module (The Agda Universal Algebra Library)
date : 2021-01-13
author: William DeMeo
---

### <a id="congruence-relations">Congruence Relations</a>

This section presents the [Algebras.Congruences][] module of the [Agda Universal Algebra Library][].

<pre class="Agda">

<a id="320" class="Symbol">{-#</a> <a id="324" class="Keyword">OPTIONS</a> <a id="332" class="Pragma">--without-K</a> <a id="344" class="Pragma">--exact-split</a> <a id="358" class="Pragma">--safe</a> <a id="365" class="Symbol">#-}</a>

<a id="370" class="Keyword">open</a> <a id="375" class="Keyword">import</a> <a id="382" href="Algebras.Signatures.html" class="Module">Algebras.Signatures</a> <a id="402" class="Keyword">using</a> <a id="408" class="Symbol">(</a><a id="409" href="Algebras.Signatures.html#1299" class="Function">Signature</a><a id="418" class="Symbol">;</a> <a id="420" href="Prelude.Preliminaries.html#5600" class="Generalizable">𝓞</a><a id="421" class="Symbol">;</a> <a id="423" href="Universes.html#262" class="Generalizable">𝓥</a><a id="424" class="Symbol">)</a>

<a id="427" class="Keyword">module</a> <a id="434" href="Algebras.Congruences.html" class="Module">Algebras.Congruences</a> <a id="455" class="Symbol">{</a><a id="456" href="Algebras.Congruences.html#456" class="Bound">𝑆</a> <a id="458" class="Symbol">:</a> <a id="460" href="Algebras.Signatures.html#1299" class="Function">Signature</a> <a id="470" href="Prelude.Preliminaries.html#5600" class="Generalizable">𝓞</a> <a id="472" href="Universes.html#262" class="Generalizable">𝓥</a><a id="473" class="Symbol">}</a> <a id="475" class="Keyword">where</a>

<a id="482" class="Keyword">open</a> <a id="487" class="Keyword">import</a> <a id="494" href="Algebras.Products.html" class="Module">Algebras.Products</a> <a id="512" class="Symbol">{</a><a id="513" class="Argument">𝑆</a> <a id="515" class="Symbol">=</a> <a id="517" href="Algebras.Congruences.html#456" class="Bound">𝑆</a><a id="518" class="Symbol">}</a> <a id="520" class="Keyword">public</a>

</pre>

A **congruence relation** of an algebra `𝑨` is defined to be an equivalence relation that is compatible with the basic operations of 𝑨.  This concept can be represented in a number of different ways in type theory.  For example, we define both a Sigma type `Con` and a record type `Congruence`, each of which captures the informal notion of congruence, and each one is useful in certain contexts. (We will see examples later.)

<pre class="Agda">

<a id="Con"></a><a id="982" href="Algebras.Congruences.html#982" class="Function">Con</a> <a id="986" class="Symbol">:</a> <a id="988" class="Symbol">{</a><a id="989" href="Algebras.Congruences.html#989" class="Bound">𝓤</a> <a id="991" class="Symbol">:</a> <a id="993" href="Agda.Primitive.html#423" class="Function">Universe</a><a id="1001" class="Symbol">}(</a><a id="1003" href="Algebras.Congruences.html#1003" class="Bound">A</a> <a id="1005" class="Symbol">:</a> <a id="1007" href="Algebras.Algebras.html#694" class="Function">Algebra</a> <a id="1015" href="Algebras.Congruences.html#989" class="Bound">𝓤</a> <a id="1017" href="Algebras.Congruences.html#456" class="Bound">𝑆</a><a id="1018" class="Symbol">)</a> <a id="1020" class="Symbol">→</a> <a id="1022" href="Algebras.Products.html#1999" class="Function">ov</a> <a id="1025" href="Algebras.Congruences.html#989" class="Bound">𝓤</a> <a id="1027" href="Universes.html#403" class="Function Operator">̇</a>
<a id="1029" href="Algebras.Congruences.html#982" class="Function">Con</a> <a id="1033" class="Symbol">{</a><a id="1034" href="Algebras.Congruences.html#1034" class="Bound">𝓤</a><a id="1035" class="Symbol">}</a> <a id="1037" href="Algebras.Congruences.html#1037" class="Bound">A</a> <a id="1039" class="Symbol">=</a> <a id="1041" href="MGS-MLTT.html#3074" class="Function">Σ</a> <a id="1043" href="Algebras.Congruences.html#1043" class="Bound">θ</a> <a id="1045" href="MGS-MLTT.html#3074" class="Function">꞉</a> <a id="1047" class="Symbol">(</a> <a id="1049" href="Relations.Binary.html#1464" class="Function">Rel</a> <a id="1053" href="Prelude.Preliminaries.html#13569" class="Function Operator">∣</a> <a id="1055" href="Algebras.Congruences.html#1037" class="Bound">A</a> <a id="1057" href="Prelude.Preliminaries.html#13569" class="Function Operator">∣</a> <a id="1059" href="Algebras.Congruences.html#1034" class="Bound">𝓤</a> <a id="1061" class="Symbol">)</a> <a id="1063" href="MGS-MLTT.html#3074" class="Function">,</a> <a id="1065" href="Relations.Quotients.html#1978" class="Record">IsEquivalence</a> <a id="1079" href="Algebras.Congruences.html#1043" class="Bound">θ</a> <a id="1081" href="MGS-MLTT.html#3515" class="Function Operator">×</a> <a id="1083" href="Algebras.Algebras.html#5347" class="Function">compatible</a> <a id="1094" href="Algebras.Congruences.html#1037" class="Bound">A</a> <a id="1096" href="Algebras.Congruences.html#1043" class="Bound">θ</a>

<a id="1099" class="Keyword">record</a> <a id="Congruence"></a><a id="1106" href="Algebras.Congruences.html#1106" class="Record">Congruence</a> <a id="1117" class="Symbol">{</a><a id="1118" href="Algebras.Congruences.html#1118" class="Bound">𝓤</a> <a id="1120" href="Algebras.Congruences.html#1120" class="Bound">𝓦</a> <a id="1122" class="Symbol">:</a> <a id="1124" href="Agda.Primitive.html#423" class="Function">Universe</a><a id="1132" class="Symbol">}</a> <a id="1134" class="Symbol">(</a><a id="1135" href="Algebras.Congruences.html#1135" class="Bound">A</a> <a id="1137" class="Symbol">:</a> <a id="1139" href="Algebras.Algebras.html#694" class="Function">Algebra</a> <a id="1147" href="Algebras.Congruences.html#1118" class="Bound">𝓤</a> <a id="1149" href="Algebras.Congruences.html#456" class="Bound">𝑆</a><a id="1150" class="Symbol">)</a> <a id="1152" class="Symbol">:</a> <a id="1154" href="Algebras.Products.html#1999" class="Function">ov</a> <a id="1157" href="Algebras.Congruences.html#1120" class="Bound">𝓦</a> <a id="1159" href="Agda.Primitive.html#636" class="Function Operator">⊔</a> <a id="1161" href="Algebras.Congruences.html#1118" class="Bound">𝓤</a> <a id="1163" href="Universes.html#403" class="Function Operator">̇</a>  <a id="1166" class="Keyword">where</a>
 <a id="1173" class="Keyword">constructor</a> <a id="mkcon"></a><a id="1185" href="Algebras.Congruences.html#1185" class="InductiveConstructor">mkcon</a>
 <a id="1192" class="Keyword">field</a>
  <a id="Congruence.⟨_⟩"></a><a id="1200" href="Algebras.Congruences.html#1200" class="Field Operator">⟨_⟩</a> <a id="1204" class="Symbol">:</a> <a id="1206" href="Relations.Binary.html#1464" class="Function">Rel</a> <a id="1210" href="Prelude.Preliminaries.html#13569" class="Function Operator">∣</a> <a id="1212" href="Algebras.Congruences.html#1135" class="Bound">A</a> <a id="1214" href="Prelude.Preliminaries.html#13569" class="Function Operator">∣</a> <a id="1216" href="Algebras.Congruences.html#1120" class="Bound">𝓦</a>
  <a id="Congruence.Compatible"></a><a id="1220" href="Algebras.Congruences.html#1220" class="Field">Compatible</a> <a id="1231" class="Symbol">:</a> <a id="1233" href="Algebras.Algebras.html#5347" class="Function">compatible</a> <a id="1244" href="Algebras.Congruences.html#1135" class="Bound">A</a> <a id="1246" href="Algebras.Congruences.html#1200" class="Field Operator">⟨_⟩</a>
  <a id="Congruence.IsEquiv"></a><a id="1252" href="Algebras.Congruences.html#1252" class="Field">IsEquiv</a> <a id="1260" class="Symbol">:</a> <a id="1262" href="Relations.Quotients.html#1978" class="Record">IsEquivalence</a> <a id="1276" href="Algebras.Congruences.html#1200" class="Field Operator">⟨_⟩</a>

<a id="1281" class="Keyword">open</a> <a id="1286" href="Algebras.Congruences.html#1106" class="Module">Congruence</a>

</pre>



#### <a id="example">Example</a>

We defined the zero relation <a href="https://ualib.gitlab.io/Relations.Binary.html#1993">𝟎-rel</a> in the [Relations.Binary][] module, and we now demonstrate how to build the trivial congruence out of this relation.

The relation <a href="https://ualib.gitlab.io/Relations.Binary.html#1993">𝟎-rel</a> is equivalent to the identity relation `≡` and these are obviously both equivalences. In fact, we already proved this of `≡` in the [Prelude.Equality][] module, so we simply apply the corresponding proofs.

<pre class="Agda">

<a id="1869" class="Keyword">module</a> <a id="1876" href="Algebras.Congruences.html#1876" class="Module">_</a> <a id="1878" class="Symbol">{</a><a id="1879" href="Algebras.Congruences.html#1879" class="Bound">𝓤</a> <a id="1881" class="Symbol">:</a> <a id="1883" href="Agda.Primitive.html#423" class="Function">Universe</a><a id="1891" class="Symbol">}</a> <a id="1893" class="Keyword">where</a>

 <a id="1901" href="Algebras.Congruences.html#1901" class="Function">𝟎-IsEquivalence</a> <a id="1917" class="Symbol">:</a> <a id="1919" class="Symbol">{</a><a id="1920" href="Algebras.Congruences.html#1920" class="Bound">A</a> <a id="1922" class="Symbol">:</a> <a id="1924" href="Algebras.Congruences.html#1879" class="Bound">𝓤</a> <a id="1926" href="Universes.html#403" class="Function Operator">̇</a> <a id="1928" class="Symbol">}</a> <a id="1930" class="Symbol">→</a> <a id="1932" href="Relations.Quotients.html#1978" class="Record">IsEquivalence</a><a id="1945" class="Symbol">{</a><a id="1946" href="Algebras.Congruences.html#1879" class="Bound">𝓤</a><a id="1947" class="Symbol">}{</a><a id="1949" class="Argument">A</a> <a id="1951" class="Symbol">=</a> <a id="1953" href="Algebras.Congruences.html#1920" class="Bound">A</a><a id="1954" class="Symbol">}</a> <a id="1956" href="Relations.Binary.html#1993" class="Function">𝟎-rel</a>
 <a id="1963" href="Algebras.Congruences.html#1901" class="Function">𝟎-IsEquivalence</a> <a id="1979" class="Symbol">=</a> <a id="1981" class="Keyword">record</a> <a id="1988" class="Symbol">{</a> <a id="1990" href="Relations.Quotients.html#2046" class="Field">rfl</a> <a id="1994" class="Symbol">=</a> <a id="1996" href="Prelude.Equality.html#1820" class="Function">≡-rfl</a><a id="2001" class="Symbol">;</a> <a id="2003" href="Relations.Quotients.html#2071" class="Field">sym</a> <a id="2007" class="Symbol">=</a> <a id="2009" href="Prelude.Equality.html#1862" class="Function">≡-sym</a><a id="2014" class="Symbol">;</a> <a id="2016" href="Relations.Quotients.html#2096" class="Field">trans</a> <a id="2022" class="Symbol">=</a> <a id="2024" href="Prelude.Equality.html#1921" class="Function">≡-trans</a> <a id="2032" class="Symbol">}</a>

</pre>

Next we formally record another obvious fact---that `𝟎-rel` is compatible with all operations of all algebras.

<pre class="Agda">

<a id="2173" class="Keyword">open</a> <a id="2178" class="Keyword">import</a> <a id="2185" href="MGS-Subsingleton-Theorems.html" class="Module">MGS-Subsingleton-Theorems</a> <a id="2211" class="Keyword">using</a> <a id="2217" class="Symbol">(</a><a id="2218" href="MGS-FunExt-from-Univalence.html#393" class="Function">funext</a><a id="2224" class="Symbol">)</a>

<a id="2227" class="Keyword">module</a> <a id="2234" href="Algebras.Congruences.html#2234" class="Module">_</a> <a id="2236" class="Symbol">{</a><a id="2237" href="Algebras.Congruences.html#2237" class="Bound">𝓤</a> <a id="2239" class="Symbol">:</a> <a id="2241" href="Agda.Primitive.html#423" class="Function">Universe</a><a id="2249" class="Symbol">}</a> <a id="2251" class="Keyword">where</a>

 <a id="2259" href="Algebras.Congruences.html#2259" class="Function">𝟎-compatible-op</a> <a id="2275" class="Symbol">:</a> <a id="2277" href="MGS-FunExt-from-Univalence.html#393" class="Function">funext</a> <a id="2284" href="Algebras.Congruences.html#472" class="Bound">𝓥</a> <a id="2286" href="Algebras.Congruences.html#2237" class="Bound">𝓤</a> <a id="2288" class="Symbol">→</a> <a id="2290" class="Symbol">{</a><a id="2291" href="Algebras.Congruences.html#2291" class="Bound">𝑨</a> <a id="2293" class="Symbol">:</a> <a id="2295" href="Algebras.Algebras.html#694" class="Function">Algebra</a> <a id="2303" href="Algebras.Congruences.html#2237" class="Bound">𝓤</a> <a id="2305" href="Algebras.Congruences.html#456" class="Bound">𝑆</a><a id="2306" class="Symbol">}</a> <a id="2308" class="Symbol">(</a><a id="2309" href="Algebras.Congruences.html#2309" class="Bound">𝑓</a> <a id="2311" class="Symbol">:</a> <a id="2313" href="Prelude.Preliminaries.html#13569" class="Function Operator">∣</a> <a id="2315" href="Algebras.Congruences.html#456" class="Bound">𝑆</a> <a id="2317" href="Prelude.Preliminaries.html#13569" class="Function Operator">∣</a><a id="2318" class="Symbol">)</a> <a id="2320" class="Symbol">→</a> <a id="2322" href="Algebras.Algebras.html#5130" class="Function">compatible-op</a> <a id="2336" class="Symbol">{</a><a id="2337" class="Argument">𝑨</a> <a id="2339" class="Symbol">=</a> <a id="2341" href="Algebras.Congruences.html#2291" class="Bound">𝑨</a><a id="2342" class="Symbol">}</a> <a id="2344" href="Algebras.Congruences.html#2309" class="Bound">𝑓</a> <a id="2346" href="Relations.Binary.html#1993" class="Function">𝟎-rel</a>
 <a id="2353" href="Algebras.Congruences.html#2259" class="Function">𝟎-compatible-op</a> <a id="2369" href="Algebras.Congruences.html#2369" class="Bound">fe</a> <a id="2372" class="Symbol">{</a><a id="2373" href="Algebras.Congruences.html#2373" class="Bound">𝑨</a><a id="2374" class="Symbol">}</a> <a id="2376" href="Algebras.Congruences.html#2376" class="Bound">𝑓</a> <a id="2378" href="Algebras.Congruences.html#2378" class="Bound">ptws0</a>  <a id="2385" class="Symbol">=</a> <a id="2387" href="MGS-MLTT.html#6613" class="Function">ap</a> <a id="2390" class="Symbol">(</a><a id="2391" href="Algebras.Congruences.html#2376" class="Bound">𝑓</a> <a id="2393" href="Algebras.Algebras.html#2844" class="Function Operator">̂</a> <a id="2395" href="Algebras.Congruences.html#2373" class="Bound">𝑨</a><a id="2396" class="Symbol">)</a> <a id="2398" class="Symbol">(</a><a id="2399" href="Algebras.Congruences.html#2369" class="Bound">fe</a> <a id="2402" class="Symbol">(λ</a> <a id="2405" href="Algebras.Congruences.html#2405" class="Bound">x</a> <a id="2407" class="Symbol">→</a> <a id="2409" href="Algebras.Congruences.html#2378" class="Bound">ptws0</a> <a id="2415" href="Algebras.Congruences.html#2405" class="Bound">x</a><a id="2416" class="Symbol">))</a>

 <a id="2421" href="Algebras.Congruences.html#2421" class="Function">𝟎-compatible</a> <a id="2434" class="Symbol">:</a> <a id="2436" href="MGS-FunExt-from-Univalence.html#393" class="Function">funext</a> <a id="2443" href="Algebras.Congruences.html#472" class="Bound">𝓥</a> <a id="2445" href="Algebras.Congruences.html#2237" class="Bound">𝓤</a> <a id="2447" class="Symbol">→</a> <a id="2449" class="Symbol">{</a><a id="2450" href="Algebras.Congruences.html#2450" class="Bound">𝑨</a> <a id="2452" class="Symbol">:</a> <a id="2454" href="Algebras.Algebras.html#694" class="Function">Algebra</a> <a id="2462" href="Algebras.Congruences.html#2237" class="Bound">𝓤</a> <a id="2464" href="Algebras.Congruences.html#456" class="Bound">𝑆</a><a id="2465" class="Symbol">}</a> <a id="2467" class="Symbol">→</a> <a id="2469" href="Algebras.Algebras.html#5347" class="Function">compatible</a> <a id="2480" href="Algebras.Congruences.html#2450" class="Bound">𝑨</a> <a id="2482" href="Relations.Binary.html#1993" class="Function">𝟎-rel</a>
 <a id="2489" href="Algebras.Congruences.html#2421" class="Function">𝟎-compatible</a> <a id="2502" href="Algebras.Congruences.html#2502" class="Bound">fe</a> <a id="2505" class="Symbol">{</a><a id="2506" href="Algebras.Congruences.html#2506" class="Bound">𝑨</a><a id="2507" class="Symbol">}</a> <a id="2509" class="Symbol">=</a> <a id="2511" class="Symbol">λ</a> <a id="2513" href="Algebras.Congruences.html#2513" class="Bound">𝑓</a> <a id="2515" href="Algebras.Congruences.html#2515" class="Bound">args</a> <a id="2520" class="Symbol">→</a> <a id="2522" href="Algebras.Congruences.html#2259" class="Function">𝟎-compatible-op</a> <a id="2538" href="Algebras.Congruences.html#2502" class="Bound">fe</a> <a id="2541" class="Symbol">{</a><a id="2542" href="Algebras.Congruences.html#2506" class="Bound">𝑨</a><a id="2543" class="Symbol">}</a> <a id="2545" href="Algebras.Congruences.html#2513" class="Bound">𝑓</a> <a id="2547" href="Algebras.Congruences.html#2515" class="Bound">args</a>

</pre>

Finally, we have the ingredients need to construct the zero congruence of any algebra we like.

<pre class="Agda">

<a id="Δ"></a><a id="2675" href="Algebras.Congruences.html#2675" class="Function">Δ</a> <a id="2677" class="Symbol">:</a> <a id="2679" class="Symbol">{</a><a id="2680" href="Algebras.Congruences.html#2680" class="Bound">𝓤</a> <a id="2682" class="Symbol">:</a> <a id="2684" href="Agda.Primitive.html#423" class="Function">Universe</a><a id="2692" class="Symbol">}</a> <a id="2694" class="Symbol">→</a> <a id="2696" href="MGS-FunExt-from-Univalence.html#393" class="Function">funext</a> <a id="2703" href="Algebras.Congruences.html#472" class="Bound">𝓥</a> <a id="2705" href="Algebras.Congruences.html#2680" class="Bound">𝓤</a> <a id="2707" class="Symbol">→</a> <a id="2709" class="Symbol">{</a><a id="2710" href="Algebras.Congruences.html#2710" class="Bound">𝑨</a> <a id="2712" class="Symbol">:</a> <a id="2714" href="Algebras.Algebras.html#694" class="Function">Algebra</a> <a id="2722" href="Algebras.Congruences.html#2680" class="Bound">𝓤</a> <a id="2724" href="Algebras.Congruences.html#456" class="Bound">𝑆</a><a id="2725" class="Symbol">}</a> <a id="2727" class="Symbol">→</a> <a id="2729" href="Algebras.Congruences.html#1106" class="Record">Congruence</a> <a id="2740" href="Algebras.Congruences.html#2710" class="Bound">𝑨</a>
<a id="2742" href="Algebras.Congruences.html#2675" class="Function">Δ</a> <a id="2744" href="Algebras.Congruences.html#2744" class="Bound">fe</a> <a id="2747" class="Symbol">=</a> <a id="2749" href="Algebras.Congruences.html#1185" class="InductiveConstructor">mkcon</a> <a id="2755" href="Relations.Binary.html#1993" class="Function">𝟎-rel</a> <a id="2761" class="Symbol">(</a><a id="2762" href="Algebras.Congruences.html#2421" class="Function">𝟎-compatible</a> <a id="2775" href="Algebras.Congruences.html#2744" class="Bound">fe</a><a id="2777" class="Symbol">)</a> <a id="2779" href="Algebras.Congruences.html#1901" class="Function">𝟎-IsEquivalence</a>

</pre>




#### <a id="quotient-algebras">Quotient algebras</a>

An important construction in universal algebra is the quotient of an algebra 𝑨 with respect to a congruence relation θ of 𝑨.  This quotient is typically denote by 𝑨 / θ and Agda allows us to define and express quotients using the standard notation.

<pre class="Agda">

<a id="_╱_"></a><a id="3129" href="Algebras.Congruences.html#3129" class="Function Operator">_╱_</a> <a id="3133" class="Symbol">:</a> <a id="3135" class="Symbol">{</a><a id="3136" href="Algebras.Congruences.html#3136" class="Bound">𝓤</a> <a id="3138" href="Algebras.Congruences.html#3138" class="Bound">𝓡</a> <a id="3140" class="Symbol">:</a> <a id="3142" href="Agda.Primitive.html#423" class="Function">Universe</a><a id="3150" class="Symbol">}(</a><a id="3152" href="Algebras.Congruences.html#3152" class="Bound">𝑨</a> <a id="3154" class="Symbol">:</a> <a id="3156" href="Algebras.Algebras.html#694" class="Function">Algebra</a> <a id="3164" href="Algebras.Congruences.html#3136" class="Bound">𝓤</a> <a id="3166" href="Algebras.Congruences.html#456" class="Bound">𝑆</a><a id="3167" class="Symbol">)</a> <a id="3169" class="Symbol">→</a> <a id="3171" href="Algebras.Congruences.html#1106" class="Record">Congruence</a><a id="3181" class="Symbol">{</a><a id="3182" href="Algebras.Congruences.html#3136" class="Bound">𝓤</a><a id="3183" class="Symbol">}{</a><a id="3185" href="Algebras.Congruences.html#3138" class="Bound">𝓡</a><a id="3186" class="Symbol">}</a> <a id="3188" href="Algebras.Congruences.html#3152" class="Bound">𝑨</a> <a id="3190" class="Symbol">→</a> <a id="3192" href="Algebras.Algebras.html#694" class="Function">Algebra</a> <a id="3200" class="Symbol">(</a><a id="3201" href="Algebras.Congruences.html#3136" class="Bound">𝓤</a> <a id="3203" href="Agda.Primitive.html#636" class="Function Operator">⊔</a> <a id="3205" href="Algebras.Congruences.html#3138" class="Bound">𝓡</a> <a id="3207" href="Agda.Primitive.html#606" class="Function Operator">⁺</a><a id="3208" class="Symbol">)</a> <a id="3210" href="Algebras.Congruences.html#456" class="Bound">𝑆</a>

<a id="3213" href="Algebras.Congruences.html#3213" class="Bound">𝑨</a> <a id="3215" href="Algebras.Congruences.html#3129" class="Function Operator">╱</a> <a id="3217" href="Algebras.Congruences.html#3217" class="Bound">θ</a> <a id="3219" class="Symbol">=</a> <a id="3221" class="Symbol">(</a> <a id="3223" href="Prelude.Preliminaries.html#13569" class="Function Operator">∣</a> <a id="3225" href="Algebras.Congruences.html#3213" class="Bound">𝑨</a> <a id="3227" href="Prelude.Preliminaries.html#13569" class="Function Operator">∣</a> <a id="3229" href="Relations.Quotients.html#3715" class="Function Operator">/</a> <a id="3231" href="Algebras.Congruences.html#1200" class="Field Operator">⟨</a> <a id="3233" href="Algebras.Congruences.html#3217" class="Bound">θ</a> <a id="3235" href="Algebras.Congruences.html#1200" class="Field Operator">⟩</a> <a id="3237" class="Symbol">)</a> <a id="3239" href="Prelude.Equality.html#463" class="InductiveConstructor Operator">,</a>                     <a id="3261" class="Comment">-- the domain of the quotient algebra</a>

        <a id="3308" class="Symbol">λ</a> <a id="3310" href="Algebras.Congruences.html#3310" class="Bound">𝑓</a> <a id="3312" href="Algebras.Congruences.html#3312" class="Bound">𝒂</a> <a id="3314" class="Symbol">→</a> <a id="3316" href="Relations.Quotients.html#3927" class="Function Operator">⟦</a> <a id="3318" class="Symbol">(</a><a id="3319" href="Algebras.Congruences.html#3310" class="Bound">𝑓</a> <a id="3321" href="Algebras.Algebras.html#2844" class="Function Operator">̂</a> <a id="3323" href="Algebras.Congruences.html#3213" class="Bound">𝑨</a><a id="3324" class="Symbol">)</a> <a id="3326" class="Symbol">(λ</a> <a id="3329" href="Algebras.Congruences.html#3329" class="Bound">i</a> <a id="3331" class="Symbol">→</a> <a id="3333" href="Prelude.Preliminaries.html#13569" class="Function Operator">∣</a> <a id="3335" href="Prelude.Preliminaries.html#13647" class="Function Operator">∥</a> <a id="3337" href="Algebras.Congruences.html#3312" class="Bound">𝒂</a> <a id="3339" href="Algebras.Congruences.html#3329" class="Bound">i</a> <a id="3341" href="Prelude.Preliminaries.html#13647" class="Function Operator">∥</a> <a id="3343" href="Prelude.Preliminaries.html#13569" class="Function Operator">∣</a><a id="3344" class="Symbol">)</a> <a id="3346" href="Relations.Quotients.html#3927" class="Function Operator">⟧</a>  <a id="3349" class="Comment">-- the basic operations of the quotient algebra</a>

</pre>

**Unicode Hints**. Produce the ╱ symbol in [agda2-mode][] by typing `\---` and then `C-f` a number of times.

#### <a id="examples">Examples</a>

The zero element of a quotient can be expressed as follows.

<pre class="Agda">

<a id="3631" class="Keyword">module</a> <a id="3638" href="Algebras.Congruences.html#3638" class="Module">_</a> <a id="3640" class="Symbol">{</a><a id="3641" href="Algebras.Congruences.html#3641" class="Bound">𝓤</a> <a id="3643" href="Algebras.Congruences.html#3643" class="Bound">𝓡</a> <a id="3645" class="Symbol">:</a> <a id="3647" href="Agda.Primitive.html#423" class="Function">Universe</a><a id="3655" class="Symbol">}</a> <a id="3657" class="Keyword">where</a>

 <a id="3665" href="Algebras.Congruences.html#3665" class="Function">Zero╱</a> <a id="3671" class="Symbol">:</a> <a id="3673" class="Symbol">{</a><a id="3674" href="Algebras.Congruences.html#3674" class="Bound">𝑨</a> <a id="3676" class="Symbol">:</a> <a id="3678" href="Algebras.Algebras.html#694" class="Function">Algebra</a> <a id="3686" href="Algebras.Congruences.html#3641" class="Bound">𝓤</a> <a id="3688" href="Algebras.Congruences.html#456" class="Bound">𝑆</a><a id="3689" class="Symbol">}(</a><a id="3691" href="Algebras.Congruences.html#3691" class="Bound">θ</a> <a id="3693" class="Symbol">:</a> <a id="3695" href="Algebras.Congruences.html#1106" class="Record">Congruence</a><a id="3705" class="Symbol">{</a><a id="3706" href="Algebras.Congruences.html#3641" class="Bound">𝓤</a><a id="3707" class="Symbol">}{</a><a id="3709" href="Algebras.Congruences.html#3643" class="Bound">𝓡</a><a id="3710" class="Symbol">}</a> <a id="3712" href="Algebras.Congruences.html#3674" class="Bound">𝑨</a><a id="3713" class="Symbol">)</a> <a id="3715" class="Symbol">→</a> <a id="3717" href="Relations.Binary.html#1464" class="Function">Rel</a> <a id="3721" class="Symbol">(</a><a id="3722" href="Prelude.Preliminaries.html#13569" class="Function Operator">∣</a> <a id="3724" href="Algebras.Congruences.html#3674" class="Bound">𝑨</a> <a id="3726" href="Prelude.Preliminaries.html#13569" class="Function Operator">∣</a> <a id="3728" href="Relations.Quotients.html#3715" class="Function Operator">/</a> <a id="3730" href="Algebras.Congruences.html#1200" class="Field Operator">⟨</a> <a id="3732" href="Algebras.Congruences.html#3691" class="Bound">θ</a> <a id="3734" href="Algebras.Congruences.html#1200" class="Field Operator">⟩</a><a id="3735" class="Symbol">)(</a><a id="3737" href="Algebras.Congruences.html#3641" class="Bound">𝓤</a> <a id="3739" href="Agda.Primitive.html#636" class="Function Operator">⊔</a> <a id="3741" href="Algebras.Congruences.html#3643" class="Bound">𝓡</a> <a id="3743" href="Agda.Primitive.html#606" class="Function Operator">⁺</a><a id="3744" class="Symbol">)</a>

 <a id="3748" href="Algebras.Congruences.html#3665" class="Function">Zero╱</a> <a id="3754" href="Algebras.Congruences.html#3754" class="Bound">θ</a> <a id="3756" class="Symbol">=</a> <a id="3758" class="Symbol">λ</a> <a id="3760" href="Algebras.Congruences.html#3760" class="Bound">x</a> <a id="3762" href="Algebras.Congruences.html#3762" class="Bound">x₁</a> <a id="3765" class="Symbol">→</a> <a id="3767" href="Algebras.Congruences.html#3760" class="Bound">x</a> <a id="3769" href="Prelude.Inverses.html#620" class="Datatype Operator">≡</a> <a id="3771" href="Algebras.Congruences.html#3762" class="Bound">x₁</a>

</pre>

Finally, the following elimination rule is sometimes useful.

<pre class="Agda">

 <a id="3864" href="Algebras.Congruences.html#3864" class="Function">╱-refl</a> <a id="3871" class="Symbol">:</a> <a id="3873" class="Symbol">{</a><a id="3874" href="Algebras.Congruences.html#3874" class="Bound">𝑨</a> <a id="3876" class="Symbol">:</a> <a id="3878" href="Algebras.Algebras.html#694" class="Function">Algebra</a> <a id="3886" href="Algebras.Congruences.html#3641" class="Bound">𝓤</a> <a id="3888" href="Algebras.Congruences.html#456" class="Bound">𝑆</a><a id="3889" class="Symbol">}(</a><a id="3891" href="Algebras.Congruences.html#3891" class="Bound">θ</a> <a id="3893" class="Symbol">:</a> <a id="3895" href="Algebras.Congruences.html#1106" class="Record">Congruence</a><a id="3905" class="Symbol">{</a><a id="3906" href="Algebras.Congruences.html#3641" class="Bound">𝓤</a><a id="3907" class="Symbol">}{</a><a id="3909" href="Algebras.Congruences.html#3643" class="Bound">𝓡</a><a id="3910" class="Symbol">}</a> <a id="3912" href="Algebras.Congruences.html#3874" class="Bound">𝑨</a><a id="3913" class="Symbol">){</a><a id="3915" href="Algebras.Congruences.html#3915" class="Bound">a</a> <a id="3917" href="Algebras.Congruences.html#3917" class="Bound">a&#39;</a> <a id="3920" class="Symbol">:</a> <a id="3922" href="Prelude.Preliminaries.html#13569" class="Function Operator">∣</a> <a id="3924" href="Algebras.Congruences.html#3874" class="Bound">𝑨</a> <a id="3926" href="Prelude.Preliminaries.html#13569" class="Function Operator">∣</a><a id="3927" class="Symbol">}</a>
  <a id="3931" class="Symbol">→</a>       <a id="3939" href="Relations.Quotients.html#3927" class="Function Operator">⟦</a> <a id="3941" href="Algebras.Congruences.html#3915" class="Bound">a</a> <a id="3943" href="Relations.Quotients.html#3927" class="Function Operator">⟧</a><a id="3944" class="Symbol">{</a><a id="3945" href="Algebras.Congruences.html#1200" class="Field Operator">⟨</a> <a id="3947" href="Algebras.Congruences.html#3891" class="Bound">θ</a> <a id="3949" href="Algebras.Congruences.html#1200" class="Field Operator">⟩</a><a id="3950" class="Symbol">}</a> <a id="3952" href="Prelude.Inverses.html#620" class="Datatype Operator">≡</a> <a id="3954" href="Relations.Quotients.html#3927" class="Function Operator">⟦</a> <a id="3956" href="Algebras.Congruences.html#3917" class="Bound">a&#39;</a> <a id="3959" href="Relations.Quotients.html#3927" class="Function Operator">⟧</a> <a id="3961" class="Symbol">→</a> <a id="3963" href="Algebras.Congruences.html#1200" class="Field Operator">⟨</a> <a id="3965" href="Algebras.Congruences.html#3891" class="Bound">θ</a> <a id="3967" href="Algebras.Congruences.html#1200" class="Field Operator">⟩</a> <a id="3969" href="Algebras.Congruences.html#3915" class="Bound">a</a> <a id="3971" href="Algebras.Congruences.html#3917" class="Bound">a&#39;</a>

 <a id="3976" href="Algebras.Congruences.html#3864" class="Function">╱-refl</a> <a id="3983" href="Algebras.Congruences.html#3983" class="Bound">θ</a> <a id="3985" href="Prelude.Inverses.html#634" class="InductiveConstructor">𝓇ℯ𝒻𝓁</a> <a id="3990" class="Symbol">=</a> <a id="3992" href="Relations.Quotients.html#2046" class="Field">IsEquivalence.rfl</a> <a id="4010" class="Symbol">(</a><a id="4011" href="Algebras.Congruences.html#1252" class="Field">IsEquiv</a> <a id="4019" href="Algebras.Congruences.html#3983" class="Bound">θ</a><a id="4020" class="Symbol">)</a> <a id="4022" class="Symbol">_</a>

</pre>

--------------------------------------

[← Algebras.Products](Algebras.Products.html)
<span style="float:right;">[Homomorphisms →](Homomorphisms.html)</span>

{% include UALib.Links.md %}