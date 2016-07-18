
open Prims

type level =
| Un
| Expr
| Type
| Kind
| Formula


let is_Un = (fun _discr_ -> (match (_discr_) with
| Un (_) -> begin
true
end
| _ -> begin
false
end))


let is_Expr = (fun _discr_ -> (match (_discr_) with
| Expr (_) -> begin
true
end
| _ -> begin
false
end))


let is_Type = (fun _discr_ -> (match (_discr_) with
| Type (_) -> begin
true
end
| _ -> begin
false
end))


let is_Kind = (fun _discr_ -> (match (_discr_) with
| Kind (_) -> begin
true
end
| _ -> begin
false
end))


let is_Formula = (fun _discr_ -> (match (_discr_) with
| Formula (_) -> begin
true
end
| _ -> begin
false
end))


type imp =
| FsTypApp
| Hash
| Nothing


let is_FsTypApp = (fun _discr_ -> (match (_discr_) with
| FsTypApp (_) -> begin
true
end
| _ -> begin
false
end))


let is_Hash = (fun _discr_ -> (match (_discr_) with
| Hash (_) -> begin
true
end
| _ -> begin
false
end))


let is_Nothing = (fun _discr_ -> (match (_discr_) with
| Nothing (_) -> begin
true
end
| _ -> begin
false
end))


type arg_qualifier =
| Implicit
| Equality


let is_Implicit = (fun _discr_ -> (match (_discr_) with
| Implicit (_) -> begin
true
end
| _ -> begin
false
end))


let is_Equality = (fun _discr_ -> (match (_discr_) with
| Equality (_) -> begin
true
end
| _ -> begin
false
end))


type aqual =
arg_qualifier Prims.option


type let_qualifier =
| NoLetQualifier
| Rec
| Mutable


let is_NoLetQualifier = (fun _discr_ -> (match (_discr_) with
| NoLetQualifier (_) -> begin
true
end
| _ -> begin
false
end))


let is_Rec = (fun _discr_ -> (match (_discr_) with
| Rec (_) -> begin
true
end
| _ -> begin
false
end))


let is_Mutable = (fun _discr_ -> (match (_discr_) with
| Mutable (_) -> begin
true
end
| _ -> begin
false
end))


type term' =
| Wild
| Const of FStar_Const.sconst
| Op of (Prims.string * term Prims.list)
| Tvar of FStar_Ident.ident
| Var of FStar_Ident.lid
| Name of FStar_Ident.lid
| Construct of (FStar_Ident.lid * (term * imp) Prims.list)
| Abs of (pattern Prims.list * term)
| App of (term * term * imp)
| Let of (let_qualifier * (pattern * term) Prims.list * term)
| Seq of (term * term)
| If of (term * term * term)
| Match of (term * branch Prims.list)
| TryWith of (term * branch Prims.list)
| Ascribed of (term * term)
| Record of (term Prims.option * (FStar_Ident.lid * term) Prims.list)
| Project of (term * FStar_Ident.lid)
| Product of (binder Prims.list * term)
| Sum of (binder Prims.list * term)
| QForall of (binder Prims.list * term Prims.list Prims.list * term)
| QExists of (binder Prims.list * term Prims.list Prims.list * term)
| Refine of (binder * term)
| NamedTyp of (FStar_Ident.ident * term)
| Paren of term
| Requires of (term * Prims.string Prims.option)
| Ensures of (term * Prims.string Prims.option)
| Labeled of (term * Prims.string * Prims.bool)
| Assign of (FStar_Ident.ident * term) 
 and term =
{tm : term'; range : FStar_Range.range; level : level} 
 and binder' =
| Variable of FStar_Ident.ident
| TVariable of FStar_Ident.ident
| Annotated of (FStar_Ident.ident * term)
| TAnnotated of (FStar_Ident.ident * term)
| NoName of term 
 and binder =
{b : binder'; brange : FStar_Range.range; blevel : level; aqual : aqual} 
 and pattern' =
| PatWild
| PatConst of FStar_Const.sconst
| PatApp of (pattern * pattern Prims.list)
| PatVar of (FStar_Ident.ident * arg_qualifier Prims.option)
| PatName of FStar_Ident.lid
| PatTvar of (FStar_Ident.ident * arg_qualifier Prims.option)
| PatList of pattern Prims.list
| PatTuple of (pattern Prims.list * Prims.bool)
| PatRecord of (FStar_Ident.lid * pattern) Prims.list
| PatAscribed of (pattern * term)
| PatOr of pattern Prims.list 
 and pattern =
{pat : pattern'; prange : FStar_Range.range} 
 and branch =
(pattern * term Prims.option * term)


let is_Wild = (fun _discr_ -> (match (_discr_) with
| Wild (_) -> begin
true
end
| _ -> begin
false
end))


let is_Const = (fun _discr_ -> (match (_discr_) with
| Const (_) -> begin
true
end
| _ -> begin
false
end))


let is_Op = (fun _discr_ -> (match (_discr_) with
| Op (_) -> begin
true
end
| _ -> begin
false
end))


let is_Tvar = (fun _discr_ -> (match (_discr_) with
| Tvar (_) -> begin
true
end
| _ -> begin
false
end))


let is_Var = (fun _discr_ -> (match (_discr_) with
| Var (_) -> begin
true
end
| _ -> begin
false
end))


let is_Name = (fun _discr_ -> (match (_discr_) with
| Name (_) -> begin
true
end
| _ -> begin
false
end))


let is_Construct = (fun _discr_ -> (match (_discr_) with
| Construct (_) -> begin
true
end
| _ -> begin
false
end))


let is_Abs = (fun _discr_ -> (match (_discr_) with
| Abs (_) -> begin
true
end
| _ -> begin
false
end))


let is_App = (fun _discr_ -> (match (_discr_) with
| App (_) -> begin
true
end
| _ -> begin
false
end))


let is_Let = (fun _discr_ -> (match (_discr_) with
| Let (_) -> begin
true
end
| _ -> begin
false
end))


let is_Seq = (fun _discr_ -> (match (_discr_) with
| Seq (_) -> begin
true
end
| _ -> begin
false
end))


let is_If = (fun _discr_ -> (match (_discr_) with
| If (_) -> begin
true
end
| _ -> begin
false
end))


let is_Match = (fun _discr_ -> (match (_discr_) with
| Match (_) -> begin
true
end
| _ -> begin
false
end))


let is_TryWith = (fun _discr_ -> (match (_discr_) with
| TryWith (_) -> begin
true
end
| _ -> begin
false
end))


let is_Ascribed = (fun _discr_ -> (match (_discr_) with
| Ascribed (_) -> begin
true
end
| _ -> begin
false
end))


let is_Record = (fun _discr_ -> (match (_discr_) with
| Record (_) -> begin
true
end
| _ -> begin
false
end))


let is_Project = (fun _discr_ -> (match (_discr_) with
| Project (_) -> begin
true
end
| _ -> begin
false
end))


let is_Product = (fun _discr_ -> (match (_discr_) with
| Product (_) -> begin
true
end
| _ -> begin
false
end))


let is_Sum = (fun _discr_ -> (match (_discr_) with
| Sum (_) -> begin
true
end
| _ -> begin
false
end))


let is_QForall = (fun _discr_ -> (match (_discr_) with
| QForall (_) -> begin
true
end
| _ -> begin
false
end))


let is_QExists = (fun _discr_ -> (match (_discr_) with
| QExists (_) -> begin
true
end
| _ -> begin
false
end))


let is_Refine = (fun _discr_ -> (match (_discr_) with
| Refine (_) -> begin
true
end
| _ -> begin
false
end))


let is_NamedTyp = (fun _discr_ -> (match (_discr_) with
| NamedTyp (_) -> begin
true
end
| _ -> begin
false
end))


let is_Paren = (fun _discr_ -> (match (_discr_) with
| Paren (_) -> begin
true
end
| _ -> begin
false
end))


let is_Requires = (fun _discr_ -> (match (_discr_) with
| Requires (_) -> begin
true
end
| _ -> begin
false
end))


let is_Ensures = (fun _discr_ -> (match (_discr_) with
| Ensures (_) -> begin
true
end
| _ -> begin
false
end))


let is_Labeled = (fun _discr_ -> (match (_discr_) with
| Labeled (_) -> begin
true
end
| _ -> begin
false
end))


let is_Assign = (fun _discr_ -> (match (_discr_) with
| Assign (_) -> begin
true
end
| _ -> begin
false
end))


let is_Mkterm : term  ->  Prims.bool = (Obj.magic ((fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkterm"))))


let is_Variable = (fun _discr_ -> (match (_discr_) with
| Variable (_) -> begin
true
end
| _ -> begin
false
end))


let is_TVariable = (fun _discr_ -> (match (_discr_) with
| TVariable (_) -> begin
true
end
| _ -> begin
false
end))


let is_Annotated = (fun _discr_ -> (match (_discr_) with
| Annotated (_) -> begin
true
end
| _ -> begin
false
end))


let is_TAnnotated = (fun _discr_ -> (match (_discr_) with
| TAnnotated (_) -> begin
true
end
| _ -> begin
false
end))


let is_NoName = (fun _discr_ -> (match (_discr_) with
| NoName (_) -> begin
true
end
| _ -> begin
false
end))


let is_Mkbinder : binder  ->  Prims.bool = (Obj.magic ((fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkbinder"))))


let is_PatWild = (fun _discr_ -> (match (_discr_) with
| PatWild (_) -> begin
true
end
| _ -> begin
false
end))


let is_PatConst = (fun _discr_ -> (match (_discr_) with
| PatConst (_) -> begin
true
end
| _ -> begin
false
end))


let is_PatApp = (fun _discr_ -> (match (_discr_) with
| PatApp (_) -> begin
true
end
| _ -> begin
false
end))


let is_PatVar = (fun _discr_ -> (match (_discr_) with
| PatVar (_) -> begin
true
end
| _ -> begin
false
end))


let is_PatName = (fun _discr_ -> (match (_discr_) with
| PatName (_) -> begin
true
end
| _ -> begin
false
end))


let is_PatTvar = (fun _discr_ -> (match (_discr_) with
| PatTvar (_) -> begin
true
end
| _ -> begin
false
end))


let is_PatList = (fun _discr_ -> (match (_discr_) with
| PatList (_) -> begin
true
end
| _ -> begin
false
end))


let is_PatTuple = (fun _discr_ -> (match (_discr_) with
| PatTuple (_) -> begin
true
end
| _ -> begin
false
end))


let is_PatRecord = (fun _discr_ -> (match (_discr_) with
| PatRecord (_) -> begin
true
end
| _ -> begin
false
end))


let is_PatAscribed = (fun _discr_ -> (match (_discr_) with
| PatAscribed (_) -> begin
true
end
| _ -> begin
false
end))


let is_PatOr = (fun _discr_ -> (match (_discr_) with
| PatOr (_) -> begin
true
end
| _ -> begin
false
end))


let is_Mkpattern : pattern  ->  Prims.bool = (Obj.magic ((fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkpattern"))))


let ___Const____0 = (fun projectee -> (match (projectee) with
| Const (_59_16) -> begin
_59_16
end))


let ___Op____0 = (fun projectee -> (match (projectee) with
| Op (_59_19) -> begin
_59_19
end))


let ___Tvar____0 = (fun projectee -> (match (projectee) with
| Tvar (_59_22) -> begin
_59_22
end))


let ___Var____0 = (fun projectee -> (match (projectee) with
| Var (_59_25) -> begin
_59_25
end))


let ___Name____0 = (fun projectee -> (match (projectee) with
| Name (_59_28) -> begin
_59_28
end))


let ___Construct____0 = (fun projectee -> (match (projectee) with
| Construct (_59_31) -> begin
_59_31
end))


let ___Abs____0 = (fun projectee -> (match (projectee) with
| Abs (_59_34) -> begin
_59_34
end))


let ___App____0 = (fun projectee -> (match (projectee) with
| App (_59_37) -> begin
_59_37
end))


let ___Let____0 = (fun projectee -> (match (projectee) with
| Let (_59_40) -> begin
_59_40
end))


let ___Seq____0 = (fun projectee -> (match (projectee) with
| Seq (_59_43) -> begin
_59_43
end))


let ___If____0 = (fun projectee -> (match (projectee) with
| If (_59_46) -> begin
_59_46
end))


let ___Match____0 = (fun projectee -> (match (projectee) with
| Match (_59_49) -> begin
_59_49
end))


let ___TryWith____0 = (fun projectee -> (match (projectee) with
| TryWith (_59_52) -> begin
_59_52
end))


let ___Ascribed____0 = (fun projectee -> (match (projectee) with
| Ascribed (_59_55) -> begin
_59_55
end))


let ___Record____0 = (fun projectee -> (match (projectee) with
| Record (_59_58) -> begin
_59_58
end))


let ___Project____0 = (fun projectee -> (match (projectee) with
| Project (_59_61) -> begin
_59_61
end))


let ___Product____0 = (fun projectee -> (match (projectee) with
| Product (_59_64) -> begin
_59_64
end))


let ___Sum____0 = (fun projectee -> (match (projectee) with
| Sum (_59_67) -> begin
_59_67
end))


let ___QForall____0 = (fun projectee -> (match (projectee) with
| QForall (_59_70) -> begin
_59_70
end))


let ___QExists____0 = (fun projectee -> (match (projectee) with
| QExists (_59_73) -> begin
_59_73
end))


let ___Refine____0 = (fun projectee -> (match (projectee) with
| Refine (_59_76) -> begin
_59_76
end))


let ___NamedTyp____0 = (fun projectee -> (match (projectee) with
| NamedTyp (_59_79) -> begin
_59_79
end))


let ___Paren____0 = (fun projectee -> (match (projectee) with
| Paren (_59_82) -> begin
_59_82
end))


let ___Requires____0 = (fun projectee -> (match (projectee) with
| Requires (_59_85) -> begin
_59_85
end))


let ___Ensures____0 = (fun projectee -> (match (projectee) with
| Ensures (_59_88) -> begin
_59_88
end))


let ___Labeled____0 = (fun projectee -> (match (projectee) with
| Labeled (_59_91) -> begin
_59_91
end))


let ___Assign____0 = (fun projectee -> (match (projectee) with
| Assign (_59_94) -> begin
_59_94
end))


let ___Variable____0 = (fun projectee -> (match (projectee) with
| Variable (_59_98) -> begin
_59_98
end))


let ___TVariable____0 = (fun projectee -> (match (projectee) with
| TVariable (_59_101) -> begin
_59_101
end))


let ___Annotated____0 = (fun projectee -> (match (projectee) with
| Annotated (_59_104) -> begin
_59_104
end))


let ___TAnnotated____0 = (fun projectee -> (match (projectee) with
| TAnnotated (_59_107) -> begin
_59_107
end))


let ___NoName____0 = (fun projectee -> (match (projectee) with
| NoName (_59_110) -> begin
_59_110
end))


let ___PatConst____0 = (fun projectee -> (match (projectee) with
| PatConst (_59_114) -> begin
_59_114
end))


let ___PatApp____0 = (fun projectee -> (match (projectee) with
| PatApp (_59_117) -> begin
_59_117
end))


let ___PatVar____0 = (fun projectee -> (match (projectee) with
| PatVar (_59_120) -> begin
_59_120
end))


let ___PatName____0 = (fun projectee -> (match (projectee) with
| PatName (_59_123) -> begin
_59_123
end))


let ___PatTvar____0 = (fun projectee -> (match (projectee) with
| PatTvar (_59_126) -> begin
_59_126
end))


let ___PatList____0 = (fun projectee -> (match (projectee) with
| PatList (_59_129) -> begin
_59_129
end))


let ___PatTuple____0 = (fun projectee -> (match (projectee) with
| PatTuple (_59_132) -> begin
_59_132
end))


let ___PatRecord____0 = (fun projectee -> (match (projectee) with
| PatRecord (_59_135) -> begin
_59_135
end))


let ___PatAscribed____0 = (fun projectee -> (match (projectee) with
| PatAscribed (_59_138) -> begin
_59_138
end))


let ___PatOr____0 = (fun projectee -> (match (projectee) with
| PatOr (_59_141) -> begin
_59_141
end))


type knd =
term


type typ =
term


type expr =
term


type tycon =
| TyconAbstract of (FStar_Ident.ident * binder Prims.list * knd Prims.option)
| TyconAbbrev of (FStar_Ident.ident * binder Prims.list * knd Prims.option * term)
| TyconRecord of (FStar_Ident.ident * binder Prims.list * knd Prims.option * (FStar_Ident.ident * term) Prims.list)
| TyconVariant of (FStar_Ident.ident * binder Prims.list * knd Prims.option * (FStar_Ident.ident * term Prims.option * Prims.bool) Prims.list)


let is_TyconAbstract = (fun _discr_ -> (match (_discr_) with
| TyconAbstract (_) -> begin
true
end
| _ -> begin
false
end))


let is_TyconAbbrev = (fun _discr_ -> (match (_discr_) with
| TyconAbbrev (_) -> begin
true
end
| _ -> begin
false
end))


let is_TyconRecord = (fun _discr_ -> (match (_discr_) with
| TyconRecord (_) -> begin
true
end
| _ -> begin
false
end))


let is_TyconVariant = (fun _discr_ -> (match (_discr_) with
| TyconVariant (_) -> begin
true
end
| _ -> begin
false
end))


let ___TyconAbstract____0 = (fun projectee -> (match (projectee) with
| TyconAbstract (_59_145) -> begin
_59_145
end))


let ___TyconAbbrev____0 = (fun projectee -> (match (projectee) with
| TyconAbbrev (_59_148) -> begin
_59_148
end))


let ___TyconRecord____0 = (fun projectee -> (match (projectee) with
| TyconRecord (_59_151) -> begin
_59_151
end))


let ___TyconVariant____0 = (fun projectee -> (match (projectee) with
| TyconVariant (_59_154) -> begin
_59_154
end))


type qualifier =
| Private
| Abstract
| Assumption
| DefaultEffect
| TotalEffect
| Effect
| New
| Inline
| Unfoldable
| Irreducible
| Reifiable
| Reflectable
| Opaque
| Logic


let is_Private = (fun _discr_ -> (match (_discr_) with
| Private (_) -> begin
true
end
| _ -> begin
false
end))


let is_Abstract = (fun _discr_ -> (match (_discr_) with
| Abstract (_) -> begin
true
end
| _ -> begin
false
end))


let is_Assumption = (fun _discr_ -> (match (_discr_) with
| Assumption (_) -> begin
true
end
| _ -> begin
false
end))


let is_DefaultEffect = (fun _discr_ -> (match (_discr_) with
| DefaultEffect (_) -> begin
true
end
| _ -> begin
false
end))


let is_TotalEffect = (fun _discr_ -> (match (_discr_) with
| TotalEffect (_) -> begin
true
end
| _ -> begin
false
end))


let is_Effect = (fun _discr_ -> (match (_discr_) with
| Effect (_) -> begin
true
end
| _ -> begin
false
end))


let is_New = (fun _discr_ -> (match (_discr_) with
| New (_) -> begin
true
end
| _ -> begin
false
end))


let is_Inline = (fun _discr_ -> (match (_discr_) with
| Inline (_) -> begin
true
end
| _ -> begin
false
end))


let is_Unfoldable = (fun _discr_ -> (match (_discr_) with
| Unfoldable (_) -> begin
true
end
| _ -> begin
false
end))


let is_Irreducible = (fun _discr_ -> (match (_discr_) with
| Irreducible (_) -> begin
true
end
| _ -> begin
false
end))


let is_Reifiable = (fun _discr_ -> (match (_discr_) with
| Reifiable (_) -> begin
true
end
| _ -> begin
false
end))


let is_Reflectable = (fun _discr_ -> (match (_discr_) with
| Reflectable (_) -> begin
true
end
| _ -> begin
false
end))


let is_Opaque = (fun _discr_ -> (match (_discr_) with
| Opaque (_) -> begin
true
end
| _ -> begin
false
end))


let is_Logic = (fun _discr_ -> (match (_discr_) with
| Logic (_) -> begin
true
end
| _ -> begin
false
end))


type qualifiers =
qualifier Prims.list


type lift_op =
| NonReifiableLift of term
| ReifiableLift of (term * term)


let is_NonReifiableLift = (fun _discr_ -> (match (_discr_) with
| NonReifiableLift (_) -> begin
true
end
| _ -> begin
false
end))


let is_ReifiableLift = (fun _discr_ -> (match (_discr_) with
| ReifiableLift (_) -> begin
true
end
| _ -> begin
false
end))


let ___NonReifiableLift____0 = (fun projectee -> (match (projectee) with
| NonReifiableLift (_59_157) -> begin
_59_157
end))


let ___ReifiableLift____0 = (fun projectee -> (match (projectee) with
| ReifiableLift (_59_160) -> begin
_59_160
end))


type lift =
{msource : FStar_Ident.lid; mdest : FStar_Ident.lid; lift_op : lift_op}


let is_Mklift : lift  ->  Prims.bool = (Obj.magic ((fun _ -> (FStar_All.failwith "Not yet implemented:is_Mklift"))))


type pragma =
| SetOptions of Prims.string
| ResetOptions of Prims.string Prims.option


let is_SetOptions = (fun _discr_ -> (match (_discr_) with
| SetOptions (_) -> begin
true
end
| _ -> begin
false
end))


let is_ResetOptions = (fun _discr_ -> (match (_discr_) with
| ResetOptions (_) -> begin
true
end
| _ -> begin
false
end))


let ___SetOptions____0 = (fun projectee -> (match (projectee) with
| SetOptions (_59_167) -> begin
_59_167
end))


let ___ResetOptions____0 = (fun projectee -> (match (projectee) with
| ResetOptions (_59_170) -> begin
_59_170
end))


type decl' =
| TopLevelModule of FStar_Ident.lid
| Open of FStar_Ident.lid
| ModuleAbbrev of (FStar_Ident.ident * FStar_Ident.lid)
| KindAbbrev of (FStar_Ident.ident * binder Prims.list * knd)
| ToplevelLet of (qualifiers * let_qualifier * (pattern * term) Prims.list)
| Main of term
| Assume of (qualifiers * FStar_Ident.ident * term)
| Tycon of (qualifiers * tycon Prims.list)
| Val of (qualifiers * FStar_Ident.ident * term)
| Exception of (FStar_Ident.ident * term Prims.option)
| NewEffect of (qualifiers * effect_decl)
| NewEffectForFree of (qualifiers * effect_decl)
| SubEffect of lift
| Pragma of pragma 
 and decl =
{d : decl'; drange : FStar_Range.range} 
 and effect_decl =
| DefineEffect of (FStar_Ident.ident * binder Prims.list * term * decl Prims.list * decl Prims.list)
| RedefineEffect of (FStar_Ident.ident * binder Prims.list * term)


let is_TopLevelModule = (fun _discr_ -> (match (_discr_) with
| TopLevelModule (_) -> begin
true
end
| _ -> begin
false
end))


let is_Open = (fun _discr_ -> (match (_discr_) with
| Open (_) -> begin
true
end
| _ -> begin
false
end))


let is_ModuleAbbrev = (fun _discr_ -> (match (_discr_) with
| ModuleAbbrev (_) -> begin
true
end
| _ -> begin
false
end))


let is_KindAbbrev = (fun _discr_ -> (match (_discr_) with
| KindAbbrev (_) -> begin
true
end
| _ -> begin
false
end))


let is_ToplevelLet = (fun _discr_ -> (match (_discr_) with
| ToplevelLet (_) -> begin
true
end
| _ -> begin
false
end))


let is_Main = (fun _discr_ -> (match (_discr_) with
| Main (_) -> begin
true
end
| _ -> begin
false
end))


let is_Assume = (fun _discr_ -> (match (_discr_) with
| Assume (_) -> begin
true
end
| _ -> begin
false
end))


let is_Tycon = (fun _discr_ -> (match (_discr_) with
| Tycon (_) -> begin
true
end
| _ -> begin
false
end))


let is_Val = (fun _discr_ -> (match (_discr_) with
| Val (_) -> begin
true
end
| _ -> begin
false
end))


let is_Exception = (fun _discr_ -> (match (_discr_) with
| Exception (_) -> begin
true
end
| _ -> begin
false
end))


let is_NewEffect = (fun _discr_ -> (match (_discr_) with
| NewEffect (_) -> begin
true
end
| _ -> begin
false
end))


let is_NewEffectForFree = (fun _discr_ -> (match (_discr_) with
| NewEffectForFree (_) -> begin
true
end
| _ -> begin
false
end))


let is_SubEffect = (fun _discr_ -> (match (_discr_) with
| SubEffect (_) -> begin
true
end
| _ -> begin
false
end))


let is_Pragma = (fun _discr_ -> (match (_discr_) with
| Pragma (_) -> begin
true
end
| _ -> begin
false
end))


let is_Mkdecl : decl  ->  Prims.bool = (Obj.magic ((fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkdecl"))))


let is_DefineEffect = (fun _discr_ -> (match (_discr_) with
| DefineEffect (_) -> begin
true
end
| _ -> begin
false
end))


let is_RedefineEffect = (fun _discr_ -> (match (_discr_) with
| RedefineEffect (_) -> begin
true
end
| _ -> begin
false
end))


let ___TopLevelModule____0 = (fun projectee -> (match (projectee) with
| TopLevelModule (_59_175) -> begin
_59_175
end))


let ___Open____0 = (fun projectee -> (match (projectee) with
| Open (_59_178) -> begin
_59_178
end))


let ___ModuleAbbrev____0 = (fun projectee -> (match (projectee) with
| ModuleAbbrev (_59_181) -> begin
_59_181
end))


let ___KindAbbrev____0 = (fun projectee -> (match (projectee) with
| KindAbbrev (_59_184) -> begin
_59_184
end))


let ___ToplevelLet____0 = (fun projectee -> (match (projectee) with
| ToplevelLet (_59_187) -> begin
_59_187
end))


let ___Main____0 = (fun projectee -> (match (projectee) with
| Main (_59_190) -> begin
_59_190
end))


let ___Assume____0 = (fun projectee -> (match (projectee) with
| Assume (_59_193) -> begin
_59_193
end))


let ___Tycon____0 = (fun projectee -> (match (projectee) with
| Tycon (_59_196) -> begin
_59_196
end))


let ___Val____0 = (fun projectee -> (match (projectee) with
| Val (_59_199) -> begin
_59_199
end))


let ___Exception____0 = (fun projectee -> (match (projectee) with
| Exception (_59_202) -> begin
_59_202
end))


let ___NewEffect____0 = (fun projectee -> (match (projectee) with
| NewEffect (_59_205) -> begin
_59_205
end))


let ___NewEffectForFree____0 = (fun projectee -> (match (projectee) with
| NewEffectForFree (_59_208) -> begin
_59_208
end))


let ___SubEffect____0 = (fun projectee -> (match (projectee) with
| SubEffect (_59_211) -> begin
_59_211
end))


let ___Pragma____0 = (fun projectee -> (match (projectee) with
| Pragma (_59_214) -> begin
_59_214
end))


let ___DefineEffect____0 = (fun projectee -> (match (projectee) with
| DefineEffect (_59_218) -> begin
_59_218
end))


let ___RedefineEffect____0 = (fun projectee -> (match (projectee) with
| RedefineEffect (_59_221) -> begin
_59_221
end))


type modul =
| Module of (FStar_Ident.lid * decl Prims.list)
| Interface of (FStar_Ident.lid * decl Prims.list * Prims.bool)


let is_Module = (fun _discr_ -> (match (_discr_) with
| Module (_) -> begin
true
end
| _ -> begin
false
end))


let is_Interface = (fun _discr_ -> (match (_discr_) with
| Interface (_) -> begin
true
end
| _ -> begin
false
end))


let ___Module____0 = (fun projectee -> (match (projectee) with
| Module (_59_224) -> begin
_59_224
end))


let ___Interface____0 = (fun projectee -> (match (projectee) with
| Interface (_59_227) -> begin
_59_227
end))


type file =
modul Prims.list


type inputFragment =
(file, decl Prims.list) FStar_Util.either


let check_id : FStar_Ident.ident  ->  Prims.unit = (fun id -> if (FStar_Options.universes ()) then begin
(

let first_char = (FStar_String.substring id.FStar_Ident.idText 0 1)
in if ((FStar_String.lowercase first_char) = first_char) then begin
()
end else begin
(let _151_1033 = (let _151_1032 = (let _151_1031 = (FStar_Util.format1 "Invalid identifer \'%s\'; expected a symbol that begins with a lower-case character" id.FStar_Ident.idText)
in ((_151_1031), (id.FStar_Ident.idRange)))
in FStar_Syntax_Syntax.Error (_151_1032))
in (Prims.raise _151_1033))
end)
end else begin
()
end)


let mk_decl : decl'  ->  FStar_Range.range  ->  decl = (fun d r -> {d = d; drange = r})


let mk_binder : binder'  ->  FStar_Range.range  ->  level  ->  aqual  ->  binder = (fun b r l i -> {b = b; brange = r; blevel = l; aqual = i})


let mk_term : term'  ->  FStar_Range.range  ->  level  ->  term = (fun t r l -> {tm = t; range = r; level = l})


let mk_pattern : pattern'  ->  FStar_Range.range  ->  pattern = (fun p r -> {pat = p; prange = r})


let un_curry_abs : pattern Prims.list  ->  term  ->  term' = (fun ps body -> (match (body.tm) with
| Abs (p', body') -> begin
Abs ((((FStar_List.append ps p')), (body')))
end
| _59_248 -> begin
Abs (((ps), (body)))
end))


let mk_function : branch Prims.list  ->  FStar_Range.range  ->  FStar_Range.range  ->  term = (fun branches r1 r2 -> (

let x = if (FStar_Options.universes ()) then begin
(

let i = (FStar_Syntax_Syntax.next_id ())
in (FStar_Ident.gen r1))
end else begin
(FStar_Absyn_Util.genident (Some (r1)))
end
in (let _151_1073 = (let _151_1072 = (let _151_1071 = (let _151_1070 = (let _151_1069 = (let _151_1068 = (let _151_1067 = (let _151_1066 = (FStar_Ident.lid_of_ids ((x)::[]))
in Var (_151_1066))
in (mk_term _151_1067 r1 Expr))
in ((_151_1068), (branches)))
in Match (_151_1069))
in (mk_term _151_1070 r2 Expr))
in ((((mk_pattern (PatVar (((x), (None)))) r1))::[]), (_151_1071)))
in Abs (_151_1072))
in (mk_term _151_1073 r2 Expr))))


let un_function : pattern  ->  term  ->  (pattern * term) Prims.option = (fun p tm -> (match (((p.pat), (tm.tm))) with
| (PatVar (_59_257), Abs (pats, body)) -> begin
Some ((((mk_pattern (PatApp (((p), (pats)))) p.prange)), (body)))
end
| _59_265 -> begin
None
end))


let lid_with_range : FStar_Ident.lident  ->  FStar_Range.range  ->  FStar_Ident.lident = (fun lid r -> (let _151_1082 = (FStar_Ident.path_of_lid lid)
in (FStar_Ident.lid_of_path _151_1082 r)))


let consPat : FStar_Range.range  ->  pattern  ->  pattern  ->  pattern' = (fun r hd tl -> PatApp ((((mk_pattern (PatName (FStar_Absyn_Const.cons_lid)) r)), ((hd)::(tl)::[]))))


let consTerm : FStar_Range.range  ->  term  ->  term  ->  term = (fun r hd tl -> (mk_term (Construct (((FStar_Absyn_Const.cons_lid), ((((hd), (Nothing)))::(((tl), (Nothing)))::[])))) r Expr))


let lexConsTerm : FStar_Range.range  ->  term  ->  term  ->  term = (fun r hd tl -> (mk_term (Construct (((FStar_Absyn_Const.lexcons_lid), ((((hd), (Nothing)))::(((tl), (Nothing)))::[])))) r Expr))


let mkConsList : FStar_Range.range  ->  term Prims.list  ->  term = (fun r elts -> (

let nil = (mk_term (Construct (((FStar_Absyn_Const.nil_lid), ([])))) r Expr)
in (FStar_List.fold_right (fun e tl -> (consTerm r e tl)) elts nil)))


let mkLexList : FStar_Range.range  ->  term Prims.list  ->  term = (fun r elts -> (

let nil = (mk_term (Construct (((FStar_Absyn_Const.lextop_lid), ([])))) r Expr)
in (FStar_List.fold_right (fun e tl -> (lexConsTerm r e tl)) elts nil)))


let mkApp : term  ->  (term * imp) Prims.list  ->  FStar_Range.range  ->  term = (fun t args r -> (match (args) with
| [] -> begin
t
end
| _59_292 -> begin
(match (t.tm) with
| Name (s) -> begin
(mk_term (Construct (((s), (args)))) r Un)
end
| _59_296 -> begin
(FStar_List.fold_left (fun t _59_300 -> (match (_59_300) with
| (a, imp) -> begin
(mk_term (App (((t), (a), (imp)))) r Un)
end)) t args)
end)
end))


let mkRefSet : FStar_Range.range  ->  term Prims.list  ->  term = (fun r elts -> (

let empty = (let _151_1126 = (let _151_1125 = (FStar_Ident.set_lid_range FStar_Absyn_Const.set_empty r)
in Var (_151_1125))
in (mk_term _151_1126 r Expr))
in (

let ref_constr = (let _151_1128 = (let _151_1127 = (FStar_Ident.set_lid_range FStar_Absyn_Const.heap_ref r)
in Var (_151_1127))
in (mk_term _151_1128 r Expr))
in (

let singleton = (let _151_1130 = (let _151_1129 = (FStar_Ident.set_lid_range FStar_Absyn_Const.set_singleton r)
in Var (_151_1129))
in (mk_term _151_1130 r Expr))
in (

let union = (let _151_1132 = (let _151_1131 = (FStar_Ident.set_lid_range FStar_Absyn_Const.set_union r)
in Var (_151_1131))
in (mk_term _151_1132 r Expr))
in (FStar_List.fold_right (fun e tl -> (

let e = (mkApp ref_constr ((((e), (Nothing)))::[]) r)
in (

let single_e = (mkApp singleton ((((e), (Nothing)))::[]) r)
in (mkApp union ((((single_e), (Nothing)))::(((tl), (Nothing)))::[]) r)))) elts empty))))))


let mkExplicitApp : term  ->  term Prims.list  ->  FStar_Range.range  ->  term = (fun t args r -> (match (args) with
| [] -> begin
t
end
| _59_316 -> begin
(match (t.tm) with
| Name (s) -> begin
(let _151_1144 = (let _151_1143 = (let _151_1142 = (FStar_List.map (fun a -> ((a), (Nothing))) args)
in ((s), (_151_1142)))
in Construct (_151_1143))
in (mk_term _151_1144 r Un))
end
| _59_321 -> begin
(FStar_List.fold_left (fun t a -> (mk_term (App (((t), (a), (Nothing)))) r Un)) t args)
end)
end))


let mkAdmitMagic : FStar_Range.range  ->  term = (fun r -> (

let unit_const = (mk_term (Const (FStar_Const.Const_unit)) r Expr)
in (

let admit = (

let admit_name = (let _151_1150 = (let _151_1149 = (FStar_Ident.set_lid_range FStar_Absyn_Const.admit_lid r)
in Var (_151_1149))
in (mk_term _151_1150 r Expr))
in (mkExplicitApp admit_name ((unit_const)::[]) r))
in (

let magic = (

let magic_name = (let _151_1152 = (let _151_1151 = (FStar_Ident.set_lid_range FStar_Absyn_Const.magic_lid r)
in Var (_151_1151))
in (mk_term _151_1152 r Expr))
in (mkExplicitApp magic_name ((unit_const)::[]) r))
in (

let admit_magic = (mk_term (Seq (((admit), (magic)))) r Expr)
in admit_magic)))))


let mkWildAdmitMagic = (fun r -> (let _151_1154 = (mkAdmitMagic r)
in (((mk_pattern PatWild r)), (None), (_151_1154))))


let focusBranches = (fun branches r -> (

let should_filter = (FStar_Util.for_some Prims.fst branches)
in if should_filter then begin
(

let _59_335 = (FStar_Tc_Errors.warn r "Focusing on only some cases")
in (

let focussed = (let _151_1157 = (FStar_List.filter Prims.fst branches)
in (FStar_All.pipe_right _151_1157 (FStar_List.map Prims.snd)))
in (let _151_1159 = (let _151_1158 = (mkWildAdmitMagic r)
in (_151_1158)::[])
in (FStar_List.append focussed _151_1159))))
end else begin
(FStar_All.pipe_right branches (FStar_List.map Prims.snd))
end))


let focusLetBindings = (fun lbs r -> (

let should_filter = (FStar_Util.for_some Prims.fst lbs)
in if should_filter then begin
(

let _59_341 = (FStar_Tc_Errors.warn r "Focusing on only some cases in this (mutually) recursive definition")
in (FStar_List.map (fun _59_345 -> (match (_59_345) with
| (f, lb) -> begin
if f then begin
lb
end else begin
(let _151_1163 = (mkAdmitMagic r)
in (((Prims.fst lb)), (_151_1163)))
end
end)) lbs))
end else begin
(FStar_All.pipe_right lbs (FStar_List.map Prims.snd))
end))


let mkFsTypApp : term  ->  term Prims.list  ->  FStar_Range.range  ->  term = (fun t args r -> (let _151_1171 = (FStar_List.map (fun a -> ((a), (FsTypApp))) args)
in (mkApp t _151_1171 r)))


let mkTuple : term Prims.list  ->  FStar_Range.range  ->  term = (fun args r -> (

let cons = if (FStar_Options.universes ()) then begin
(FStar_Syntax_Util.mk_tuple_data_lid (FStar_List.length args) r)
end else begin
(FStar_Absyn_Util.mk_tuple_data_lid (FStar_List.length args) r)
end
in (let _151_1177 = (FStar_List.map (fun x -> ((x), (Nothing))) args)
in (mkApp (mk_term (Name (cons)) r Expr) _151_1177 r))))


let mkDTuple : term Prims.list  ->  FStar_Range.range  ->  term = (fun args r -> (

let cons = if (FStar_Options.universes ()) then begin
(FStar_Syntax_Util.mk_dtuple_data_lid (FStar_List.length args) r)
end else begin
(FStar_Absyn_Util.mk_dtuple_data_lid (FStar_List.length args) r)
end
in (let _151_1183 = (FStar_List.map (fun x -> ((x), (Nothing))) args)
in (mkApp (mk_term (Name (cons)) r Expr) _151_1183 r))))


let mkRefinedBinder : FStar_Ident.ident  ->  term  ->  term Prims.option  ->  FStar_Range.range  ->  aqual  ->  binder = (fun id t refopt m implicit -> (

let b = (mk_binder (Annotated (((id), (t)))) m Type implicit)
in (match (refopt) with
| None -> begin
b
end
| Some (t) -> begin
(mk_binder (Annotated (((id), ((mk_term (Refine (((b), (t)))) m Type))))) m Type implicit)
end)))


let rec extract_named_refinement : term  ->  (FStar_Ident.ident * term * term Prims.option) Prims.option = (fun t1 -> (match (t1.tm) with
| NamedTyp (x, t) -> begin
Some (((x), (t), (None)))
end
| Refine ({b = Annotated (x, t); brange = _59_377; blevel = _59_375; aqual = _59_373}, t') -> begin
Some (((x), (t), (Some (t'))))
end
| Paren (t) -> begin
(extract_named_refinement t)
end
| _59_389 -> begin
None
end))


let string_of_let_qualifier : let_qualifier  ->  Prims.string = (fun _59_1 -> (match (_59_1) with
| NoLetQualifier -> begin
""
end
| Rec -> begin
"rec"
end
| Mutable -> begin
"mutable"
end))


let to_string_l = (fun sep f l -> (let _151_1204 = (FStar_List.map f l)
in (FStar_String.concat sep _151_1204)))


let imp_to_string : imp  ->  Prims.string = (fun _59_2 -> (match (_59_2) with
| Hash -> begin
"#"
end
| _59_400 -> begin
""
end))


let rec term_to_string : term  ->  Prims.string = (fun x -> (match (x.tm) with
| Wild -> begin
"_"
end
| Requires (t, _59_405) -> begin
(let _151_1212 = (term_to_string t)
in (FStar_Util.format1 "(requires %s)" _151_1212))
end
| Ensures (t, _59_410) -> begin
(let _151_1213 = (term_to_string t)
in (FStar_Util.format1 "(ensures %s)" _151_1213))
end
| Labeled (t, l, _59_416) -> begin
(let _151_1214 = (term_to_string t)
in (FStar_Util.format2 "(labeled %s %s)" l _151_1214))
end
| Const (c) -> begin
(FStar_Absyn_Print.const_to_string c)
end
| Op (s, xs) -> begin
(let _151_1217 = (let _151_1216 = (FStar_List.map (fun x -> (FStar_All.pipe_right x term_to_string)) xs)
in (FStar_String.concat ", " _151_1216))
in (FStar_Util.format2 "%s(%s)" s _151_1217))
end
| Tvar (id) -> begin
id.FStar_Ident.idText
end
| (Var (l)) | (Name (l)) -> begin
l.FStar_Ident.str
end
| Construct (l, args) -> begin
(let _151_1220 = (to_string_l " " (fun _59_437 -> (match (_59_437) with
| (a, imp) -> begin
(let _151_1219 = (term_to_string a)
in (FStar_Util.format2 "%s%s" (imp_to_string imp) _151_1219))
end)) args)
in (FStar_Util.format2 "(%s %s)" l.FStar_Ident.str _151_1220))
end
| Abs (pats, t) -> begin
(let _151_1222 = (to_string_l " " pat_to_string pats)
in (let _151_1221 = (FStar_All.pipe_right t term_to_string)
in (FStar_Util.format2 "(fun %s -> %s)" _151_1222 _151_1221)))
end
| App (t1, t2, imp) -> begin
(let _151_1224 = (FStar_All.pipe_right t1 term_to_string)
in (let _151_1223 = (FStar_All.pipe_right t2 term_to_string)
in (FStar_Util.format3 "%s %s%s" _151_1224 (imp_to_string imp) _151_1223)))
end
| Let (Rec, lbs, body) -> begin
(let _151_1229 = (to_string_l " and " (fun _59_454 -> (match (_59_454) with
| (p, b) -> begin
(let _151_1227 = (FStar_All.pipe_right p pat_to_string)
in (let _151_1226 = (FStar_All.pipe_right b term_to_string)
in (FStar_Util.format2 "%s=%s" _151_1227 _151_1226)))
end)) lbs)
in (let _151_1228 = (FStar_All.pipe_right body term_to_string)
in (FStar_Util.format2 "let rec %s in %s" _151_1229 _151_1228)))
end
| Let (q, ((pat, tm))::[], body) -> begin
(let _151_1232 = (FStar_All.pipe_right pat pat_to_string)
in (let _151_1231 = (FStar_All.pipe_right tm term_to_string)
in (let _151_1230 = (FStar_All.pipe_right body term_to_string)
in (FStar_Util.format4 "let %s %s = %s in %s" (string_of_let_qualifier q) _151_1232 _151_1231 _151_1230))))
end
| Seq (t1, t2) -> begin
(let _151_1234 = (FStar_All.pipe_right t1 term_to_string)
in (let _151_1233 = (FStar_All.pipe_right t2 term_to_string)
in (FStar_Util.format2 "%s; %s" _151_1234 _151_1233)))
end
| If (t1, t2, t3) -> begin
(let _151_1237 = (FStar_All.pipe_right t1 term_to_string)
in (let _151_1236 = (FStar_All.pipe_right t2 term_to_string)
in (let _151_1235 = (FStar_All.pipe_right t3 term_to_string)
in (FStar_Util.format3 "if %s then %s else %s" _151_1237 _151_1236 _151_1235))))
end
| Match (t, branches) -> begin
(let _151_1244 = (FStar_All.pipe_right t term_to_string)
in (let _151_1243 = (to_string_l " | " (fun _59_479 -> (match (_59_479) with
| (p, w, e) -> begin
(let _151_1242 = (FStar_All.pipe_right p pat_to_string)
in (let _151_1241 = (match (w) with
| None -> begin
""
end
| Some (e) -> begin
(let _151_1239 = (term_to_string e)
in (FStar_Util.format1 "when %s" _151_1239))
end)
in (let _151_1240 = (FStar_All.pipe_right e term_to_string)
in (FStar_Util.format3 "%s %s -> %s" _151_1242 _151_1241 _151_1240))))
end)) branches)
in (FStar_Util.format2 "match %s with %s" _151_1244 _151_1243)))
end
| Ascribed (t1, t2) -> begin
(let _151_1246 = (FStar_All.pipe_right t1 term_to_string)
in (let _151_1245 = (FStar_All.pipe_right t2 term_to_string)
in (FStar_Util.format2 "(%s : %s)" _151_1246 _151_1245)))
end
| Record (Some (e), fields) -> begin
(let _151_1250 = (FStar_All.pipe_right e term_to_string)
in (let _151_1249 = (to_string_l " " (fun _59_494 -> (match (_59_494) with
| (l, e) -> begin
(let _151_1248 = (FStar_All.pipe_right e term_to_string)
in (FStar_Util.format2 "%s=%s" l.FStar_Ident.str _151_1248))
end)) fields)
in (FStar_Util.format2 "{%s with %s}" _151_1250 _151_1249)))
end
| Record (None, fields) -> begin
(let _151_1253 = (to_string_l " " (fun _59_501 -> (match (_59_501) with
| (l, e) -> begin
(let _151_1252 = (FStar_All.pipe_right e term_to_string)
in (FStar_Util.format2 "%s=%s" l.FStar_Ident.str _151_1252))
end)) fields)
in (FStar_Util.format1 "{%s}" _151_1253))
end
| Project (e, l) -> begin
(let _151_1254 = (FStar_All.pipe_right e term_to_string)
in (FStar_Util.format2 "%s.%s" _151_1254 l.FStar_Ident.str))
end
| Product ([], t) -> begin
(term_to_string t)
end
| Product ((b)::(hd)::tl, t) -> begin
(term_to_string (mk_term (Product ((((b)::[]), ((mk_term (Product ((((hd)::tl), (t)))) x.range x.level))))) x.range x.level))
end
| Product ((b)::[], t) when (x.level = Type) -> begin
(let _151_1256 = (FStar_All.pipe_right b binder_to_string)
in (let _151_1255 = (FStar_All.pipe_right t term_to_string)
in (FStar_Util.format2 "%s -> %s" _151_1256 _151_1255)))
end
| Product ((b)::[], t) when (x.level = Kind) -> begin
(let _151_1258 = (FStar_All.pipe_right b binder_to_string)
in (let _151_1257 = (FStar_All.pipe_right t term_to_string)
in (FStar_Util.format2 "%s => %s" _151_1258 _151_1257)))
end
| Sum (binders, t) -> begin
(let _151_1261 = (let _151_1259 = (FStar_All.pipe_right binders (FStar_List.map binder_to_string))
in (FStar_All.pipe_right _151_1259 (FStar_String.concat " * ")))
in (let _151_1260 = (FStar_All.pipe_right t term_to_string)
in (FStar_Util.format2 "%s * %s" _151_1261 _151_1260)))
end
| QForall (bs, pats, t) -> begin
(let _151_1264 = (to_string_l " " binder_to_string bs)
in (let _151_1263 = (to_string_l " \\/ " (to_string_l "; " term_to_string) pats)
in (let _151_1262 = (FStar_All.pipe_right t term_to_string)
in (FStar_Util.format3 "forall %s.{:pattern %s} %s" _151_1264 _151_1263 _151_1262))))
end
| QExists (bs, pats, t) -> begin
(let _151_1267 = (to_string_l " " binder_to_string bs)
in (let _151_1266 = (to_string_l " \\/ " (to_string_l "; " term_to_string) pats)
in (let _151_1265 = (FStar_All.pipe_right t term_to_string)
in (FStar_Util.format3 "exists %s.{:pattern %s} %s" _151_1267 _151_1266 _151_1265))))
end
| Refine (b, t) -> begin
(let _151_1269 = (FStar_All.pipe_right b binder_to_string)
in (let _151_1268 = (FStar_All.pipe_right t term_to_string)
in (FStar_Util.format2 "%s:{%s}" _151_1269 _151_1268)))
end
| NamedTyp (x, t) -> begin
(let _151_1270 = (FStar_All.pipe_right t term_to_string)
in (FStar_Util.format2 "%s:%s" x.FStar_Ident.idText _151_1270))
end
| Paren (t) -> begin
(let _151_1271 = (FStar_All.pipe_right t term_to_string)
in (FStar_Util.format1 "(%s)" _151_1271))
end
| Product (bs, t) -> begin
(let _151_1274 = (let _151_1272 = (FStar_All.pipe_right bs (FStar_List.map binder_to_string))
in (FStar_All.pipe_right _151_1272 (FStar_String.concat ",")))
in (let _151_1273 = (FStar_All.pipe_right t term_to_string)
in (FStar_Util.format2 "Unidentified product: [%s] %s" _151_1274 _151_1273)))
end
| t -> begin
"_"
end))
and binder_to_string : binder  ->  Prims.string = (fun x -> (

let s = (match (x.b) with
| Variable (i) -> begin
i.FStar_Ident.idText
end
| TVariable (i) -> begin
(FStar_Util.format1 "%s:_" i.FStar_Ident.idText)
end
| (TAnnotated (i, t)) | (Annotated (i, t)) -> begin
(let _151_1276 = (FStar_All.pipe_right t term_to_string)
in (FStar_Util.format2 "%s:%s" i.FStar_Ident.idText _151_1276))
end
| NoName (t) -> begin
(FStar_All.pipe_right t term_to_string)
end)
in (let _151_1277 = (aqual_to_string x.aqual)
in (FStar_Util.format2 "%s%s" _151_1277 s))))
and aqual_to_string : aqual  ->  Prims.string = (fun _59_3 -> (match (_59_3) with
| Some (Equality) -> begin
"$"
end
| Some (Implicit) -> begin
"#"
end
| _59_577 -> begin
""
end))
and pat_to_string : pattern  ->  Prims.string = (fun x -> (match (x.pat) with
| PatWild -> begin
"_"
end
| PatConst (c) -> begin
(FStar_Absyn_Print.const_to_string c)
end
| PatApp (p, ps) -> begin
(let _151_1281 = (FStar_All.pipe_right p pat_to_string)
in (let _151_1280 = (to_string_l " " pat_to_string ps)
in (FStar_Util.format2 "(%s %s)" _151_1281 _151_1280)))
end
| (PatTvar (i, aq)) | (PatVar (i, aq)) -> begin
(let _151_1282 = (aqual_to_string aq)
in (FStar_Util.format2 "%s%s" _151_1282 i.FStar_Ident.idText))
end
| PatName (l) -> begin
l.FStar_Ident.str
end
| PatList (l) -> begin
(let _151_1283 = (to_string_l "; " pat_to_string l)
in (FStar_Util.format1 "[%s]" _151_1283))
end
| PatTuple (l, false) -> begin
(let _151_1284 = (to_string_l ", " pat_to_string l)
in (FStar_Util.format1 "(%s)" _151_1284))
end
| PatTuple (l, true) -> begin
(let _151_1285 = (to_string_l ", " pat_to_string l)
in (FStar_Util.format1 "(|%s|)" _151_1285))
end
| PatRecord (l) -> begin
(let _151_1288 = (to_string_l "; " (fun _59_608 -> (match (_59_608) with
| (f, e) -> begin
(let _151_1287 = (FStar_All.pipe_right e pat_to_string)
in (FStar_Util.format2 "%s=%s" f.FStar_Ident.str _151_1287))
end)) l)
in (FStar_Util.format1 "{%s}" _151_1288))
end
| PatOr (l) -> begin
(to_string_l "|\n " pat_to_string l)
end
| PatAscribed (p, t) -> begin
(let _151_1290 = (FStar_All.pipe_right p pat_to_string)
in (let _151_1289 = (FStar_All.pipe_right t term_to_string)
in (FStar_Util.format2 "(%s:%s)" _151_1290 _151_1289)))
end))


let rec head_id_of_pat : pattern  ->  FStar_Ident.lid Prims.list = (fun p -> (match (p.pat) with
| PatName (l) -> begin
(l)::[]
end
| PatVar (i, _59_620) -> begin
(let _151_1293 = (FStar_Ident.lid_of_ids ((i)::[]))
in (_151_1293)::[])
end
| PatApp (p, _59_625) -> begin
(head_id_of_pat p)
end
| PatAscribed (p, _59_630) -> begin
(head_id_of_pat p)
end
| _59_634 -> begin
[]
end))


let lids_of_let = (fun defs -> (FStar_All.pipe_right defs (FStar_List.collect (fun _59_639 -> (match (_59_639) with
| (p, _59_638) -> begin
(head_id_of_pat p)
end)))))


let id_of_tycon : tycon  ->  Prims.string = (fun _59_4 -> (match (_59_4) with
| (TyconAbstract (i, _, _)) | (TyconAbbrev (i, _, _, _)) | (TyconRecord (i, _, _, _)) | (TyconVariant (i, _, _, _)) -> begin
i.FStar_Ident.idText
end))


let decl_to_string : decl  ->  Prims.string = (fun d -> (match (d.d) with
| TopLevelModule (l) -> begin
(Prims.strcat "module " l.FStar_Ident.str)
end
| Open (l) -> begin
(Prims.strcat "open " l.FStar_Ident.str)
end
| ModuleAbbrev (i, l) -> begin
(FStar_Util.format2 "module %s = %s" i.FStar_Ident.idText l.FStar_Ident.str)
end
| KindAbbrev (i, _59_683, _59_685) -> begin
(Prims.strcat "kind " i.FStar_Ident.idText)
end
| ToplevelLet (_59_689, _59_691, pats) -> begin
(let _151_1303 = (let _151_1302 = (let _151_1301 = (lids_of_let pats)
in (FStar_All.pipe_right _151_1301 (FStar_List.map (fun l -> l.FStar_Ident.str))))
in (FStar_All.pipe_right _151_1302 (FStar_String.concat ", ")))
in (Prims.strcat "let " _151_1303))
end
| Main (_59_697) -> begin
"main ..."
end
| Assume (_59_700, i, _59_703) -> begin
(Prims.strcat "assume " i.FStar_Ident.idText)
end
| Tycon (_59_707, tys) -> begin
(let _151_1305 = (let _151_1304 = (FStar_All.pipe_right tys (FStar_List.map id_of_tycon))
in (FStar_All.pipe_right _151_1304 (FStar_String.concat ", ")))
in (Prims.strcat "type " _151_1305))
end
| Val (_59_712, i, _59_715) -> begin
(Prims.strcat "val " i.FStar_Ident.idText)
end
| Exception (i, _59_720) -> begin
(Prims.strcat "exception " i.FStar_Ident.idText)
end
| (NewEffect (_, DefineEffect (i, _, _, _, _))) | (NewEffect (_, RedefineEffect (i, _, _))) -> begin
(Prims.strcat "new_effect " i.FStar_Ident.idText)
end
| (NewEffectForFree (_, DefineEffect (i, _, _, _, _))) | (NewEffectForFree (_, RedefineEffect (i, _, _))) -> begin
(Prims.strcat "new_effect_for_free " i.FStar_Ident.idText)
end
| SubEffect (_59_774) -> begin
"sub_effect"
end
| Pragma (_59_777) -> begin
"pragma"
end))


let modul_to_string : modul  ->  Prims.string = (fun m -> (match (m) with
| (Module (_, decls)) | (Interface (_, decls, _)) -> begin
(let _151_1308 = (FStar_All.pipe_right decls (FStar_List.map decl_to_string))
in (FStar_All.pipe_right _151_1308 (FStar_String.concat "\n")))
end))


let error = (fun msg tm r -> (

let tm = (FStar_All.pipe_right tm term_to_string)
in (

let tm = if ((FStar_String.length tm) >= 80) then begin
(let _151_1312 = (FStar_Util.substring tm 0 77)
in (Prims.strcat _151_1312 "..."))
end else begin
tm
end
in if (FStar_Options.universes ()) then begin
(Prims.raise (FStar_Syntax_Syntax.Error ((((Prims.strcat (Prims.strcat msg "\n") tm)), (r)))))
end else begin
(Prims.raise (FStar_Absyn_Syntax.Error ((((Prims.strcat (Prims.strcat msg "\n") tm)), (r)))))
end)))




