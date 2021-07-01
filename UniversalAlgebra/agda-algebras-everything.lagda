---
layout: default
title : Overture.Inverses module
date : 2021-06-09
author: [the agda-algebras development team][]
---

All definitions/theorems in agda-algebras as of 22 June 2021.

\begin{code}


open import Overture.Preliminaries          using    ( ℓ₁ ; ∣_∣ ; ∥_∥ ; _⁻¹ ; _∙_ ; 𝑖𝑑 ; Π ; Π-syntax
                                                     ; lift∼lower ; lower∼lift ; _≈_ ; ≡-by-parts
                                                     ; transport )

open import Overture.Inverses               using    ( Image_∋_ ; eq ; Inv ; InvIsInv ; IsInjective
                                                     ; id-is-injective ; ∘-injective ; IsSurjective
                                                     ; Surjective ; SurjInv )


-- RELATIONS  ------------------------------------------------------------------------

open import Relations.Discrete              using    (Im_⊆_ ; Arity ; ker ; kerlift ; ker' ; kernel ; 0[_]
                                                     ; _⊑_ ; ⊑-refl ; ⊑-trans ; Op ; π ; eval-rel
                                                     ; _preserves_ ; _|:_ ; compatibility-agreement
                                                     ; compatibility-agreement' ; arity[_] )

open import Relations.Continuous            using    ( ar ; Rel ; Rel-syntax ; ΠΡ ; ΠΡ-syntax ; eval-Rel
                                                     ; compatible-Rel ; eval-ΠΡ ; compatible-ΠΡ )

open import Relations.Quotients             using    ( Equivalence ; ker-IsEquivalence
                                                     ; kerlift-IsEquivalence ; [_] ; [_/_] ; Block
                                                     ; IsBlock ; Quotient ; _/_ ; ⟪_⟫ ; ⌞_⌟
                                                     ; []-⊆ ; []-⊇ ; ⊆-[] ; ⊇-[] ; 0[_]IsEquivalence
                                                     ; 0[_]Equivalence ; ⟪_∼_⟫-elim ; ≡→⊆ )

open import Relations.Truncation            using    ( is-center ; is-singleton ; is-prop ; is-prop-valued
                                                     ; singleton-is-prop ; fiber ; is-equiv ; hfunext
                                                     ; is-set ; to-Σ-≡ ; is-embedding ; singleton-type
                                                     ; invertible ; equiv-is-embedding ; monic-is-embedding|Set
                                                     ; blk-uip ; IsRelProp ; RelProp ; RelPropExt ; IsΠΡProp
                                                     ; ΠΡProp ; ΠΡPropExt )

open import Relations.Extensionality        using    ( SurjInvIsRightInv ; epic-factor ; pred-ext
                                                     ; block-ext ; block-ext|uip ; welldef ; swelldef )




-- ALGEBRAS ------------------------------------------------------------------------

open import Algebras.Basic                  using    ( Signature ; signature ; monoid-op ; monoid-sig
                                                     ; compatible ; Algebra ; lilAlgebra
                                                     ; Level-of-Alg ; Level-of-Carrier ; Level-of-lilAlg
                                                     ; Level-of-lilCarrier ; algebra ; lilalgebra
                                                     ; algebra→Algebra ; Algebra→algebra ; _̂_
                                                     ; Lift-alg-op ; Lift-Alg ; Lift-op-lilAlg
                                                     ; Lift-lilAlg ; Lift-algebra ;  compatible-lilAlg
                                                     ; compatible-Rel-alg ; compatible-ΠΡ-alg
                                                     ; compatible-Rel-lilAlg ; compatible-ΠΡ-lilAlg )


open import Algebras.Setoid                 using    ( ⟦_⟧s ; Algebroid ; SetoidAlgebra ; _̂_ ; _∙_ ; ⨅ ; ⨅s )

open import Algebras.Products               using    ( ⨅ ; ⨅' ; ov ; ℑ ; 𝔄 ; class-product )

open import Algebras.Congruences            using    ( IsCongruence ; Con ; IsCongruence→Con
                                                     ; Con→IsCongruence ; 0[_]Compatible ; 0Con[_]
                                                     ; _╱_ ; 𝟘[_╱_] ; 𝟎[_╱_] ; /-≡ )


open import Algebras.SetoidCongruences      using    ( _∣≈_ ; _∣≋_ ; IsCongruence ; Con ; IsCongruence→Con
                                                     ; Con→IsCongruence ; _╱_ )


open import Homomorphisms.Basic             using    ( compatible-op-map ; is-homomorphism ; hom ; ∘-hom
                                                     ; ∘-is-hom ; 𝒾𝒹 ; 𝓁𝒾𝒻𝓉 ; 𝓁ℴ𝓌ℯ𝓇 ; is-monomorphism
                                                     ; mon ; is-epimorphism ; epi ; mon-to-hom ; epi-to-hom
                                                     ; πhom ; homker-comp ; kercon ; kerquo ; ker[_⇒_]_↾_
                                                     ; πepi ; πker ; ker-in-con ; ⨅-hom-co ; ⨅-hom
                                                     ; Lift-hom ; ⨅-projection-hom )

open import Homomorphisms.Noether           using    ( FirstHomTheorem|Set ; FirstIsoTheorem|Set
                                                     ; NoetherHomUnique ; fe-NoetherHomUnique
                                                     ; NoetherIsoUnique ; HomFactor ; HomFactorEpi )

open import Homomorphisms.Isomorphisms      using    ( _≅_ ; ≅-refl ; ≅-sym ; ≅-trans ; Lift-≅
                                                     ; Lift-Alg-iso ; Lift-Alg-assoc ; Lift-Alg-associative
                                                     ; Lift-Alg-⨅≅ ; ⨅≅ )

open import Homomorphisms.HomomorphicImages using    ( _IsHomImageOf_ ; HomImages ; IsHomImageOfClass
                                                     ; HomImageOfClass ; Lift-epi-is-epi
                                                     ; Lift-Alg-hom-image )

open import Terms.Basic                     using    (Term ; ℊ ; node ; 𝑻 ; free-lift ; lift-hom
                                                     ; free-unique ; lift-of-epi-is-epi )


open import Terms.Setoid                    using    ( Ops ; Sub ; _[_] ; module Environment )
open Environment                            using (_≃_ ; Env ; ⦅_⦆ ; Equal ; isEquiv ; ⦅_⦆s ; substitution)




open import Terms.Operations                using    ( _⟦_⟧ ; free-lift-interp ; term-interp
                                                     ; term-gen ; term-gen-agreement ; term-agreement
                                                     ; interp-prod ; interp-prod2 ; comm-hom-term
                                                     ; _∣:_ ; _[_] ; Substerm ; _[_]t ; subst-lemma
                                                     ; subst-theorem )






open import Subalgebras.Subuniverses        using    ( Subuniverses ; Subuniverse ; Sg ; sgIsSub
                                                     ; sgIsSmallest ; sub-intersection ; sub-term-closed
                                                     ; TermImage ; TermImageIsSub ; Y-onlyif-TermImageY
                                                     ; SgY-onlyif-TermImageY ; hom-unique )

open import Subalgebras.Subalgebras         using    ( _IsSubalgebraOf_ ; Subalgebra ; FirstHomCorollary|Set
                                                     ; free-quot-subalg ; _≤_ ; _IsSubalgebraOfClass_
                                                     ; SubalgebraOfClass ; ≤-reflexive ; ≤-refl ; ≤-Lift
                                                     ; ≤-transitivity ; ≤-trans ; iso→injective ; ≤-iso
                                                     ; ≤-trans-≅ ; ≤-TRANS-≅ ; ≤-mono ; Lift-is-sub
                                                     ; Lift-≤ ; Lift-≤-Lift )

open import Varieties.Basic                 using    ( _⊧_≈_ ; _⊫_≈_ ; Th ; Mod )

open import Varieties.Properties            using    ( ⊧-I-invar ; ⊧-Lift-invar ; ⊧-lower-invar
                                                     ; ⊧-S-invar ; ⊧-S-class-invar ; ⊧-P-invar
                                                     ; ⊧-P-class-invar ; ⊧-P-lift-invar ; ⊧-H-invar
                                                     ; ⊧-H-class-invar ; ⊧-H-class-coinvar )

open import Varieties.EquationalLogic       using    ( Eq ; _⊨_ ; _⊧_ ; Mod ; _⊫_ ; _⊃_ ; _⊢_▹_≈_
                                                     ; module Soundness ; module TermModel ; module Completeness )
open Soundness    using ( sound        )
open TermModel    using ( TermSetoid   )
open Completeness using ( completeness )


open import Varieties.Closure               using    ( H ; S ; P ; V ; is-variety ; variety
                                                     ; S-mono ; subalgebra→S ; S→subalgebra
                                                     ; P-mono ; P-expa ; P-idemp ; Lift-Alg-subP
                                                     ; Lift-Alg-subP' ; module Vlift )

open import Varieties.Preservation          using    (S⊆SP ; lemPS⊆SP ; PS⊆SP ; P⊆V ; SP⊆V ; SP⊆V'
                                                     ; module class-products-with-maps ; H-id1 ; H-id2
                                                     ; S-id1 ; S-id2 ; P-id1 ; P-id2 ; V-id1
                                                     ; module Vid' ; V-id1' ; ovu ; lovu ; 𝕍 ; 𝒱
                                                     ; class-ids-⇒ ; class-ids ; class-ids-⇐ ; V-id2 )

open import Varieties.FreeAlgebras          using    ( 𝓕 ; 𝓕⁺ ; ψ ; ψRel ; ψcompatible ; ψIsEquivalence ; ψCon
                                                     ; ℭ ; homℭ ; 𝔽 ; epi𝔽 ; hom𝔽 ; hom𝔽-is-epic
                                                     ; ψlemma0 ; ψlemma0-ap ; 𝔽-lift-hom ; X↪𝔽 ; 𝔑
                                                     ; hom𝔽-is-lift-hom ; ψlemma1 ; ψlemma2 ; ψlemma3
                                                     ; class-models-kernel ; 𝕍𝒦 ; kernel-in-theory
                                                     ; 𝔽-ModTh-epi ; 𝔽≤ℭ ; 𝔽∈SP ; 𝔽∈𝕍 ; Birkhoff
                                                     ; Birkhoff-converse ; _↠_ )



-- STRUCTURES ------------------------------------------------------------------------


open import Structures.AsRecordsBasic       using    ( ar ; signature ; structure ; compatible
                                                     ; Lift-op ; Lift-rel ; Lift-struc
                                                     ; Sig∅ ; Sig-0 ; Sig-1 ; Sig-2 ; Sig-0-1
                                                     ; Sig-0-1-2 )

open import Structures.AsRecordsCongruences using    ( con ; 0[_]compatible ; 0con[_] ; quotient
                                                     ; _╱_ ; /≡-elim ; 𝟎[_╱_] )

open import Structures.AsRecordsHoms        using    ( preserves ; is-hom-rel ; comm-op ; is-hom-op
                                                     ; is-hom ; hom ; hom-alg ; ∘-is-hom-rel
                                                     ; ∘-is-hom-op ; ∘-is-hom ; ∘-hom ; 𝒾𝒹
                                                     ; is-mon ; mon ; mon→hom ; is-epi ; epi
                                                     ; epi→hom ; 𝓁𝒾𝒻𝓉 ; 𝓁ℴ𝓌ℯ𝓇 ; homker-comp
                                                     ; kerlift-comp ; kercon ; kerquo ; ker[_⇒_]
                                                     ; πepi ; πhom ; πker ; ⨅-hom-co ; ⨅-hom
                                                     ; ⨅-projection-hom )

open import Structures.AsRecordsProducts    using    (  ⨅ ; ℓp ; ℑ ; 𝔄 ; class-product )

open import Structures.Basic                using    ( Signature ; Structure ; RStructure ; AStructure
                                                     ; Structure→RStructure ; Structure→AStructure
                                                     ; _⟦_⟧ᵣ ; _⟦_⟧ₒ ; _ʳ_ ; _ᵒ_ ; Compatible
                                                     ; Compatible' ; Lift-op ; Lift-rel
                                                     ; Lift-Strucˡ ; Lift-Strucʳ ; Lift-Struc )

open import Structures.Congruences          using    ( Con ; 0[_]Compatible ; 0Con[_] ; _╱_ ; /≡-elim
                                                     ; 𝟘[_╱_] ; 𝟎[_╱_] )

open import Structures.Homs                 using    ( preserves ; is-hom-rel ; comp-op ; is-hom-op
                                                     ; is-hom ; hom ; ∘-is-hom-rel ; ∘-is-hom-op
                                                     ; ∘-is-hom ; ∘-hom ; 𝒾𝒹 ; is-mon ; mon ; is-epi
                                                     ; epi ; mon→hom ; epi→hom ; 𝓁𝒾𝒻𝓉 ; 𝓁ℴ𝓌ℯ𝓇
                                                     ; Lift-Hom ; Homker-comp )




\end{code}






--------------------------------

[the agda-algebras development team]: https://github.com/ualib/agda-algebras#the-agda-algebras-development-team