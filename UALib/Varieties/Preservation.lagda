---
layout: default
title : UALib.Varieties.Preservation (The Agda Universal Algebra Library)
date : 2021-01-14
author: William DeMeo
---

[UALib.Varieties ↑](UALib.Varieties.html)

### <a id="Equation preservation">Equation preservation</a>

This section presents the [UALib.Varieties.Preservation][] module of the [Agda Universal Algebra Library][].

In this module we show that identities are preserved by closure operators H, S, and P.  This will establish the easy direction of Birkhoff's HSP Theorem.

\begin{code}

{-# OPTIONS --without-K --exact-split --safe #-}

open import UALib.Algebras using (Signature; 𝓞; 𝓥; Algebra; _↠_)
open import UALib.Prelude.Preliminaries using (global-dfunext; Universe; _̇)


module UALib.Varieties.Preservation
 {𝑆 : Signature 𝓞 𝓥}{gfe : global-dfunext}
 {𝕏 : {𝓤 𝓧 : Universe}{X : 𝓧 ̇ }(𝑨 : Algebra 𝓤 𝑆) → X ↠ 𝑨}
 where


open import UALib.Varieties.Varieties {𝑆 = 𝑆}{gfe}{𝕏} public

\end{code}


#### H preserves identities

\begin{code}

--H preserves identities
H-id1 : {𝓤 𝓧 : Universe}{X : 𝓧 ̇}
        {𝒦 : Pred (Algebra 𝓤 𝑆)(OV 𝓤)}
        (p q : Term{𝓧}{X})
       ----------------------------------------
 →       (𝒦 ⊧ p ≋ q) → (H{𝓤}{𝓤} 𝒦 ⊧ p ≋ q)

H-id1 p q α (hbase x) = lift-alg-⊧ _ p q (α x)

H-id1 {𝓤} p q α (hlift{𝑨} x) = γ
 where
  β : 𝑨 ⊧ p ≈ q
  β = H-id1 p q α x
  γ : lift-alg 𝑨 𝓤 ⊧ p ≈ q
  γ = lift-alg-⊧ _ p q β

H-id1 p q α (hhimg{𝑨}{𝑪} HA ((𝑩 , ϕ , (ϕhom , ϕsur)) , B≅C) ) = ⊧-≅ p q γ B≅C
 where
  β : 𝑨 ⊧ p ≈ q
  β = (H-id1 p q α) HA

  preim : ∀ 𝒃 x → ∣ 𝑨 ∣
  preim 𝒃 x = (Inv ϕ (𝒃 x) (ϕsur (𝒃 x)))

  ζ : ∀ 𝒃 → ϕ ∘ (preim 𝒃) ≡ 𝒃
  ζ 𝒃 = gfe λ x → InvIsInv ϕ (𝒃 x) (ϕsur (𝒃 x))

  γ : (p ̇ 𝑩) ≡ (q ̇ 𝑩)
  γ = gfe λ 𝒃 →
   (p ̇ 𝑩) 𝒃               ≡⟨ (ap (p ̇ 𝑩) (ζ 𝒃))⁻¹ ⟩
   (p ̇ 𝑩) (ϕ ∘ (preim 𝒃)) ≡⟨ (comm-hom-term gfe 𝑨 𝑩 (ϕ , ϕhom) p (preim 𝒃))⁻¹ ⟩
   ϕ((p ̇ 𝑨)(preim 𝒃))     ≡⟨ ap ϕ (intensionality β (preim 𝒃)) ⟩
   ϕ((q ̇ 𝑨)(preim 𝒃))     ≡⟨ comm-hom-term gfe 𝑨 𝑩 (ϕ , ϕhom) q (preim 𝒃) ⟩
   (q ̇ 𝑩)(ϕ ∘ (preim 𝒃))  ≡⟨ ap (q ̇ 𝑩) (ζ 𝒃) ⟩
   (q ̇ 𝑩) 𝒃               ∎

H-id1 p q α (hiso{𝑨}{𝑩} x x₁) = ⊧-transport p q (H-id1 p q α x) x₁

\end{code}

The converse is almost too obvious to bother with. Nonetheless, we formalize it for completeness.

\begin{code}

H-id2 : {𝓤 𝓦 𝓧 : Universe}{X : 𝓧 ̇}{𝒦 : Pred (Algebra 𝓤 𝑆)(OV 𝓤)}
           {p q : Term{𝓧}{X}} → (H{𝓤}{𝓦} 𝒦 ⊧ p ≋ q) → (𝒦 ⊧ p ≋ q)
H-id2 {𝓤}{𝓦}{𝓧}{X} {𝒦} {p}{q} Hpq {𝑨} KA = γ
 where
  lA : Algebra (𝓤 ⊔ 𝓦) 𝑆
  lA = lift-alg 𝑨 𝓦

  plA : lA ∈ H{𝓤}{𝓦} 𝒦
  plA = hbase KA

  ξ : lA ⊧ p ≈ q
  ξ = Hpq plA
  γ : 𝑨 ⊧ p ≈ q
  γ = lower-alg-⊧ 𝑨 p q ξ

\end{code}

#### S preserves identities

\begin{code}

S-id1 : {𝓤 𝓧 : Universe}{X : 𝓧 ̇}
        (𝒦 : Pred (Algebra 𝓤 𝑆)(OV 𝓤))
        (p q : Term{𝓧}{X})
       -------------------------------------
 →      (𝒦 ⊧ p ≋ q) → (S{𝓤}{𝓤} 𝒦 ⊧ p ≋ q)

S-id1 _ p q α (sbase x) = lift-alg-⊧ _ p q (α x)

S-id1 𝒦 p q α (slift x) = lift-alg-⊧ _ p q ((S-id1 𝒦 p q α) x)

S-id1 𝒦 p q α (ssub{𝑨}{𝑩} sA B≤A) =
 S-⊧ p q ((𝑩 , 𝑨 , (𝑩 , B≤A) , inj₂ 𝓇ℯ𝒻𝓁 , id≅)) γ
  where --Apply S-⊧ to the class 𝒦 ∪ ｛ 𝑨 ｝
   β : 𝑨 ⊧ p ≈ q
   β = S-id1 𝒦 p q α sA

   Apq : ｛ 𝑨 ｝ ⊧ p ≋ q
   Apq (refl _) = β

   γ : (𝒦 ∪ ｛ 𝑨 ｝) ⊧ p ≋ q
   γ {𝑩} (inj₁ x) = α x
   γ {𝑩} (inj₂ y) = Apq y

S-id1 𝒦 p q α (ssubw{𝑨}{𝑩} sA B≤A) =
 S-⊧ p q ((𝑩 , 𝑨 , (𝑩 , B≤A) , inj₂ 𝓇ℯ𝒻𝓁 , id≅) ) γ
  where  --Apply S-⊧ to the class 𝒦 ∪ ｛ 𝑨 ｝
   β : 𝑨 ⊧ p ≈ q
   β = S-id1 𝒦 p q α sA

   Apq : ｛ 𝑨 ｝ ⊧ p ≋ q
   Apq (refl _) = β

   γ : (𝒦 ∪ ｛ 𝑨 ｝) ⊧ p ≋ q
   γ {𝑩} (inj₁ x) = α x
   γ {𝑩} (inj₂ y) = Apq y

S-id1 𝒦 p q α (siso{𝑨}{𝑩} x x₁) = γ
 where
  ζ : 𝑨 ⊧ p ≈ q
  ζ = S-id1 𝒦 p q α x
  γ : 𝑩 ⊧ p ≈ q
  γ = ⊧-transport p q ζ x₁

\end{code}

Again, the obvious converse is barely worth the bits needed to formalize it.

\begin{code}
S-id2 : {𝓤 𝓦 𝓧 : Universe}{X : 𝓧 ̇}{𝒦 : Pred (Algebra 𝓤 𝑆)(OV 𝓤)}
           {p q : Term{𝓧}{X}} → (S{𝓤}{𝓦} 𝒦 ⊧ p ≋ q) → (𝒦 ⊧ p ≋ q)
S-id2 {𝓤}{𝓦}{𝓧}{X} {𝒦} {p}{q} Spq {𝑨} KA = γ
 where
  lA : Algebra (𝓤 ⊔ 𝓦) 𝑆
  lA = lift-alg 𝑨 𝓦

  plA : lA ∈ S{𝓤}{𝓦} 𝒦
  plA = sbase KA

  ξ : lA ⊧ p ≈ q
  ξ = Spq plA
  γ : 𝑨 ⊧ p ≈ q
  γ = lower-alg-⊧ 𝑨 p q ξ
\end{code}

#### P preserves identities

\begin{code}
P-id1 : {𝓤 𝓧 : Universe}{X : 𝓧 ̇}
        {𝒦 : Pred (Algebra 𝓤 𝑆)(OV 𝓤)}
        (p q : Term{𝓧}{X})
       ------------------------------------
 →      (𝒦 ⊧ p ≋ q) → (P{𝓤}{𝓤} 𝒦 ⊧ p ≋ q)

P-id1 p q α (pbase x) = lift-alg-⊧ _ p q (α x)
P-id1 p q α (pliftu x) = lift-alg-⊧ _ p q ((P-id1 p q α) x)
P-id1 p q α (pliftw x) = lift-alg-⊧ _ p q ((P-id1 p q α) x)
P-id1 {𝓤} {𝓧} p q α (produ{I}{𝒜} x) = γ
 where
  lA : I → Algebra 𝓤 𝑆
  lA i = (lift-alg (𝒜 i) 𝓤)

  IH : (i : I) → (p ̇ (lA i)) ≡ (q ̇ (lA i))
  IH i = lift-alg-⊧ (𝒜 i) p q ((P-id1 p q α) (x i))

  γ : p ̇ (⨅ 𝒜) ≡ q ̇ (⨅ 𝒜)
  γ = lift-products-preserve-ids p q I 𝒜 IH

P-id1{𝓤} p q α (prodw{I}{𝒜} x) = γ
 where
  lA : I → Algebra 𝓤 𝑆
  lA i = (lift-alg (𝒜 i) 𝓤)

  IH : (i : I) → (p ̇ (lA i)) ≡ (q ̇ (lA i))
  IH i = lift-alg-⊧ (𝒜 i) p q ((P-id1 p q α) (x i))

  γ : p ̇ (⨅ 𝒜) ≡ q ̇ (⨅ 𝒜)
  γ = lift-products-preserve-ids p q I 𝒜 IH

P-id1 p q α (pisou{𝑨}{𝑩} x x₁) = γ
 where
  γ : 𝑩 ⊧ p ≈ q
  γ = ⊧-transport p q (P-id1 p q α x) x₁

P-id1 p q α (pisow{𝑨}{𝑩} x x₁) = ⊧-transport p q ζ x₁
 where
  ζ : 𝑨 ⊧ p ≈ q
  ζ = P-id1 p q α x

\end{code}

...and conversely...

\begin{code}

P-id2 : {𝓤 𝓦 𝓧 : Universe}{X : 𝓧 ̇}
        (𝒦 : Pred (Algebra 𝓤 𝑆)(OV 𝓤))
        {p q : Term{𝓧}{X}}
        --------------------------------------
 →      ((P{𝓤}{𝓦} 𝒦) ⊧ p ≋ q ) → (𝒦 ⊧ p ≋ q)

P-id2 {𝓤}{𝓦} 𝒦 {p}{q} PKpq {𝑨} KA = γ
 where
  lA : Algebra (𝓤 ⊔ 𝓦) 𝑆
  lA = lift-alg 𝑨 𝓦

  plA : lA ∈ P{𝓤}{𝓦} 𝒦
  plA = pbase KA

  ξ : lA ⊧ p ≈ q
  ξ = PKpq plA
  γ : 𝑨 ⊧ p ≈ q
  γ = lower-alg-⊧ 𝑨 p q ξ

\end{code}

#### V preserves identities

\begin{code}

-- V preserves identities

V-id1 : {𝓤 𝓧 : Universe}{X : 𝓧 ̇}{𝒦 : Pred (Algebra 𝓤 𝑆)(OV 𝓤)}
           (p q : Term{𝓧}{X}) → (𝒦 ⊧ p ≋ q) → (V{𝓤}{𝓤} 𝒦 ⊧ p ≋ q)
V-id1 p q α (vbase x) = lift-alg-⊧ _ p q (α x)
V-id1 {𝓤}{𝓧}{X}{𝒦} p q α (vlift{𝑨} x) = γ
 where
  β : 𝑨 ⊧ p ≈ q
  β = (V-id1 p q α) x
  γ : lift-alg 𝑨 𝓤 ⊧ p ≈ q
  γ = lift-alg-⊧ 𝑨 p q β
V-id1 {𝓤}{𝓧}{X}{𝒦} p q α (vliftw{𝑨} x) = γ
 where
  β : 𝑨 ⊧ p ≈ q
  β = (V-id1 p q α) x
  γ : lift-alg 𝑨 𝓤 ⊧ p ≈ q
  γ = lift-alg-⊧ 𝑨 p q β
V-id1 p q α (vhimg{𝑨}{𝑪} VA ((𝑩 , ϕ , (ϕh , ϕE)) , B≅C)) = ⊧-≅ p q γ B≅C
 where
  IH : 𝑨 ⊧ p ≈ q
  IH = V-id1 p q α VA

  preim : ∀ 𝒃 x → ∣ 𝑨 ∣
  preim 𝒃 x = (Inv ϕ (𝒃 x) (ϕE (𝒃 x)))

  ζ : ∀ 𝒃 → ϕ ∘ (preim 𝒃) ≡ 𝒃 -- (𝒃 :  → ∣ 𝑩 ∣)(x : X) 
  ζ 𝒃 = gfe λ x → InvIsInv ϕ (𝒃 x) (ϕE (𝒃 x))

  γ : (p ̇ 𝑩) ≡ (q ̇ 𝑩)
  γ = gfe λ 𝒃 →
   (p ̇ 𝑩) 𝒃               ≡⟨ (ap (p ̇ 𝑩) (ζ 𝒃))⁻¹ ⟩
   (p ̇ 𝑩) (ϕ ∘ (preim 𝒃)) ≡⟨ (comm-hom-term gfe 𝑨 𝑩 (ϕ , ϕh) p (preim 𝒃))⁻¹ ⟩
   ϕ((p ̇ 𝑨)(preim 𝒃))     ≡⟨ ap ϕ (intensionality IH (preim 𝒃)) ⟩
   ϕ((q ̇ 𝑨)(preim 𝒃))     ≡⟨ comm-hom-term gfe 𝑨 𝑩 (ϕ , ϕh) q (preim 𝒃) ⟩
   (q ̇ 𝑩)(ϕ ∘ (preim 𝒃))   ≡⟨ ap (q ̇ 𝑩) (ζ 𝒃) ⟩
   (q ̇ 𝑩) 𝒃                ∎

V-id1{𝓤}{𝓧}{X}{𝒦} p q α ( vssub {𝑨}{𝑩} VA B≤A ) =
 S-⊧ p q ((𝑩 , 𝑨 , (𝑩 , B≤A) , inj₂ 𝓇ℯ𝒻𝓁 , id≅) ) γ
  where
   IH : 𝑨 ⊧ p ≈ q
   IH = V-id1 {𝓤}{𝓧}{X}p q α VA

   Asinglepq : ｛ 𝑨 ｝ ⊧ p ≋ q
   Asinglepq (refl _) = IH

   γ : (𝒦 ∪ ｛ 𝑨 ｝) ⊧ p ≋ q
   γ {𝑩} (inj₁ x) = α x
   γ {𝑩} (inj₂ y) = Asinglepq y

V-id1{𝓤}{𝓧}{X}{𝒦} p q α ( vssubw {𝑨}{𝑩} VA B≤A ) =
 S-⊧ p q ((𝑩 , 𝑨 , (𝑩 , B≤A) , inj₂ 𝓇ℯ𝒻𝓁 , id≅) ) γ
  where
   IH : 𝑨 ⊧ p ≈ q
   IH = V-id1 {𝓤}{𝓧}{X}p q α VA

   Asinglepq : ｛ 𝑨 ｝ ⊧ p ≋ q
   Asinglepq (refl _) = IH

   γ : (𝒦 ∪ ｛ 𝑨 ｝) ⊧ p ≋ q
   γ {𝑩} (inj₁ x) = α x
   γ {𝑩} (inj₂ y) = Asinglepq y

V-id1 {𝓤}{𝓧}{X} p q α (vprodu{I}{𝒜} V𝒜) = γ
 where
  IH : (i : I) → 𝒜 i ⊧ p ≈ q
  IH i = V-id1{𝓤}{𝓧}{X} p q α (V𝒜 i)

  γ : p ̇ (⨅ 𝒜)  ≡ q ̇ (⨅ 𝒜)
  γ = product-id-compatibility p q I 𝒜 IH

V-id1 {𝓤}{𝓧}{X} p q α (vprodw{I}{𝒜} V𝒜) = γ
 where
  IH : (i : I) → 𝒜 i ⊧ p ≈ q
  IH i = V-id1{𝓤}{𝓧}{X} p q α (V𝒜 i)

  γ : p ̇ (⨅ 𝒜)  ≡ q ̇ (⨅ 𝒜)
  γ = product-id-compatibility p q I 𝒜 IH
V-id1 p q α (visou{𝑨}{𝑩} VA A≅B) = ⊧-≅ p q (V-id1 p q α VA) A≅B
V-id1 p q α (visow{𝑨}{𝑩} VA A≅B) = ⊧-≅ p q (V-id1 p q α VA) A≅B

\end{code}

Once again, and for the last time, completeness dictates that we formalize the coverse, however obvious it may be.

\begin{code}

V-id2 : {𝓤 𝓦 𝓧 : Universe}{X : 𝓧 ̇}{𝒦 : Pred (Algebra 𝓤 𝑆)(OV 𝓤)}
           {p q : Term{𝓧}{X}} → (V{𝓤}{𝓦} 𝒦 ⊧ p ≋ q) → (𝒦 ⊧ p ≋ q)
V-id2 {𝓤}{𝓦}{𝓧}{X} {𝒦} {p}{q} Vpq {𝑨} KA = γ
 where
  lA : Algebra (𝓤 ⊔ 𝓦) 𝑆
  lA = lift-alg 𝑨 𝓦

  vlA : lA ∈ V{𝓤}{𝓦} 𝒦
  vlA = vbase KA

  ξ : lA ⊧ p ≈ q
  ξ = Vpq vlA
  γ : 𝑨 ⊧ p ≈ q
  γ = lower-alg-⊧ 𝑨 p q ξ

\end{code}

#### Class identities

It follows from `V-id1` that, if 𝒦 is a class of structures, the set of identities modeled by all structures in 𝒦 is the same as the set of identities modeled by all structures in V 𝒦.

\begin{code}

-- Th (V 𝒦) is precisely the set of identities modeled by 𝒦
class-identities : {𝓤 𝓧 : Universe}{X : 𝓧 ̇}{𝒦 : Pred (Algebra 𝓤 𝑆) (OV 𝓤)}
                   (p q : ∣ 𝑻 X ∣)
                  ----------------------------------------------------------
 →                 𝒦 ⊧ p ≋ q  ⇔  ((p , q) ∈ Th (V 𝒦))

class-identities{𝓤}{𝓧}{X}{𝒦} p q = ⇒ , ⇐
 where
  ⇒ : 𝒦 ⊧ p ≋ q → p , q ∈ Th (V 𝒦)
  ⇒ = λ α VCloA → V-id1 p q α VCloA

  ⇐ : p , q ∈ Th (V 𝒦) → 𝒦 ⊧ p ≋ q
  ⇐ = λ Thpq {𝑨} KA → lower-alg-⊧ 𝑨 p q (Thpq (vbase KA))

\end{code}

----------------------------

{% include UALib.Links.md %}
