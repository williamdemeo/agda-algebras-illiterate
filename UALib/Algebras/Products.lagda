---
layout: default
title : UALib.Algebras.Products module (Agda Universal Algebra Library)
date : 2021-01-12
author: William DeMeo
---


### <a id="product-algebras">Product Algebras</a>

This section presents the [UALib.Algebras.Products][] module of the [Agda Universal Algebra Library][].

Notice that we begin this module by assuming a signature `𝑆 : Signature 𝓞 𝓥` which is then present and available throughout the module.

**NOTATION**.  From now on, the remaining modules of the [UALib][] will assume universes 𝓞 and 𝓥, and a fixed signature type `𝑆 : Signature 𝓞 𝓥`.

\begin{code}

{-# OPTIONS --without-K --exact-split --safe #-}

open import UALib.Algebras.Signatures using (Signature; 𝓞; 𝓥)

module UALib.Algebras.Products {𝑆 : Signature 𝓞 𝓥} where

open import UALib.Algebras.Algebras hiding (𝓞; 𝓥) public

\end{code}

The product of 𝑆-algebras for the Sigma type representation is defined as follows.

\begin{code}

⨅ : {𝓤 𝓘 : Universe}{I : 𝓘 ̇ }(𝒜 : I → Algebra 𝓤 𝑆 ) → Algebra (𝓘 ⊔ 𝓤) 𝑆

⨅ 𝒜 = (∀ i → ∣ 𝒜 i ∣) ,                -- domain of the product algebra

       λ 𝑓 𝑎 i → (𝑓 ̂ 𝒜 i) λ x → 𝑎 x i  -- basic operations of the product algebra

\end{code}

Other modules of the [UALib][] will use the foregoing product type exclusively.  However, for completeness, we now demonstrate how one would construct product algebras when the factors are defined using records.

\begin{code}

open algebra

-- product for algebras of record type
⨅' : {𝓤 𝓘 : Universe}{I : 𝓘 ̇ }(𝒜 : I → algebra 𝓤 𝑆) → algebra (𝓘 ⊔ 𝓤) 𝑆

⨅' 𝒜 = record { univ = ∀ i → univ (𝒜 i)               -- domain
               ; op = λ 𝑓 𝑎 i → (op (𝒜 i)) 𝑓 λ x → 𝑎 x i -- basic operations
               }

\end{code}



#### <a id="notation">Notation</a>

Before proceeding, we define some convenient syntactic sugar. The type `Algebra 𝓤 𝑆` itself has a type; it is `(𝓞 ⊔ 𝓥 ⊔ 𝓤 ⁺) ̇` &nbsp;. This type appears quite often throughout the [UALib][], so it is worthwhile to define the following shorthand for its universe level.

\begin{code}

ov : Universe → Universe
ov 𝓤 = 𝓞 ⊔ 𝓥 ⊔ 𝓤 ⁺

\end{code}



#### <a id="products-of-classes-of-algebras">Products of classes of algebras</a>

Later we will formally state and prove that, given an arbitrary class 𝒦 of algebras, the product of all subalgebras of algebras in the class belongs to SP(𝒦) (subalgebras of products of algebras in 𝒦). That is, ⨅ S(𝒦) ∈ SP(𝒦 ). This turns out to be a nontrivial exercise. In fact, it is not immediately obvious (at least to this author) how one should express the product of an entire class of algebras as a dependent type. After a number of failed attempts, the right type revealed itself in the form of the `class-product` whose construction is the main goal of this section.

First, we need a type that will serve to index the class, as well as the product of its members.

\begin{code}
module _ {𝓤 𝓧 : Universe}{X : 𝓧 ̇} where

 ℑ : Pred (Algebra 𝓤 𝑆)(ov 𝓤) → (𝓧 ⊔ ov 𝓤) ̇

 ℑ 𝒦 = Σ 𝑨 ꞉ (Algebra 𝓤 𝑆) , (𝑨 ∈ 𝒦) × (X → ∣ 𝑨 ∣)

\end{code}

Notice that the second component of this dependent pair type is `(𝑨 ∈ 𝒦) × (X → ∣ 𝑨 ∣)`.  In previous versions of the [UALib][] this second component was simply `𝑨 ∈ 𝒦`.  However, we realized that adding a mapping of type `X → ∣ 𝑨 ∣` is quite useful.  The reason for this will become clear later; for now, suffice it to say that a map X → ∣ 𝑨 ∣ may be viewed as a context and we want to keep the context completely general.  Including this context map in the index type ℑ accomplishes this.

Taking the product over the index type ℑ requires a function that takes an index `i : ℑ` and returns the corresponding algebra.  Each `i : ℑ` is a triple, say, `(𝑨 , p , h)`, where `𝑨 : Algebra 𝓤 𝑆`, `p : 𝑨 ∈ 𝒦`, and `h : X → ∣ 𝑨 ∣`, so the function mapping an index to the corresponding algebra is simply the first projection.

\begin{code}

 𝔄 : (𝒦 : Pred (Algebra 𝓤 𝑆)(ov 𝓤)) → ℑ 𝒦 → Algebra 𝓤 𝑆

 𝔄 𝒦 = λ (i : (ℑ 𝒦)) → ∣ i ∣

\end{code}

Finally, we define `class-product` which represents the product of all members of 𝒦.

\begin{code}

 class-product : Pred (Algebra 𝓤 𝑆)(ov 𝓤) → Algebra (𝓧 ⊔ ov 𝓤) 𝑆

 class-product 𝒦 = ⨅ ( 𝔄 𝒦 )

\end{code}

Alternatively, we could have defined the class product in a way that explicitly displays the index, like so.

\begin{code}

 class-product' : Pred (Algebra 𝓤 𝑆)(ov 𝓤) → Algebra (𝓧 ⊔ ov 𝓤) 𝑆

 class-product' 𝒦 = ⨅ λ (i : (Σ 𝑨 ꞉ (Algebra 𝓤 𝑆) , (𝑨 ∈ 𝒦) × (X → ∣ 𝑨 ∣))) → ∣ i ∣

\end{code}

If `p : 𝑨 ∈ 𝒦` and `h : X → ∣ 𝑨 ∣`, then we can think of the triple `(𝑨 , p , h) ∈ ℑ 𝒦` as an index over the class, and so we can think of `𝔄 (𝑨 , p , h)` (which is simply `𝑨`) as the projection of the product `⨅ ( 𝔄 𝒦 )` onto the `(𝑨 , p, h)`-th component.





-----------------------

[← UALib.Algebras.Algebras](UALib.Algebras.Algebras.html)
<span style="float:right;">[UALib.Algebras.Congruences →](UALib.Algebras.Congruences.html)</span>

{% include UALib.Links.md %}
