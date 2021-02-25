---
layout: default
title : UALib.Prelude.Equality module (Agda Universal Algebra Library)
date : 2021-01-12
author: William DeMeo
---

### <a id="equality">Equality</a>

This section describes the [UALib.Prelude.Equality][] module of the [Agda Universal Algebra Library][].

<pre class="Agda">

<a id="291" class="Symbol">{-#</a> <a id="295" class="Keyword">OPTIONS</a> <a id="303" class="Pragma">--without-K</a> <a id="315" class="Pragma">--exact-split</a> <a id="329" class="Pragma">--safe</a> <a id="336" class="Symbol">#-}</a>

<a id="341" class="Keyword">module</a> <a id="348" href="Prelude.Equality.html" class="Module">Prelude.Equality</a> <a id="365" class="Keyword">where</a>

<a id="372" class="Keyword">open</a> <a id="377" class="Keyword">import</a> <a id="384" href="Prelude.Preliminaries.html" class="Module">Prelude.Preliminaries</a> <a id="406" class="Keyword">public</a>
<a id="413" class="Keyword">open</a> <a id="418" class="Keyword">import</a> <a id="425" href="Sigma-Type.html" class="Module">Sigma-Type</a> <a id="436" class="Keyword">renaming</a> <a id="445" class="Symbol">(</a><a id="446" href="Sigma-Type.html#188" class="InductiveConstructor Operator">_,_</a> <a id="450" class="Symbol">to</a> <a id="453" class="Keyword">infixr</a> <a id="460" class="Number">50</a> <a id="_,_"></a><a id="463" href="Prelude.Equality.html#463" class="InductiveConstructor Operator">_,_</a><a id="466" class="Symbol">)</a> <a id="468" class="Keyword">public</a>
<a id="475" class="Keyword">open</a> <a id="480" class="Keyword">import</a> <a id="487" href="MGS-MLTT.html" class="Module">MGS-MLTT</a> <a id="496" class="Keyword">using</a> <a id="502" class="Symbol">(</a><a id="503" href="MGS-MLTT.html#2942" class="Function">pr₁</a><a id="506" class="Symbol">;</a> <a id="508" href="MGS-MLTT.html#3001" class="Function">pr₂</a><a id="511" class="Symbol">;</a> <a id="513" href="MGS-MLTT.html#3515" class="Function Operator">_×_</a><a id="516" class="Symbol">;</a> <a id="518" href="MGS-MLTT.html#3074" class="Function">-Σ</a><a id="520" class="Symbol">)</a> <a id="522" class="Keyword">public</a>

</pre>

#### <a id="refl">refl</a>

The type which is often referred to as "reflexivity" or "refl" is a very basic and important one. It represents [definitional equality](https://ncatlab.org/nlab/show/equality#definitional_equality).

The `refl` type we use is a standard one. It is defined in the `Identity-Type` module of the [Type Topology][] library, which we imported in the [Prelude.Preliminaries][] module, but apart from syntax it is equivalent to the identity type used in most other Agda libraries.

In the present module, we make `refl` available by importing it from [Prelude.Preliminaries][], which in turn improts from the `Identity-Type` module.  The latter defines `refl` as the following inductive datatype.

<pre class="Agda">

<a id="1275" class="Keyword">module</a> <a id="hide-refl"></a><a id="1282" href="Prelude.Equality.html#1282" class="Module">hide-refl</a> <a id="1292" class="Symbol">{</a><a id="1293" href="Prelude.Equality.html#1293" class="Bound">𝓤</a> <a id="1295" class="Symbol">:</a> <a id="1297" href="Agda.Primitive.html#423" class="Postulate">Universe</a><a id="1305" class="Symbol">}</a> <a id="1307" class="Keyword">where</a>

 <a id="1315" class="Keyword">data</a> <a id="hide-refl._≡_"></a><a id="1320" href="Prelude.Equality.html#1320" class="Datatype Operator">_≡_</a> <a id="1324" class="Symbol">{</a><a id="1325" href="Prelude.Equality.html#1325" class="Bound">𝓤</a><a id="1326" class="Symbol">}</a> <a id="1328" class="Symbol">{</a><a id="1329" href="Prelude.Equality.html#1329" class="Bound">X</a> <a id="1331" class="Symbol">:</a> <a id="1333" href="Prelude.Equality.html#1325" class="Bound">𝓤</a> <a id="1335" href="Universes.html#403" class="Function Operator">̇</a> <a id="1337" class="Symbol">}</a> <a id="1339" class="Symbol">:</a> <a id="1341" href="Prelude.Equality.html#1329" class="Bound">X</a> <a id="1343" class="Symbol">→</a> <a id="1345" href="Prelude.Equality.html#1329" class="Bound">X</a> <a id="1347" class="Symbol">→</a> <a id="1349" href="Prelude.Equality.html#1325" class="Bound">𝓤</a> <a id="1351" href="Universes.html#403" class="Function Operator">̇</a> <a id="1353" class="Keyword">where</a>
  <a id="hide-refl._≡_.refl"></a><a id="1361" href="Prelude.Equality.html#1361" class="InductiveConstructor">refl</a> <a id="1366" class="Symbol">:</a> <a id="1368" class="Symbol">{</a><a id="1369" href="Prelude.Equality.html#1369" class="Bound">x</a> <a id="1371" class="Symbol">:</a> <a id="1373" href="Prelude.Equality.html#1329" class="Bound">X</a><a id="1374" class="Symbol">}</a> <a id="1376" class="Symbol">→</a> <a id="1378" href="Prelude.Equality.html#1369" class="Bound">x</a> <a id="1380" href="Prelude.Equality.html#1320" class="Datatype Operator">≡</a> <a id="1382" href="Prelude.Equality.html#1369" class="Bound">x</a>

</pre>

Let us now formalize the obvious fact that `≡` is an equivalence relation.

First we import the original definitions of `_≡_` and `refl` from the [Type Topology][] library. (The definition given above, inside the `hide-refl` module, was merely for illustration.)

<pre class="Agda">

<a id="1675" class="Keyword">open</a> <a id="1680" class="Keyword">import</a> <a id="1687" href="Identity-Type.html" class="Module">Identity-Type</a> <a id="1701" class="Keyword">renaming</a> <a id="1710" class="Symbol">(</a><a id="1711" href="Identity-Type.html#121" class="Datatype Operator">_≡_</a> <a id="1715" class="Symbol">to</a> <a id="1718" class="Keyword">infix</a> <a id="1724" class="Number">0</a> <a id="_≡_"></a><a id="1726" href="Prelude.Equality.html#1726" class="Datatype Operator">_≡_</a> <a id="1730" class="Symbol">;</a> <a id="1732" href="Identity-Type.html#162" class="InductiveConstructor">refl</a> <a id="1737" class="Symbol">to</a> <a id="refl"></a><a id="1740" href="Prelude.Equality.html#1740" class="InductiveConstructor">𝓇ℯ𝒻𝓁</a><a id="1744" class="Symbol">)</a>
<a id="1746" class="Keyword">pattern</a> <a id="refl"></a><a id="1754" href="Prelude.Equality.html#1754" class="InductiveConstructor">refl</a> <a id="1759" href="Prelude.Equality.html#1773" class="Bound">x</a> <a id="1761" class="Symbol">=</a> <a id="1763" href="Prelude.Equality.html#1740" class="InductiveConstructor">𝓇ℯ𝒻𝓁</a> <a id="1768" class="Symbol">{</a>x <a id="1771" class="Symbol">=</a> <a id="1773" href="Prelude.Equality.html#1773" class="Bound">x</a><a id="1774" class="Symbol">}</a>

<a id="1777" class="Keyword">module</a> <a id="1784" href="Prelude.Equality.html#1784" class="Module">_</a>  <a id="1787" class="Symbol">{</a><a id="1788" href="Prelude.Equality.html#1788" class="Bound">𝓤</a> <a id="1790" class="Symbol">:</a> <a id="1792" href="Agda.Primitive.html#423" class="Postulate">Universe</a><a id="1800" class="Symbol">}{</a><a id="1802" href="Prelude.Equality.html#1802" class="Bound">X</a> <a id="1804" class="Symbol">:</a> <a id="1806" href="Prelude.Equality.html#1788" class="Bound">𝓤</a> <a id="1808" href="Universes.html#403" class="Function Operator">̇</a> <a id="1810" class="Symbol">}</a>  <a id="1813" class="Keyword">where</a>
 <a id="1820" href="Prelude.Equality.html#1820" class="Function">≡-rfl</a> <a id="1826" class="Symbol">:</a> <a id="1828" class="Symbol">(</a><a id="1829" href="Prelude.Equality.html#1829" class="Bound">x</a> <a id="1831" class="Symbol">:</a> <a id="1833" href="Prelude.Equality.html#1802" class="Bound">X</a><a id="1834" class="Symbol">)</a> <a id="1836" class="Symbol">→</a> <a id="1838" href="Prelude.Equality.html#1829" class="Bound">x</a> <a id="1840" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="1842" href="Prelude.Equality.html#1829" class="Bound">x</a>
 <a id="1845" href="Prelude.Equality.html#1820" class="Function">≡-rfl</a> <a id="1851" href="Prelude.Equality.html#1851" class="Bound">x</a> <a id="1853" class="Symbol">=</a> <a id="1855" href="Prelude.Equality.html#1740" class="InductiveConstructor">𝓇ℯ𝒻𝓁</a>

 <a id="1862" href="Prelude.Equality.html#1862" class="Function">≡-sym</a> <a id="1868" class="Symbol">:</a> <a id="1870" class="Symbol">(</a><a id="1871" href="Prelude.Equality.html#1871" class="Bound">x</a> <a id="1873" href="Prelude.Equality.html#1873" class="Bound">y</a> <a id="1875" class="Symbol">:</a> <a id="1877" href="Prelude.Equality.html#1802" class="Bound">X</a><a id="1878" class="Symbol">)</a> <a id="1880" class="Symbol">→</a> <a id="1882" href="Prelude.Equality.html#1871" class="Bound">x</a> <a id="1884" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="1886" href="Prelude.Equality.html#1873" class="Bound">y</a> <a id="1888" class="Symbol">→</a> <a id="1890" href="Prelude.Equality.html#1873" class="Bound">y</a> <a id="1892" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="1894" href="Prelude.Equality.html#1871" class="Bound">x</a>
 <a id="1897" href="Prelude.Equality.html#1862" class="Function">≡-sym</a> <a id="1903" href="Prelude.Equality.html#1903" class="Bound">x</a> <a id="1905" href="Prelude.Equality.html#1905" class="Bound">y</a> <a id="1907" href="Prelude.Equality.html#1740" class="InductiveConstructor">𝓇ℯ𝒻𝓁</a> <a id="1912" class="Symbol">=</a> <a id="1914" href="Prelude.Equality.html#1740" class="InductiveConstructor">𝓇ℯ𝒻𝓁</a>

 <a id="1921" href="Prelude.Equality.html#1921" class="Function">≡-trans</a> <a id="1929" class="Symbol">:</a> <a id="1931" class="Symbol">(</a><a id="1932" href="Prelude.Equality.html#1932" class="Bound">x</a> <a id="1934" href="Prelude.Equality.html#1934" class="Bound">y</a> <a id="1936" href="Prelude.Equality.html#1936" class="Bound">z</a> <a id="1938" class="Symbol">:</a> <a id="1940" href="Prelude.Equality.html#1802" class="Bound">X</a><a id="1941" class="Symbol">)</a> <a id="1943" class="Symbol">→</a> <a id="1945" href="Prelude.Equality.html#1932" class="Bound">x</a> <a id="1947" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="1949" href="Prelude.Equality.html#1934" class="Bound">y</a> <a id="1951" class="Symbol">→</a> <a id="1953" href="Prelude.Equality.html#1934" class="Bound">y</a> <a id="1955" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="1957" href="Prelude.Equality.html#1936" class="Bound">z</a> <a id="1959" class="Symbol">→</a> <a id="1961" href="Prelude.Equality.html#1932" class="Bound">x</a> <a id="1963" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="1965" href="Prelude.Equality.html#1936" class="Bound">z</a>
 <a id="1968" href="Prelude.Equality.html#1921" class="Function">≡-trans</a> <a id="1976" href="Prelude.Equality.html#1976" class="Bound">x</a> <a id="1978" href="Prelude.Equality.html#1978" class="Bound">y</a> <a id="1980" href="Prelude.Equality.html#1980" class="Bound">z</a> <a id="1982" href="Prelude.Equality.html#1740" class="InductiveConstructor">𝓇ℯ𝒻𝓁</a> <a id="1987" href="Prelude.Equality.html#1740" class="InductiveConstructor">𝓇ℯ𝒻𝓁</a> <a id="1992" class="Symbol">=</a> <a id="1994" href="Prelude.Equality.html#1740" class="InductiveConstructor">𝓇ℯ𝒻𝓁</a>

 <a id="2001" href="Prelude.Equality.html#2001" class="Function">≡-Trans</a> <a id="2009" class="Symbol">:</a> <a id="2011" class="Symbol">(</a><a id="2012" href="Prelude.Equality.html#2012" class="Bound">x</a> <a id="2014" class="Symbol">:</a> <a id="2016" href="Prelude.Equality.html#1802" class="Bound">X</a><a id="2017" class="Symbol">){</a><a id="2019" href="Prelude.Equality.html#2019" class="Bound">y</a> <a id="2021" class="Symbol">:</a> <a id="2023" href="Prelude.Equality.html#1802" class="Bound">X</a><a id="2024" class="Symbol">}(</a><a id="2026" href="Prelude.Equality.html#2026" class="Bound">z</a> <a id="2028" class="Symbol">:</a> <a id="2030" href="Prelude.Equality.html#1802" class="Bound">X</a><a id="2031" class="Symbol">)</a> <a id="2033" class="Symbol">→</a> <a id="2035" href="Prelude.Equality.html#2012" class="Bound">x</a> <a id="2037" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="2039" href="Prelude.Equality.html#2019" class="Bound">y</a> <a id="2041" class="Symbol">→</a> <a id="2043" href="Prelude.Equality.html#2019" class="Bound">y</a> <a id="2045" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="2047" href="Prelude.Equality.html#2026" class="Bound">z</a> <a id="2049" class="Symbol">→</a> <a id="2051" href="Prelude.Equality.html#2012" class="Bound">x</a> <a id="2053" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="2055" href="Prelude.Equality.html#2026" class="Bound">z</a>
 <a id="2058" href="Prelude.Equality.html#2001" class="Function">≡-Trans</a> <a id="2066" href="Prelude.Equality.html#2066" class="Bound">x</a> <a id="2068" class="Symbol">{</a><a id="2069" href="Prelude.Equality.html#2069" class="Bound">y</a><a id="2070" class="Symbol">}</a> <a id="2072" href="Prelude.Equality.html#2072" class="Bound">z</a> <a id="2074" href="Prelude.Equality.html#1740" class="InductiveConstructor">𝓇ℯ𝒻𝓁</a> <a id="2079" href="Prelude.Equality.html#1740" class="InductiveConstructor">𝓇ℯ𝒻𝓁</a> <a id="2084" class="Symbol">=</a> <a id="2086" href="Prelude.Equality.html#1740" class="InductiveConstructor">𝓇ℯ𝒻𝓁</a>

</pre>

(The only difference between `≡-trans` and `≡-Trans` is that the second argument to `≡-Trans` is implicit so we can omit it when applying `≡-Trans`.  This is sometimes convenient; after all, `≡-Trans` is used to prove that the first and last arguments are the same, and often we don't care about the middle argument.)

Since we use `refl _` so often, it is convenient to adopt the following shorthand.


#### <a id="functions-preserve-refl">Functions preserve refl</a>

A function is well defined only if it maps equivalent elements to a single element and we often use this nature of functions in Agda proofs.  If we have a function `f : X → Y`, two elements `x x' : X` of the domain, and an identity proof `p : x ≡ x'`, then we obtain a proof of `f x ≡ f x'` by simply applying the `ap` function like so, `ap f p : f x ≡ f x'`.

Escardó defines `ap` in his [Type Topology][] library, and we needn't redefine it here. Instead, we define some variations of `ap` that are sometimes useful.

<pre class="Agda">

<a id="ap-cong"></a><a id="3108" href="Prelude.Equality.html#3108" class="Function">ap-cong</a> <a id="3116" class="Symbol">:</a> <a id="3118" class="Symbol">{</a><a id="3119" href="Prelude.Equality.html#3119" class="Bound">𝓤</a> <a id="3121" href="Prelude.Equality.html#3121" class="Bound">𝓦</a> <a id="3123" class="Symbol">:</a> <a id="3125" href="Agda.Primitive.html#423" class="Postulate">Universe</a><a id="3133" class="Symbol">}{</a><a id="3135" href="Prelude.Equality.html#3135" class="Bound">A</a> <a id="3137" class="Symbol">:</a> <a id="3139" href="Prelude.Equality.html#3119" class="Bound">𝓤</a> <a id="3141" href="Universes.html#403" class="Function Operator">̇</a> <a id="3143" class="Symbol">}{</a><a id="3145" href="Prelude.Equality.html#3145" class="Bound">B</a> <a id="3147" class="Symbol">:</a> <a id="3149" href="Prelude.Equality.html#3121" class="Bound">𝓦</a> <a id="3151" href="Universes.html#403" class="Function Operator">̇</a> <a id="3153" class="Symbol">}{</a><a id="3155" href="Prelude.Equality.html#3155" class="Bound">f</a> <a id="3157" href="Prelude.Equality.html#3157" class="Bound">g</a> <a id="3159" class="Symbol">:</a> <a id="3161" href="Prelude.Equality.html#3135" class="Bound">A</a> <a id="3163" class="Symbol">→</a> <a id="3165" href="Prelude.Equality.html#3145" class="Bound">B</a><a id="3166" class="Symbol">}</a> <a id="3168" class="Symbol">{</a><a id="3169" href="Prelude.Equality.html#3169" class="Bound">a</a> <a id="3171" href="Prelude.Equality.html#3171" class="Bound">b</a> <a id="3173" class="Symbol">:</a> <a id="3175" href="Prelude.Equality.html#3135" class="Bound">A</a><a id="3176" class="Symbol">}</a>
 <a id="3179" class="Symbol">→</a>        <a id="3188" href="Prelude.Equality.html#3155" class="Bound">f</a> <a id="3190" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="3192" href="Prelude.Equality.html#3157" class="Bound">g</a>  <a id="3195" class="Symbol">→</a>  <a id="3198" href="Prelude.Equality.html#3169" class="Bound">a</a> <a id="3200" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="3202" href="Prelude.Equality.html#3171" class="Bound">b</a>
          <a id="3214" class="Comment">---------------</a>
 <a id="3231" class="Symbol">→</a>        <a id="3240" href="Prelude.Equality.html#3155" class="Bound">f</a> <a id="3242" href="Prelude.Equality.html#3169" class="Bound">a</a> <a id="3244" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="3246" href="Prelude.Equality.html#3157" class="Bound">g</a> <a id="3248" href="Prelude.Equality.html#3171" class="Bound">b</a>

<a id="3251" href="Prelude.Equality.html#3108" class="Function">ap-cong</a> <a id="3259" class="Symbol">(</a><a id="3260" href="Prelude.Equality.html#1754" class="InductiveConstructor">refl</a> <a id="3265" class="Symbol">_)</a> <a id="3268" class="Symbol">(</a><a id="3269" href="Prelude.Equality.html#1754" class="InductiveConstructor">refl</a> <a id="3274" class="Symbol">_)</a> <a id="3277" class="Symbol">=</a> <a id="3279" href="Prelude.Equality.html#1754" class="InductiveConstructor">refl</a> <a id="3284" class="Symbol">_</a>

</pre>

We sometimes need a version of this that works for [dependent types][], such as the following (which we borrow from the `Relation/Binary/Core.agda` module of the [Agda Standard Library][], transcribed into MHE/UALib notation of course):

<pre class="Agda">

<a id="cong-app"></a><a id="3551" href="Prelude.Equality.html#3551" class="Function">cong-app</a> <a id="3560" class="Symbol">:</a> <a id="3562" class="Symbol">{</a><a id="3563" href="Prelude.Equality.html#3563" class="Bound">𝓤</a> <a id="3565" href="Prelude.Equality.html#3565" class="Bound">𝓦</a> <a id="3567" class="Symbol">:</a> <a id="3569" href="Agda.Primitive.html#423" class="Postulate">Universe</a><a id="3577" class="Symbol">}</a>
           <a id="3590" class="Symbol">{</a><a id="3591" href="Prelude.Equality.html#3591" class="Bound">A</a> <a id="3593" class="Symbol">:</a> <a id="3595" href="Prelude.Equality.html#3563" class="Bound">𝓤</a> <a id="3597" href="Universes.html#403" class="Function Operator">̇</a><a id="3598" class="Symbol">}</a> <a id="3600" class="Symbol">{</a><a id="3601" href="Prelude.Equality.html#3601" class="Bound">B</a> <a id="3603" class="Symbol">:</a> <a id="3605" href="Prelude.Equality.html#3591" class="Bound">A</a> <a id="3607" class="Symbol">→</a> <a id="3609" href="Prelude.Equality.html#3565" class="Bound">𝓦</a> <a id="3611" href="Universes.html#403" class="Function Operator">̇</a><a id="3612" class="Symbol">}</a>
           <a id="3625" class="Symbol">{</a><a id="3626" href="Prelude.Equality.html#3626" class="Bound">f</a> <a id="3628" href="Prelude.Equality.html#3628" class="Bound">g</a> <a id="3630" class="Symbol">:</a> <a id="3632" class="Symbol">(</a><a id="3633" href="Prelude.Equality.html#3633" class="Bound">a</a> <a id="3635" class="Symbol">:</a> <a id="3637" href="Prelude.Equality.html#3591" class="Bound">A</a><a id="3638" class="Symbol">)</a> <a id="3640" class="Symbol">→</a> <a id="3642" href="Prelude.Equality.html#3601" class="Bound">B</a> <a id="3644" href="Prelude.Equality.html#3633" class="Bound">a</a><a id="3645" class="Symbol">}</a>
 <a id="3648" class="Symbol">→</a>          <a id="3659" href="Prelude.Equality.html#3626" class="Bound">f</a> <a id="3661" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="3663" href="Prelude.Equality.html#3628" class="Bound">g</a>   <a id="3667" class="Symbol">→</a>   <a id="3671" class="Symbol">(</a><a id="3672" href="Prelude.Equality.html#3672" class="Bound">a</a> <a id="3674" class="Symbol">:</a> <a id="3676" href="Prelude.Equality.html#3591" class="Bound">A</a><a id="3677" class="Symbol">)</a>
          <a id="3689" class="Comment">-----------------------</a>
 <a id="3714" class="Symbol">→</a>              <a id="3729" href="Prelude.Equality.html#3626" class="Bound">f</a> <a id="3731" href="Prelude.Equality.html#3672" class="Bound">a</a> <a id="3733" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="3735" href="Prelude.Equality.html#3628" class="Bound">g</a> <a id="3737" href="Prelude.Equality.html#3672" class="Bound">a</a>

<a id="3740" href="Prelude.Equality.html#3551" class="Function">cong-app</a> <a id="3749" class="Symbol">(</a><a id="3750" href="Prelude.Equality.html#1754" class="InductiveConstructor">refl</a> <a id="3755" class="Symbol">_)</a> <a id="3758" href="Prelude.Equality.html#3758" class="Bound">a</a> <a id="3760" class="Symbol">=</a> <a id="3762" href="Prelude.Equality.html#1754" class="InductiveConstructor">refl</a> <a id="3767" class="Symbol">_</a>

</pre>




#### <a id="≡-intro-and-≡-elim-for-nondependent-pairs">≡-intro and ≡-elim for nondependent pairs</a>

We conclude the Equality module with some occasionally useful introduction and elimination rules for the equality relation on (nondependent) pair types.



<pre class="Agda">

<a id="4057" class="Keyword">open</a> <a id="4062" class="Keyword">import</a> <a id="4069" href="MGS-MLTT.html" class="Module">MGS-MLTT</a> <a id="4078" class="Keyword">using</a> <a id="4084" class="Symbol">(</a><a id="4085" href="MGS-MLTT.html#6613" class="Function">ap</a><a id="4087" class="Symbol">)</a> <a id="4089" class="Keyword">public</a>

<a id="≡-elim-left"></a><a id="4097" href="Prelude.Equality.html#4097" class="Function">≡-elim-left</a> <a id="4109" class="Symbol">:</a> <a id="4111" class="Symbol">{</a><a id="4112" href="Prelude.Equality.html#4112" class="Bound">𝓤</a> <a id="4114" href="Prelude.Equality.html#4114" class="Bound">𝓦</a> <a id="4116" class="Symbol">:</a> <a id="4118" href="Agda.Primitive.html#423" class="Postulate">Universe</a><a id="4126" class="Symbol">}</a>
              <a id="4142" class="Symbol">{</a><a id="4143" href="Prelude.Equality.html#4143" class="Bound">A₁</a> <a id="4146" href="Prelude.Equality.html#4146" class="Bound">A₂</a> <a id="4149" class="Symbol">:</a> <a id="4151" href="Prelude.Equality.html#4112" class="Bound">𝓤</a> <a id="4153" href="Universes.html#403" class="Function Operator">̇</a><a id="4154" class="Symbol">}</a> <a id="4156" class="Symbol">{</a><a id="4157" href="Prelude.Equality.html#4157" class="Bound">B₁</a> <a id="4160" href="Prelude.Equality.html#4160" class="Bound">B₂</a> <a id="4163" class="Symbol">:</a> <a id="4165" href="Prelude.Equality.html#4114" class="Bound">𝓦</a> <a id="4167" href="Universes.html#403" class="Function Operator">̇</a><a id="4168" class="Symbol">}</a>
 <a id="4171" class="Symbol">→</a>            <a id="4184" class="Symbol">(</a><a id="4185" href="Prelude.Equality.html#4143" class="Bound">A₁</a> <a id="4188" href="Prelude.Equality.html#463" class="InductiveConstructor Operator">,</a> <a id="4190" href="Prelude.Equality.html#4157" class="Bound">B₁</a><a id="4192" class="Symbol">)</a> <a id="4194" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="4196" class="Symbol">(</a><a id="4197" href="Prelude.Equality.html#4146" class="Bound">A₂</a> <a id="4200" href="Prelude.Equality.html#463" class="InductiveConstructor Operator">,</a> <a id="4202" href="Prelude.Equality.html#4160" class="Bound">B₂</a><a id="4204" class="Symbol">)</a>
              <a id="4220" class="Comment">----------------------</a>
 <a id="4244" class="Symbol">→</a>                   <a id="4264" href="Prelude.Equality.html#4143" class="Bound">A₁</a> <a id="4267" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="4269" href="Prelude.Equality.html#4146" class="Bound">A₂</a>

<a id="4273" href="Prelude.Equality.html#4097" class="Function">≡-elim-left</a> <a id="4285" href="Prelude.Equality.html#4285" class="Bound">e</a> <a id="4287" class="Symbol">=</a> <a id="4289" href="MGS-MLTT.html#6613" class="Function">ap</a> <a id="4292" href="MGS-MLTT.html#2942" class="Function">pr₁</a> <a id="4296" href="Prelude.Equality.html#4285" class="Bound">e</a>


<a id="≡-elim-right"></a><a id="4300" href="Prelude.Equality.html#4300" class="Function">≡-elim-right</a> <a id="4313" class="Symbol">:</a> <a id="4315" class="Symbol">{</a><a id="4316" href="Prelude.Equality.html#4316" class="Bound">𝓤</a> <a id="4318" href="Prelude.Equality.html#4318" class="Bound">𝓦</a> <a id="4320" class="Symbol">:</a> <a id="4322" href="Agda.Primitive.html#423" class="Postulate">Universe</a><a id="4330" class="Symbol">}</a>
               <a id="4347" class="Symbol">{</a><a id="4348" href="Prelude.Equality.html#4348" class="Bound">A₁</a> <a id="4351" href="Prelude.Equality.html#4351" class="Bound">A₂</a> <a id="4354" class="Symbol">:</a> <a id="4356" href="Prelude.Equality.html#4316" class="Bound">𝓤</a> <a id="4358" href="Universes.html#403" class="Function Operator">̇</a><a id="4359" class="Symbol">}{</a><a id="4361" href="Prelude.Equality.html#4361" class="Bound">B₁</a> <a id="4364" href="Prelude.Equality.html#4364" class="Bound">B₂</a> <a id="4367" class="Symbol">:</a> <a id="4369" href="Prelude.Equality.html#4318" class="Bound">𝓦</a> <a id="4371" href="Universes.html#403" class="Function Operator">̇</a><a id="4372" class="Symbol">}</a>
 <a id="4375" class="Symbol">→</a>             <a id="4389" class="Symbol">(</a><a id="4390" href="Prelude.Equality.html#4348" class="Bound">A₁</a> <a id="4393" href="Prelude.Equality.html#463" class="InductiveConstructor Operator">,</a> <a id="4395" href="Prelude.Equality.html#4361" class="Bound">B₁</a><a id="4397" class="Symbol">)</a> <a id="4399" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="4401" class="Symbol">(</a><a id="4402" href="Prelude.Equality.html#4351" class="Bound">A₂</a> <a id="4405" href="Prelude.Equality.html#463" class="InductiveConstructor Operator">,</a> <a id="4407" href="Prelude.Equality.html#4364" class="Bound">B₂</a><a id="4409" class="Symbol">)</a>
               <a id="4426" class="Comment">-----------------------</a>
 <a id="4451" class="Symbol">→</a>                    <a id="4472" href="Prelude.Equality.html#4361" class="Bound">B₁</a> <a id="4475" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="4477" href="Prelude.Equality.html#4364" class="Bound">B₂</a>

<a id="4481" href="Prelude.Equality.html#4300" class="Function">≡-elim-right</a> <a id="4494" href="Prelude.Equality.html#4494" class="Bound">e</a> <a id="4496" class="Symbol">=</a> <a id="4498" href="MGS-MLTT.html#6613" class="Function">ap</a> <a id="4501" href="MGS-MLTT.html#3001" class="Function">pr₂</a> <a id="4505" href="Prelude.Equality.html#4494" class="Bound">e</a>


<a id="≡-×-intro"></a><a id="4509" href="Prelude.Equality.html#4509" class="Function">≡-×-intro</a> <a id="4519" class="Symbol">:</a> <a id="4521" class="Symbol">{</a><a id="4522" href="Prelude.Equality.html#4522" class="Bound">𝓤</a> <a id="4524" href="Prelude.Equality.html#4524" class="Bound">𝓦</a> <a id="4526" class="Symbol">:</a> <a id="4528" href="Agda.Primitive.html#423" class="Postulate">Universe</a><a id="4536" class="Symbol">}</a>
            <a id="4550" class="Symbol">{</a><a id="4551" href="Prelude.Equality.html#4551" class="Bound">A₁</a> <a id="4554" href="Prelude.Equality.html#4554" class="Bound">A₂</a> <a id="4557" class="Symbol">:</a> <a id="4559" href="Prelude.Equality.html#4522" class="Bound">𝓤</a> <a id="4561" href="Universes.html#403" class="Function Operator">̇</a><a id="4562" class="Symbol">}</a> <a id="4564" class="Symbol">{</a><a id="4565" href="Prelude.Equality.html#4565" class="Bound">B₁</a> <a id="4568" href="Prelude.Equality.html#4568" class="Bound">B₂</a> <a id="4571" class="Symbol">:</a> <a id="4573" href="Prelude.Equality.html#4524" class="Bound">𝓦</a> <a id="4575" href="Universes.html#403" class="Function Operator">̇</a><a id="4576" class="Symbol">}</a>
 <a id="4579" class="Symbol">→</a>           <a id="4591" href="Prelude.Equality.html#4551" class="Bound">A₁</a> <a id="4594" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="4596" href="Prelude.Equality.html#4554" class="Bound">A₂</a>  <a id="4600" class="Symbol">→</a>  <a id="4603" href="Prelude.Equality.html#4565" class="Bound">B₁</a> <a id="4606" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="4608" href="Prelude.Equality.html#4568" class="Bound">B₂</a>
           <a id="4622" class="Comment">------------------------</a>
 <a id="4648" class="Symbol">→</a>          <a id="4659" class="Symbol">(</a><a id="4660" href="Prelude.Equality.html#4551" class="Bound">A₁</a> <a id="4663" href="Prelude.Equality.html#463" class="InductiveConstructor Operator">,</a> <a id="4665" href="Prelude.Equality.html#4565" class="Bound">B₁</a><a id="4667" class="Symbol">)</a> <a id="4669" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="4671" class="Symbol">(</a><a id="4672" href="Prelude.Equality.html#4554" class="Bound">A₂</a> <a id="4675" href="Prelude.Equality.html#463" class="InductiveConstructor Operator">,</a> <a id="4677" href="Prelude.Equality.html#4568" class="Bound">B₂</a><a id="4679" class="Symbol">)</a>

<a id="4682" href="Prelude.Equality.html#4509" class="Function">≡-×-intro</a> <a id="4692" class="Symbol">(</a><a id="4693" href="Prelude.Equality.html#1754" class="InductiveConstructor">refl</a> <a id="4698" class="Symbol">_</a> <a id="4700" class="Symbol">)</a> <a id="4702" class="Symbol">(</a><a id="4703" href="Prelude.Equality.html#1754" class="InductiveConstructor">refl</a> <a id="4708" class="Symbol">_</a> <a id="4710" class="Symbol">)</a> <a id="4712" class="Symbol">=</a> <a id="4714" class="Symbol">(</a><a id="4715" href="Prelude.Equality.html#1754" class="InductiveConstructor">refl</a> <a id="4720" class="Symbol">_</a> <a id="4722" class="Symbol">)</a>


<a id="≡-×-int"></a><a id="4726" href="Prelude.Equality.html#4726" class="Function">≡-×-int</a> <a id="4734" class="Symbol">:</a> <a id="4736" class="Symbol">{</a><a id="4737" href="Prelude.Equality.html#4737" class="Bound">𝓤</a> <a id="4739" href="Prelude.Equality.html#4739" class="Bound">𝓦</a> <a id="4741" class="Symbol">:</a> <a id="4743" href="Agda.Primitive.html#423" class="Postulate">Universe</a><a id="4751" class="Symbol">}</a>
          <a id="4763" class="Symbol">{</a><a id="4764" href="Prelude.Equality.html#4764" class="Bound">A</a> <a id="4766" class="Symbol">:</a> <a id="4768" href="Prelude.Equality.html#4737" class="Bound">𝓤</a> <a id="4770" href="Universes.html#403" class="Function Operator">̇</a><a id="4771" class="Symbol">}</a> <a id="4773" class="Symbol">{</a><a id="4774" href="Prelude.Equality.html#4774" class="Bound">B</a> <a id="4776" class="Symbol">:</a> <a id="4778" href="Prelude.Equality.html#4739" class="Bound">𝓦</a> <a id="4780" href="Universes.html#403" class="Function Operator">̇</a><a id="4781" class="Symbol">}</a>
          <a id="4793" class="Symbol">(</a><a id="4794" href="Prelude.Equality.html#4794" class="Bound">a</a> <a id="4796" href="Prelude.Equality.html#4796" class="Bound">a&#39;</a> <a id="4799" class="Symbol">:</a> <a id="4801" href="Prelude.Equality.html#4764" class="Bound">A</a><a id="4802" class="Symbol">)(</a><a id="4804" href="Prelude.Equality.html#4804" class="Bound">b</a> <a id="4806" href="Prelude.Equality.html#4806" class="Bound">b&#39;</a> <a id="4809" class="Symbol">:</a> <a id="4811" href="Prelude.Equality.html#4774" class="Bound">B</a><a id="4812" class="Symbol">)</a>
 <a id="4815" class="Symbol">→</a>         <a id="4825" href="Prelude.Equality.html#4794" class="Bound">a</a> <a id="4827" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="4829" href="Prelude.Equality.html#4796" class="Bound">a&#39;</a>  <a id="4833" class="Symbol">→</a>  <a id="4836" href="Prelude.Equality.html#4804" class="Bound">b</a> <a id="4838" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="4840" href="Prelude.Equality.html#4806" class="Bound">b&#39;</a>
          <a id="4853" class="Comment">------------------------</a>
 <a id="4879" class="Symbol">→</a>         <a id="4889" class="Symbol">(</a><a id="4890" href="Prelude.Equality.html#4794" class="Bound">a</a> <a id="4892" href="Prelude.Equality.html#463" class="InductiveConstructor Operator">,</a> <a id="4894" href="Prelude.Equality.html#4804" class="Bound">b</a><a id="4895" class="Symbol">)</a> <a id="4897" href="Prelude.Equality.html#1726" class="Datatype Operator">≡</a> <a id="4899" class="Symbol">(</a><a id="4900" href="Prelude.Equality.html#4796" class="Bound">a&#39;</a> <a id="4903" href="Prelude.Equality.html#463" class="InductiveConstructor Operator">,</a> <a id="4905" href="Prelude.Equality.html#4806" class="Bound">b&#39;</a><a id="4907" class="Symbol">)</a>

<a id="4910" href="Prelude.Equality.html#4726" class="Function">≡-×-int</a> <a id="4918" href="Prelude.Equality.html#4918" class="Bound">a</a> <a id="4920" href="Prelude.Equality.html#4920" class="Bound">a&#39;</a> <a id="4923" href="Prelude.Equality.html#4923" class="Bound">b</a> <a id="4925" href="Prelude.Equality.html#4925" class="Bound">b&#39;</a> <a id="4928" class="Symbol">(</a><a id="4929" href="Prelude.Equality.html#1754" class="InductiveConstructor">refl</a> <a id="4934" class="Symbol">_</a> <a id="4936" class="Symbol">)</a> <a id="4938" class="Symbol">(</a><a id="4939" href="Prelude.Equality.html#1754" class="InductiveConstructor">refl</a> <a id="4944" class="Symbol">_</a> <a id="4946" class="Symbol">)</a> <a id="4948" class="Symbol">=</a> <a id="4950" class="Symbol">(</a><a id="4951" href="Prelude.Equality.html#1754" class="InductiveConstructor">refl</a> <a id="4956" class="Symbol">_</a> <a id="4958" class="Symbol">)</a>
</pre>

-------------------------------------

[← Prelude.Preliminaries ](Prelude.Preliminaries.html)
<span style="float:right;">[Prelude.Inverses →](Prelude.Inverses.html)</span>

{% include UALib.Links.md %}