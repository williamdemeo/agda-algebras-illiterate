{-# OPTIONS --without-K --exact-split --safe #-}

module Demos.TYPES2021-shortimports where


-- Imports from Agda and Agda Std Lib -------------------------------------------------
open import Axiom.Extensionality.Propositional using    ()
                                  renaming (Extensionality to funext) public

open import Agda.Builtin.Equality using    ( _≡_   ; refl     ) public
open import Agda.Builtin.Bool     using    ( Bool             ) public
open import Agda.Primitive        using    ( _⊔_              )
                                  renaming ( Set   to Type
                                           ; Setω  to Typeω   ) public
open import Data.Empty            using    ( ⊥                ) public
open import Data.Product          using    ( _,_   ; Σ-syntax
                                           ; Σ     ;   _×_    )
                                  renaming ( proj₁ to  fst
                                           ; proj₂ to  snd    ) public
open import Data.Sum              using    (_⊎_               )
                                  renaming ( inj₁  to  inl
                                           ; inj₂  to  inr    ) public
open import Function.Base         using    ( _∘_   ;   id     ) public
open import Function.Bundles      using    ( Injection        ) public
open import Level                 renaming ( suc   to lsuc
                                           ; zero  to ℓ₀      ) public
open import Relation.Binary       using    ( IsEquivalence    ) public
open import Relation.Binary.Core  using    ( _⇒_   ;  _=[_]⇒_ )
                                  renaming ( REL   to BinREL
                                           ; Rel   to BinRel  ) public
open import Relation.Unary        using    ( ∅     ;  _∈_ ; ⋂
                                           ; Pred  ; _⊆_
                                           ; ｛_｝  ; _∪_      ) public
open import Relation.Binary.PropositionalEquality
                                  using    ( trans ; cong-app
                                           ; cong  ; module ≡-Reasoning ) public


-- Imports from agda-algebras ------------------------------------------------------------
open import Overture.Preliminaries   using ( Π ; 𝑖𝑑 ; Π-syntax ; ∣_∣ ; ∥_∥
                                           ; _⁻¹ ; _≈_ ; _∙_ ; lift∼lower
                                           ; lower∼lift                      ) public
open import Overture.Inverses        using ( IsInjective ; IsSurjective
                                           ; Image_∋_ ; SurjInv ; Inv
                                           ; InvIsInv ; eq ; id-is-injective
                                           ; ∘-injective                     ) public
open import Relations.Discrete       using ( arity[_] ; ker
                                           ; kernel ; Im_⊆_ ;_preserves_     ) public
-- open import Relations.Discrete              using    (Im_⊆_ ; Arity ; ker ; kerlift ; ker' ; kernel ; 0[_]
--                                                      ; _⊑_ ; ⊑-refl ; ⊑-trans ; Op ; π ; eval-rel
--                                                      ;  _|:_ ; compatibility-agreement
open import Relations.Continuous    using ( compatible-Ρ ) public


open import Relations.Quotients      using ( ker-IsEquivalence ; _/_ ; ⌞_⌟
                                           ; ⟪_⟫ ; IsBlock ; Quotient
                                           ; Equivalence ; 0[_]Equivalence
                                           ;  ⟪_∼_⟫-elim ; R-block           ) public
open import Relations.Truncation     using ( is-set ; blk-uip
                                           ; is-embedding ; hfunext
                                           ; monic-is-embedding|Set          ) public
open import Relations.Extensionality using ( SwellDef ; DFunExt ; swelldef
                                           ; block-ext|uip ; pred-ext
                                           ; SurjInvIsRightInv ; epic-factor ) public
open import Algebras.Basic           using ( Level-of-Carrier ; compatible   ) public
open import Homomorphisms.Basic      using ( kercon ; ker[_⇒_]_↾_
                                           ; ⨅-hom-co ; πker ; ∘-is-hom
                                           ; epi ; epi-to-hom ; ker-in-con   ) public
open import Homomorphisms.Noether           using    ( FirstHomTheorem|Set
                                                     ; -- ; FirstIsoTheorem|Set
                                                     -- ; NoetherHomUnique ; fe-NoetherHomUnique
                                                     -- ; NoetherIsoUnique ; HomFactor ; 
                                                     HomFactorEpi ) public
open import Homomorphisms.Isomorphisms      using    (  ⨅≅ ; Lift-Alg-assoc ) public
open import Terms.Operations                using    (  free-lift-interp ; interp-prod ) public

open ≡-Reasoning public
open import Subalgebras.Subalgebras         using    ( -- _IsSubalgebraOf_ ; Subalgebra ; FirstHomCorollary|Set
                                                     -- ; free-quot-subalg ; _≤_ ; _IsSubalgebraOfClass_
                                                     -- ; SubalgebraOfClass ; ≤-reflexive ; ≤-refl
                                                     -- ; ≤-transitivity ; ≤-trans ; iso→injective ; ≤-iso
                                                     -- ; ≤-trans-≅ ; ≤-TRANS-≅ ; ≤-mono ; Lift-is-sub
                                                      Lift-≤ ; Lift-≤-Lift ; ≤-Lift ) public
