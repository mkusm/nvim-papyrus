" Papyrus syntax file
" Filename:     papyrus.vim
" Language:     TES5 Papyrus scripting language
" Maintainer:   Infernio
" Version:      1.0
"
" Created by combining several sources, including:
" - https://www.creationkit.com/index.php?title=Notepad%2B%2B_Setup
" - https://github.com/Gawdl3y/atom-language-papyrus

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" Not actually correct, but it seems to be the only
" way to get vim's autocomplete to capitalize the
" keywords.
syn case match

syn keyword papyrusScript       ScriptName Extends

syn keyword papyrusKeyword      Event EndEvent
syn keyword papyrusKeyword      Function EndFunction
syn keyword papyrusKeyword      State EndState Return

syn keyword papyrusConditional  If ElseIf Else EndIf
syn keyword papyrusRepeat       While EndWhile
syn keyword papyrusImport       Import

syn keyword papyrusTodo         TODO FIXME XXX
syn region  papyrusComment      start=/{/ end=/}/ contains=papyrusTodo
syn match   papyrusComment      /;.*$/ contains=papyrusTodo

syn keyword papyrusType         Bool Boolean Int Integer Float String
syn keyword papyrusConstant     None Self Parent
syn keyword papyrusBoolean      true false

syn keyword papyrusKeyword      Global Native Property EndProperty Auto AutoReadOnly
syn keyword papyrusOperator     Length New As
syn match   papyrusOperator     /[-+*/,=%.!<>]/
syn match   papyrusOperator     /[-+*/<>!=%]=/
syn match   papyrusOperator     /&&/
syn match   papyrusOperator     /||/
syn match   papyrusOperator     /\[\s*\]/
syn match   papyrusOperator     /(\s*)/


syn match   papyrusNumber       /[0-9]\+/
syn match   papyrusNumber       /[0-9]*\.[0-9]\+/
syn match   papyrusNumber       /-[0-9]\+/
syn match   papyrusNumber       /0x[0-9abcdef]\+/

syn match   papyrusNumber       /-[0-9]\+\.[0-9]+/
syn match   papyrusNumber       /-[0-9]*\.[0-9]+/
syn match   papyrusNumber       /-0x[0-9abcdef]\+/

syn region  papyrusString      start=/"/ skip=/\\"/ end=/"/
syn region  papyrusArray        start=/\[/ end=/\]/ contains=ALL contained

" Basic Skyrim Types, source: https://www.creationkit.com/index.php?title=Script_Objects
syn keyword papyrusScriptType    Action Activator ActiveMagicEffect Actor ActorBase Alias Ammo Apparatus Armor ArmorAddon AssociationType
syn keyword papyrusScriptType    Book
syn keyword papyrusScriptType    Cell Class ColorForm CombatStyle ConstructibleObject Container
syn keyword papyrusScriptType    Debug DefaultObjectManager Door
syn keyword papyrusScriptType    EffectShader Enchantment EncounterZone EquipSlot Explosion
syn keyword papyrusScriptType    Faction Flora Form FormList Furniture
syn keyword papyrusScriptType    Game GlobalVariable
syn keyword papyrusScriptType    Hazard HeadPart
syn keyword papyrusScriptType    Idle ImageSpaceModifier ImpactDataSet Ingredient Input
syn keyword papyrusScriptType    Key Keyword
syn keyword papyrusScriptType    LeveledActor LeveledItem LeveledSpell Light Location LocationAlias LocationRefType
syn keyword papyrusScriptType    MagicEffect Math Message MiscObject ModEvent MusicType
syn keyword papyrusScriptType    NetImmerse
syn keyword papyrusScriptType    ObjectReference Outfit
syn keyword papyrusScriptType    Package Perk Potion Projectile
syn keyword papyrusScriptType    Quest
syn keyword papyrusScriptType    Race ReferenceAlias
syn keyword papyrusScriptType    Scene Scroll Shout SKSE SoulGem Sound SoundCategory Spell Static StringUtil
syn keyword papyrusScriptType    TalkingActivator TextureSet Topic TopicInfo
syn keyword papyrusScriptType    UI Utility
syn keyword papyrusScriptType    VisualEffect VoiceType
syn keyword papyrusScriptType    Weapon Weather WordOfPower WorldSpace


" SKSE Types, source: https://www.creationkit.com/index.php?title=Category:SKSE_Script_Objects
syn keyword papyrusScriptType    ActorValueInfo Art


" Basic Skyrim Functions
syn keyword papyrusFunction MessageBox

" Basic Skyrim Events
syn keyword papyrusEvent OnCellLoad


" Not currently used
" syn match   papyrusIdentifier   "\s*[a-zA-z_][a-zA-Z0-9_]*" contained

" Define the default highlighting.
if version >= 508 || !exists("did_papyrus_syn_inits")
    if version < 508
        let did_papyrus_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif


    HiLink papyrusScript Keyword
    HiLink papyrusKeyword Keyword
    HiLink papyrusScriptType Type
    HiLink papyrusType Type
    HiLink papyrusBoolean Boolean
    HiLink papyrusConditional Conditional
    HiLink papyrusRepeat Repeat
    HiLink papyrusFunction Function
    HiLink papyrusEvent Function

    HiLink papyrusImport Import

    HiLink papyrusComment   Comment
    HiLink papyrusTodo Todo

    HiLink papyrusConstant  Constant
    HiLink papyrusNull  Constant
    HiLink papyrusOperator Operator
    HiLink papyrusNumber Number
    HiLink papyrusString String


    delcommand HiLink
endif

let b:current_syntax = "papyrus"
