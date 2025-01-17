---
layout: default
title : Relations.Properties module (The Agda Universal Algebra Library)
date : 2021-06-26
author: [the ualib/agda-algebras development team][]
---

### <a id="unary-relations">Properties of binary predicates</a>

This is the [Relations.Properties][] module of the [Agda Universal Algebra Library][].

\begin{code}

{-# OPTIONS --without-K --exact-split --safe #-}

module Relations.BinPred where

open import Agda.Builtin.Equality using    ( _≡_  ; refl    )
open import Agda.Primitive        using    ( _⊔_            )
                                  renaming ( Set  to Type   )
open import Data.Product          using    ( _,_  ; _×_     )
open import Function.Base         using    ( _∘_            )
open import Level                 using    ( Level ; Lift   )
                                  renaming ( suc  to lsuc
                                           ; zero to ℓ₀     )
open import Data.Sum.Base         using    ( _⊎_            )
open import Relation.Binary.Core  using    (                )
                                  renaming ( REL  to BinREL
                                           ; Rel  to BinRel )
open import Relation.Nullary      using    ( ¬_             )
open import Relation.Unary        using    ( ∅; _∈_; _∉_
                                           ; Pred           )


private variable
 α β γ ℓ ℓ₁ ℓ₂ ℓ₃ : Level
 A : Set α
 B : Set β
 C : Set γ

curry : Pred(A × B) ℓ → BinREL A B ℓ
curry P x y = (x , y) ∈ P

uncurry : BinREL A B ℓ → Pred(A × B) ℓ
uncurry _≈_ (a , b) = a ≈ b

Reflexive : Pred (A × A) ℓ → Type _
Reflexive P = ∀ {x} → (x , x) ∈ P

-- Generalised symmetry
Sym : Pred (A × B) ℓ₁ → Pred (B × A) ℓ₂ → Type _
Sym P Q = ∀ {x y} → (x , y) ∈ P → (y , x) ∈ Q

-- Symmetry
Symmetric : Pred (A × A) ℓ → Type _
Symmetric P = Sym P P

-- Generalised transitivity.
Trans : Pred (A × B) ℓ₁ → Pred (B × C) ℓ₂ → Pred (A × C) ℓ₃ → Type _
Trans P Q R = ∀ {i j k} → P (i , j) → Q (j , k) → R (i , k)

-- A flipped variant of generalised transitivity.
TransFlip : Pred (A × B) ℓ₁ → Pred (B × C) ℓ₂ → Pred(A × C) ℓ₃ → Type _
TransFlip P Q R = ∀ {i j k} → Q (j , k) → P (i , j) → R (i , k)

-- Transitivity.
Transitive : Pred (A × A) ℓ → Type _
Transitive P = Trans P P P

-- Generalised antisymmetry
Antisym : Pred (A × B) ℓ₁ → Pred (B × A) ℓ₂ → Pred (A × B) ℓ₃ → Type _
Antisym R S E = ∀ {i j} → R (i , j) → S (j , i) → E (i , j)

-- Antisymmetry (defined terms of a given equality _≈_).
Antisymmetric : BinRel A ℓ₁ → Pred (A × A) ℓ₂ → Type _
Antisymmetric _≈_ P = Antisym P P (uncurry _≈_)

-- Irreflexivity (defined terms of a given equality _≈_).

Irreflexive : BinREL A B ℓ₁ → Pred (A × B) ℓ₂ → Type _
Irreflexive _≈_ P = ∀ {x y} → x ≈ y → (x , y) ∉ P

-- Asymmetry.

Asymmetric : Pred (A × A) ℓ → Type _
Asymmetric P = ∀ {x y} → (x , y) ∈ P → (y , x) ∉ P

-- Generalised connex - exactly one of the two relations holds.

Connex : Pred (A × B) ℓ₁ → Pred (B × A) ℓ₂ → Type _
Connex P Q = ∀ x y → (x , y) ∈ P ⊎ (y , x) ∈ Q

-- Totality.

Total : Pred (A × A) ℓ → Type _
Total P = Connex P P

