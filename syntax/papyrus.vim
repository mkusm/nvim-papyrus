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

" Set up the autocompletion to work properly
setlocal complete+=kSkyrim_Event,kSKSE_Event,kSSE_Event,kSkyrim_Function,kSkyrim_Type,kSkyrim_Keyword,kSKSE_Function,kSKSE_Type,kSSE_Function,kBoth_Function
setlocal complete-=.

syn case ignore

syn keyword papyrusScript       ScriptName Extends

syn keyword papyrusKeyword      Event EndEvent nextgroup=papyrusEvent
syn keyword papyrusKeyword      Function EndFunction nextgroup=papyrusFunction
syn keyword papyrusKeyword      State EndState
syn keyword papyrusKeyword      Return
syn keyword papyrusKeyword      Global Native Property EndProperty Hidden Auto AutoReadOnly

syn keyword papyrusConditional  If ElseIf Else EndIf
syn keyword papyrusRepeat       While EndWhile
syn keyword papyrusImport       Import

syn keyword papyrusType         Bool Boolean Int Integer Float String
syn keyword papyrusConstant     None Self Parent
syn keyword papyrusBoolean      True False

syn keyword papyrusOperator     Length New As
syn match   papyrusOperator     /[-+*/,=%.!<>]/
syn match   papyrusOperator     /[-+*/<>!=%]=/
syn match   papyrusOperator     /&&/
syn match   papyrusOperator     /||/
syn match   papyrusOperator     /\[\s*\]/
syn match   papyrusOperator     /(\s*)/

syn keyword papyrusTodo         TODO FIXME XXX
syn region  papyrusComment      start=/{/ end=/}/ contains=papyrusTodo
syn match   papyrusComment      /;.*$/ contains=papyrusTodo
syn match   papyrusComment      /\-\-.*$/ contains=papyrusTodo

syn match   papyrusNumber       /[0-9]\+/
syn match   papyrusNumber       /[0-9]*\.[0-9]\+/
syn match   papyrusNumber       /-[0-9]\+/
syn match   papyrusNumber       /0x[0-9ABCDEFabcdef]\+/

syn match   papyrusNumber       /-[0-9]\+\.[0-9]+/
syn match   papyrusNumber       /-[0-9]*\.[0-9]+/
syn match   papyrusNumber       /-0x[0-9ABCDEFabcdef]\+/

syn region  papyrusString       start=/"/ skip=/\\"/ end=/"/
syn region  papyrusArray        start=/\[/ end=/\]/ contains=ALL contained

" Skyrim Types, source: https://www.creationkit.com/index.php?title=Script_Objects
syn keyword papyrusScriptType   Action Activator ActiveMagicEffect Actor ActorBase Alias Ammo Apparatus Armor AssociationType
syn keyword papyrusScriptType   Book
syn keyword papyrusScriptType   Cell Class ConstructibleObject Container
syn keyword papyrusScriptType   Debug Door
syn keyword papyrusScriptType   EffectShader Enchantment EncounterZone Explosion
syn keyword papyrusScriptType   Faction Flora Form FormList Furniture
syn keyword papyrusScriptType   Game GlobalVariable
syn keyword papyrusScriptType   Hazard
syn keyword papyrusScriptType   Idle ImageSpaceModifier ImpactDataSet Ingredient
syn keyword papyrusScriptType   Key Keyword
syn keyword papyrusScriptType   LeveledActor LeveledItem LeveledSpell Light Location LocationAlias LocationRefType
syn keyword papyrusScriptType   MagicEffect Math Message MiscObject MusicType
syn keyword papyrusScriptType   ObjectReference Outfit
syn keyword papyrusScriptType   Package Perk Potion Projectile
syn keyword papyrusScriptType   Quest
syn keyword papyrusScriptType   Race ReferenceAlias
syn keyword papyrusScriptType   Scene Scroll ShaderParticleGeometry Shout SoulGem Sound SoundCategory Spell Static
syn keyword papyrusScriptType   TalkingActivator TextureSet Topic TopicInfo
syn keyword papyrusScriptType   Utility
syn keyword papyrusScriptType   VisualEffect VoiceType
syn keyword papyrusScriptType   Weapon Weather WordOfPower WorldSpace


" SKSE Types, source: https://www.creationkit.com/index.php?title=Category:SKSE_Script_Objects
syn keyword papyrusScriptType   ActorValueInfo ArmorAddon Art
syn keyword papyrusScriptType   ColorComponent ColorForm CombatStyle
syn keyword papyrusScriptType   DefaultObjectManager
syn keyword papyrusScriptType   EquipSlot
syn keyword papyrusScriptType   FormType
syn keyword papyrusScriptType   GameData
syn keyword papyrusScriptType   HeadPart
syn keyword papyrusScriptType   Input
syn keyword papyrusScriptType   ModEvent
syn keyword papyrusScriptType   NetImmerse
syn keyword papyrusScriptType   SKSE SpawnerTask SoundDescriptor StringUtil
syn keyword papyrusScriptType   TreeObject
syn keyword papyrusScriptType   UI UICallback
syn keyword papyrusScriptType   WornObject

" Types from Other Libraries
" CampUtil
syn keyword papyrusScriptType   CampUtil
" FISS
syn keyword papyrusScriptType   FISSFactory FISSInterface
" JContainers
syn keyword papyrusScriptType   JArray JContainers JDB JFormDB JFormMap JIntMap JMap JValue
" NetImmerse Override
syn keyword papyrusScriptType   NiOverride
" PapyrusUtil
syn keyword papyrusScriptType   ActorUtil JsonUtil MiscUtil ObjectUtil PapyrusUtil StorageUtil
" SkyUI
syn keyword papyrusScriptType   SKI_ConfigBase SKI_QuestBase
" SkyUILib
syn keyword papyrusScriptType   UILib_1
" UIExtensions
syn keyword papyrusScriptType   CosmeticMenu UICosmeticMenu UIDyeMenu UIExtensions UIListMenu UIMagicMenu UIMenuBase UISelectionMenu UIStatsMenu
syn keyword papyrusScriptType   UITextEntryMenu UIWheelMenu

" Skyrim Functions
syn keyword papyrusFunction abs acos Activate Add AddAchievement AddDependentAnimatedObjectReference AddForm AddHavokBallAndSocketConstraint
syn keyword papyrusFunction AddInventoryEventFilter AddItem AddPerk AddPerkPoints AddShout AddSpell AddToMap AdvanceSkill AllowBleedoutDialogue Apply
syn keyword papyrusFunction ApplyCrossFade ApplyHavokImpulse asin atan AttachAshPile
syn keyword papyrusFunction BlockActivation
syn keyword papyrusFunction CalculateEncounterLevel CalculateFavorCost CanFastTravelToMarker CanFlyHere CanPayCrimeGold CaptureFrameRate Cast Ceiling
syn keyword papyrusFunction CenterOnCell CenterOnCellAndWait Clear ClearArrested ClearDestruction ClearExpressionOverride ClearExtraArrows ClearForcedMovement
syn keyword papyrusFunction ClearKeepOffsetFromActor ClearLookAt ClearPrison ClearTempEffects CloseUserLog CompleteAllObjectives CompleteQuest cos
syn keyword papyrusFunction CreateDetectionEvent
syn keyword papyrusFunction DamageActorValue DamageObject DBSendPlayerPosition DebugChannelNotify DegreesToRadians Delete Disable DisableNoWait
syn keyword papyrusFunction DisablePlayerControls Dismount Dispel DispelAllSpells DispelSpell DoCombatSpellApply DrawWeapon DropObject DumpAliasData
syn keyword papyrusFunction Enable EnableAI EnableFastTravel EnableNoWait EnablePlayerControls EndDeferredKill EndFrameRateCapture EquipItem EquipShout
syn keyword papyrusFunction EquipSpell EvaluatePackage
syn keyword papyrusFunction FadeOutGame FailAllObjectives FastTravel Find FindClosestActor FindClosestReferenceOfAnyTypeInList FindClosestReferenceOfType
syn keyword papyrusFunction FindRandomActor FindRandomReferenceOfAnyTypeInList FindRandomReferenceOfType FindWeather Fire Floor ForceActive ForceActorValue
syn keyword papyrusFunction ForceAddRagdollToWorld ForceFirstPerson ForceLocationTo ForceMovementDirection ForceMovementDirectionRamp
syn keyword papyrusFunction ForceMovementRotationSpeed ForceMovementRotationSpeedRamp ForceMovementSpeed ForceMovementSpeedRamp ForceRefTo
syn keyword papyrusFunction ForceRemoveRagdollFromWorld ForceStart ForceTargetAngle ForceTargetDirection ForceTargetSpeed ForceThirdPerson
syn keyword papyrusFunction GameTimeToString GetActorOwner GetActorValue GetActorValuePercentage GetAlias GetAngleX GetAngleY GetAngleZ
syn keyword papyrusFunction GetAnimationVariableBool GetAnimationVariableFloat GetAnimationVariableInt GetAssociatedSkill GetAt GetAverageFrameRate
syn keyword papyrusFunction GetBaseActorValue GetBaseObject GetBribeAmount GetBudgetCount GetBudgetName GetCasterActor GetClass GetClassification
syn keyword papyrusFunction GetCombatState GetCombatTarget GetConfigName GetCrimeFaction GetCrimeGold GetCrimeGoldNonViolent GetCrimeGoldViolent
syn keyword papyrusFunction GetCurrentBudget GetCurrentDestructionStage GetCurrentGameTime GetCurrentLocation GetCurrentMemory GetCurrentPackage
syn keyword papyrusFunction GetCurrentRealTime GetCurrentScene GetCurrentStageID GetCurrentWeather GetCurrentWeatherTransition GetDeadCount GetDialogueTarget
syn keyword papyrusFunction GetDistance GetEditorLocation GetEquippedItemType GetEquippedShield GetEquippedShout GetEquippedSpell GetEquippedWeapon
syn keyword papyrusFunction GetFactionOwner GetFactionRank GetFactionReaction GetFlyingState GetForcedLandingMarker GetForm GetFormFromFile GetFormID
syn keyword papyrusFunction GetGameSettingFloat GetGameSettingInt GetGameSettingString GetGiftFilter GetGoldAmount GetGoldValue GetHeadingAngle GetHeight
syn keyword papyrusFunction GetHighestRelationshipRank GetInfamy GetInfamyNonViolent GetInfamyViolent GetItemCount GetItemHealthPercent GetKey GetKeywordData
syn keyword papyrusFunction GetKiller GetLength GetLevel GetLeveledActorBase GetLightLevel GetLinkedRef GetLocation GetLockLevel GetLowestRelationshipRank
syn keyword papyrusFunction GetMass GetMaxFrameRate GetMinFrameRate GetNoBleedoutRecovery GetNthLinkedRef GetOpenState GetOutgoingWeather GetOwningQuest
syn keyword papyrusFunction GetParentCell GetPlatformName GetPlayer GetPlayerControls GetPlayerGrabbedRef GetPlayersLastRiddenHorse GetPositionX GetPositionY
syn keyword papyrusFunction GetPositionZ GetRace GetReaction GetRealHoursPassed GetReference GetRefTypeAliveCount GetRefTypeDeadCount GetRelationshipRank
syn keyword papyrusFunction GetScale GetSex GetSitState GetSize GetSkyMode GetSleepState GetState GetStolenItemValueCrime GetStolenItemValueNoCrime
syn keyword papyrusFunction GetSunPositionX GetSunPositionY GetSunPositionZ GetTargetActor GetTemplate GetTriggerObjectCount GetValue GetVersionNumber
syn keyword papyrusFunction GetVoiceRecoveryTime GetVoiceType GetWidth GetWorldSpace GoToState
syn keyword papyrusFunction HasAssociation HasCommonParent HasEffectKeyword HasFamilyRelationship HasForm HasKeyword HasLOS HasMagicEffect
syn keyword papyrusFunction HasMagicEffectWithKeyword HasNode HasParentRelationship HasPerk HasRefType HasSpell HideTitleSequenceMenu
syn keyword papyrusFunction IgnoreFriendlyHits IncrementSkill IncrementSkillBy IncrementStat InterruptCast Is3DLoaded IsActionComplete IsActivateChild
syn keyword papyrusFunction IsActivateControlsEnabled IsActivationBlocked IsActive IsAlarmed IsAlerted IsAllowedToFly IsArrested IsArrestingTarget
syn keyword papyrusFunction IsAttached IsBeingRidden IsBleedingOut IsBribed IsCamSwitchControlsEnabled IsChild IsCleared IsCommandedActor IsCompleted
syn keyword papyrusFunction IsDead IsDeleted IsDetectedBy IsDisabled IsDoingFavor IsEquipped IsEssential IsFactionInCrimeGroup IsFastTravelControlsEnabled
syn keyword papyrusFunction IsFastTravelEnabled IsFightingControlsEnabled IsFlying IsFurnitureInUse IsFurnitureMarkerInUse IsGhost IsGuard IsHostile
syn keyword papyrusFunction IsHostileToActor IsIgnoringFriendlyHits IsInCombat IsInDialogueWithPlayer IsInFaction IsInKillMove IsInMenuMode IsInterior
syn keyword papyrusFunction IsIntimidated IsInvulnerable IsJournalControlsEnabled IsLoaded IsLockBroken IsLocked IsLookingControlsEnabled IsMapMarkerVisible
syn keyword papyrusFunction IsMenuControlsEnabled IsMovementControlsEnabled IsObjectiveCompleted IsObjectiveDisplayed IsObjectiveFailed IsOnMount
syn keyword papyrusFunction IsPlayerExpelled IsPlayersLastRiddenHorse IsPlayerSungazing IsPlayerTeammate IsPlaying IsProtected IsRunning IsSneaking
syn keyword papyrusFunction IsSneakingControlsEnabled IsSprinting IsStageDone IsStarting IsStopped IsStopping IsTrespassing IsUnconscious IsUnique
syn keyword papyrusFunction IsWeaponDrawn IsWordUnlocked
syn keyword papyrusFunction KeepOffsetFromActor Kill KillSilent KnockAreaEffect
syn keyword papyrusFunction LearnAllEffects LearnEffect LearnNextEffect Lock
syn keyword papyrusFunction MessageBox ModActorValue ModCrimeGold ModFactionRank ModReaction MoveTo MoveToInteractionLocation MoveToMyEditorLocation
syn keyword papyrusFunction MoveToNode MoveToPackageLocation Mute
syn keyword papyrusFunction Notification
syn keyword papyrusFunction OpenInventory OpenUserLog OverBudget
syn keyword papyrusFunction PathToReference Pause PlaceActorAtMe PlaceAtMe Play PlayAndWait PlayAnimation PlayAnimationAndWait PlayBink PlayerKnows
syn keyword papyrusFunction PlayerMoveToAndWait PlayerPayCrimeGold PlayGamebryoAnimation PlayIdle PlayIdleWithTarget PlayImpactEffect PlaySubGraphAnimation
syn keyword papyrusFunction PlaySyncedAnimationAndWaitSS PlaySyncedAnimationSS PlayTerrainEffect PopTo pow PrecacheCharGen PrecacheCharGenClear Preload
syn keyword papyrusFunction ProcessTrapHit PushActorAway
syn keyword papyrusFunction QueryStat QuitGame QuitToMainMenu
syn keyword papyrusFunction RadiansToDegrees RandomFloat RandomInt RegisterForAnimationEvent RegisterForLOS RegisterForSingleLOSGain
syn keyword papyrusFunction RegisterForSingleLOSLost RegisterForSingleUpdate RegisterForSingleUpdateGameTime RegisterForSleep RegisterForTrackedStatsEvent
syn keyword papyrusFunction RegisterForUpdate RegisterForUpdateGameTime ReleaseOverride RemoteCast Remove RemoveAddedForm RemoveAllInventoryEventFilters
syn keyword papyrusFunction RemoveAllItems RemoveCrossFade RemoveDependentAnimatedObjectReference RemoveFromAllFactions RemoveFromFaction
syn keyword papyrusFunction RemoveHavokConstraints RemoveInventoryEventFilter RemoveItem RemovePerk RemoveShout RemoveSpell RequestAutoSave RequestModel
syn keyword papyrusFunction RequestSave Reset ResetHealthAndLimbs ResetHelpMessage RestoreActorValue Resurrect Revert
syn keyword papyrusFunction Say SendAnimationEvent SendAssaultAlarm SendPlayerToJail SendStealAlarm SendStoryEvent SendStoryEventAndWait SendTrespassAlarm
syn keyword papyrusFunction SendWereWolfTransformation ServeTime SetActive SetActorCause SetActorOwner SetActorValue SetAlert SetAllowFlying
syn keyword papyrusFunction SetAllowFlyingEx SetAllowFlyingMountLandingRequests SetAlly SetAlpha SetAngle SetAnimationVariableBool SetAnimationVariableFloat
syn keyword papyrusFunction SetAnimationVariableInt SetAttackActorOnSight SetBeastForm SetBribed SetCameraTarget SetCleared SetCrimeFaction SetCrimeGold
syn keyword papyrusFunction SetCrimeGoldViolent SetCriticalStage SetCurrentStageID SetDestroyed SetDoingFavor SetDontMove SetEnemy SetEssential
syn keyword papyrusFunction SetExpressionOverride SetEyeTexture SetFactionOwner SetFactionRank SetFogColor SetFogPlanes SetFogPower SetFootIK
syn keyword papyrusFunction SetForcedLandingMarker SetFrequency SetGhost SetGodMode SetHeadTracking SetHudCartMode SetInChargen SetINIBool SetINIFloat
syn keyword papyrusFunction SetINIInt SetINIString SetInstanceVolume SetIntimidated SetInvulnerable SetKeywordData SetLockLevel SetLookAt SetMotionType
syn keyword papyrusFunction SetNoBleedoutRecovery SetNoFavorAllowed SetNotShowOnStealthMeter SetObjectiveCompleted SetObjectiveDisplayed SetObjectiveFailed
syn keyword papyrusFunction SetOpen SetOutfit SetPlayerAIDriven SetPlayerControls SetPlayerEnemy SetPlayerExpelled SetPlayerReportCrime
syn keyword papyrusFunction SetPlayerResistingArrest SetPlayerTeammate SetPosition SetProtected SetPublic SetRace SetReaction SetRelationshipRank
syn keyword papyrusFunction SetRestrained SetScale SetSittingRotation SetSubGraphFloatVariable SetSunGazeImageSpaceModifier SetUnconscious SetValue
syn keyword papyrusFunction SetVehicle SetVoiceRecoveryTime SetVolume ShakeCamera ShakeController Show ShowAsHelpMessage ShowBarterMenu
syn keyword papyrusFunction ShowFirstPersonGeometry ShowGiftMenu ShowLimitedRaceMenu ShowRaceMenu ShowRefPosition ShowTitleSequenceMenu ShowTrainingMenu sin
syn keyword papyrusFunction SplineTranslateTo SplineTranslateToRefNode sqrt Start StartCannibal StartCombat StartDeferredKill StartFrameRateCapture
syn keyword papyrusFunction StartObjectProfiling StartScriptProfiling StartSneaking StartStackProfiling StartTitleSequence StartVampireFeed Stop StopCombat
syn keyword papyrusFunction StopCombatAlarm StopInstance StopObjectProfiling StopScriptProfiling StopStackProfiling StopTranslation
syn keyword papyrusFunction TakeScreenshot tan TeachWord TetherToHorse ToggleAI ToggleCollisions ToggleMenus Trace TraceStack TraceUser TranslateTo TrapSoul
syn keyword papyrusFunction TriggerScreenBlood
syn keyword papyrusFunction UnequipAll UnequipItem UnequipItemSlot UnequipShout UnequipSpell Unload UnLockOwnedDoorsInCell UnlockWord UnMute UnPause
syn keyword papyrusFunction UnregisterForAnimationEvent UnregisterForLOS UnregisterForSleep UnregisterForTrackedStatsEvent UnregisterForUpdate
syn keyword papyrusFunction UnregisterForUpdateGameTime UpdateCurrentInstanceGlobal UsingGamepad
syn keyword papyrusFunction Wait WaitForAnimationEvent WaitGameTime WaitMenuMode WillIntimidateSucceed WornHasKeyword

" SKSE Functions
syn keyword papyrusFunction AddForms AddSkillExperience AddSpawn AddSlotToMask AsChar AsOrd
syn keyword papyrusFunction Cancel ChangeHeadPart ClearEffectFlag ClearFactionFlag ClearRaceFlag CloseCustomMenu Create CreateAliasArray CreateBoolArray
syn keyword papyrusFunction CreateEnchantment CreateFloatArray CreateFormArray CreateIntArray CreateStringArray
syn keyword papyrusFunction EquipItemById EquipItemEx
syn keyword papyrusFunction GetActorValueInfoByID GetActorValueInfoByName GetAliasByName GetAliasById GetAliases GetAllAmmo GetAllArmor GetAllBooks
syn keyword papyrusFunction GetAllForms GetAllIngredients GetAllKeys GetAllMiscItems GetAllPotions GetAllScrolls GetAllWeapons GetAllowDualWielding GetAlpha
syn keyword papyrusFunction GetArea GetArmorRating GetAvoidThreatChance GetBaseCost GetBaseDamage GetBaseEnchantment GetBaseValue GetBlue GetBool
syn keyword papyrusFunction GetBuySellList GetCameraState GetCastingArt GetCastingType GetCastTime GetChanceGlobal GetChanceNone
syn keyword papyrusFunction GetCloseRangeDuelingCircleMult GetCloseRangeDuelingFallbackMult GetCloseRangeFlankingFlankDistance GetCloseRangeFlankingStalkTime
syn keyword papyrusFunction GetColor GetCombatStyle GetContainerForms GetCostliestEffectIndex GetCritDamage GetCritEffect GetCritEffectOnDeath
syn keyword papyrusFunction GetCritMultiplier GetCurrentConsoleRef GetCurrentCrosshairRef GetCurrentValue GetDamage GetDecibelAttenuation GetDecibelVariance
syn keyword papyrusFunction GetDefaultVoiceType GetDefensiveMult GetDeliveryType GetDescriptor GetDisplayName GetDuration GetEffectAreas GetEffectDurations
syn keyword papyrusFunction GetEffectMagnitudes GetEffectiveMagickaCost GetEnableParent GetEnchantArt GetEnchantment GetEnchantmentValue GetEnchantShader
syn keyword papyrusFunction GetEquipAbility GetEquippedItemId GetEquippedModel GetEquippedObject GetEquipType GetExperienceForLevel GetExplosion GetFaceMorph
syn keyword papyrusFunction GetFacePreset GetFaceTextureSet GetFactions GetFlightDiveBombChance GetFlightFlyingAttackChance GetFlightHoverChance GetFloat
syn keyword papyrusFunction GetFogDistance GetFormEx GetFrequencyShift GetFrequencyVariance GetFurnitureReference GetGemSize GetGreen GetGroupOffensiveMult
syn keyword papyrusFunction GetHairColor GetHarvestSound GetHeadPart GetHitEffectArt GetHitShader GetHotkeyBoundObject GetHue GetIconPath GetID
syn keyword papyrusFunction GetImageSpaceMod GetImpactDataSet GetIndexOfExtraPart GetIndexOfHeadPartByType GetIndexOfOverlayHeadPartByType GetIngredient
syn keyword papyrusFunction GetINIBool GetINIFloat GetINIInt GetINIString GetInt GetIsNthEffectKnown GetItemCharge GetItemMaxCharge GetKeyword
syn keyword papyrusFunction GetKeywordRestrictions GetLight GetLongRangeStrafeMult GetMagicEffects GetMagickaCost GetMagicMult GetMagnitude GetMappedControl
syn keyword papyrusFunction GetMappedKey GetMaskForSlot GetMaximumValue GetMaxRange GetMeleeAttackStaggeredMult GetMeleeBashAttackMult GetMeleeBashMult
syn keyword papyrusFunction GetMeleeBashPowerAttackMult GetMeleeBashRecoiledMult GetMeleeMult GetMeleePowerAttackBlockingMult GetMeleePowerAttackStaggeredMult
syn keyword papyrusFunction GetMeleeSpecialAttackMult GetMerchantContainer GetMessageIconPath GetMinRange GetModAuthor GetModByName GetModCount
syn keyword papyrusFunction GetModDependencyCount GetModDescription GetModelNthTextureSet GetModelNumTextureSets GetModelPath GetModName GetName GetNextPerk
syn keyword papyrusFunction GetNodeLocalPosition GetNodeLocalPositionX GetNodeLocalPositionY GetNodeLocalPositionZ GetNodeLocalRotationEuler
syn keyword papyrusFunction GetNodeLocalRotationMatrix GetNodeScale GetNodeWorldPosition GetNodeWorldPositionX GetNodeWorldPositionY GetNodeWorldPositionZ
syn keyword papyrusFunction GetNodeWorldRotationEuler GetNodeWorldRotationMatrix GetNthAdditionalRace GetNthAlias GetNthArmorAddon GetNthChar GetNthCount
syn keyword papyrusFunction GetNthEffectArea GetNthEffectDuration GetNthEffectMagicEffect GetNthEffectMagnitude GetNthEntryLeveledList GetNthEntryPriority
syn keyword papyrusFunction GetNthEntryQuest GetNthEntryRank GetNthEntrySpell GetNthEntryStage GetNthEntryText GetNthEntryValue GetNthExtraPart GetNthForm
syn keyword papyrusFunction GetNthHeadPart GetNthIngredient GetNthIngredientQuantity GetNthKeyPressed GetNthKeyword GetNthLevel GetNthModDependency
syn keyword papyrusFunction GetNthOverlayHeadPart GetNthParent GetNthPart GetNthPlayableRace GetNthRecoveryTime GetNthRef GetNthReferenceAlias GetNthSpell
syn keyword papyrusFunction GetNthTexturePath GetNthTintMaskColor GetNthTintMaskTexturePath GetNthTintMaskType GetNthWordOfPower GetNumAdditionalRaces
syn keyword papyrusFunction GetNumAliases GetNumArmorAddons GetNumEffects GetNumEntries GetNumExtraParts GetNumForms GetNumHeadParts GetNumIngredients
syn keyword papyrusFunction GetNumItems GetNumKeysPressed GetNumKeywords GetNumOverlayHeadParts GetNumParents GetNumParts GetNumPlayableRaces
syn keyword papyrusFunction GetNumReferenceAliases GetNumRefs GetNumTexturePaths GetNumTintMasks GetNumTintsByType GetOffensiveMult GetOutfit GetPerk
syn keyword papyrusFunction GetPerkPoints GetPerks GetPerkTree GetPlayerExperience GetPlayerMovementMode GetPluginVersion GetPoison GetPriority GetProjectile
syn keyword papyrusFunction GetQuality GetQuest GetRangedMult GetReach GetRed GetReferenceAliases GetRelativeNodePosition GetRelativeNodePositionX
syn keyword papyrusFunction GetRelativeNodePositionY GetRelativeNodePositionZ GetResist GetResistance GetResult GetResultQuantity GetSaturation GetShoutMult
syn keyword papyrusFunction GetSkill GetSkillExperience GetSkillImproveMult GetSkillImproveOffset GetSkillLevel GetSkillOffsetMult GetSkillUsageMult
syn keyword papyrusFunction GetSkillUseMult GetSkin GetSkinFar GetSlotMask GetSoulSize GetSpeed GetSpell GetSpellCount GetStaffMult GetStagger GetString
syn keyword papyrusFunction GetSunDamage GetSunGlare GetTimeElapsed GetTintMaskColor GetTintMaskTexturePath GetTotalArmorWeight GetTotalItemWeight GetType
syn keyword papyrusFunction GetUnarmedMult GetUseSound GetValidRaces GetVendorEndHour GetVendorRadius GetVendorStartHour GetVersion GetVersionBeta
syn keyword papyrusFunction GetVersionMinor GetVersionRelease GetWaterLevel GetWeaponType GetWeight GetWeightClass GetWindDirection GetWindDirectionRange
syn keyword papyrusFunction GetWorkbenchKeyword GetWorldModelNthTextureSet GetWorldModelNumTextureSets GetWorldModelPath GetWornForm GetWornItemId
syn keyword papyrusFunction HasExtraPart HasWorldModel HoldKey
syn keyword papyrusFunction InvokeBool InvokeBoolA InvokeFloat InvokeFloatA InvokeForm InvokeInt InvokeIntA InvokeString InvokeStringA IsAIEnabled IsBolt
syn keyword papyrusFunction IsDigit IsEffectFlagSet IsExtraPart IsFactionFlagSet IsFood IsHarvested IsKeyPressed IsLetter IsMenuOpen IsNotSellBuy
syn keyword papyrusFunction IsObjectFavorited IsOffLimits IsPoison IsPrintable IsPunctuation IsRaceFlagSet IsRead IsSkill IsSwimming IsTakeable
syn keyword papyrusFunction IsTextInputEnabled
syn keyword papyrusFunction LeftShift LoadGame Log LogicalAnd LogicalNot LogicalOr LogicalXor
syn keyword papyrusFunction ModArmorRating ModPerkPoints
syn keyword papyrusFunction OnlyBuysStolenItems OpenCustomMenu
syn keyword papyrusFunction PushBool PushBoolA PushFloat PushFloatA PushForm PushInt PushIntA PushString PushStringA
syn keyword papyrusFunction QueueNiNodeUpdate
syn keyword papyrusFunction RegenerateHead RegisterForActorAction RegisterForCameraState RegisterForControl RegisterForCrosshairRef RegisterForKey
syn keyword papyrusFunction RegisterForMenu RegisterForNiNodeUpdate RegisterForModEvent Release ReleaseKey RemoveSlotFromMask ReplaceHeadPart
syn keyword papyrusFunction ResetExpressionOverrides ResetInventory ResizeAliasArray ResizeBoolArray ResizeFloatArray ResizeFormArray ResizeIntArray
syn keyword papyrusFunction ResizeStringArray RightShift Run
syn keyword papyrusFunction SaveGame Send SendModEvent SetAllowDualWielding SetArea SetArmorRating SetAssociatedSkill SetAvoidThreatChance SetBaseCost
syn keyword papyrusFunction SetBaseDamage SetBlue SetBool SetBuySellList SetCastingArt SetCastTime SetChanceGlobal SetChanceNone SetClass
syn keyword papyrusFunction SetCloseRangeDuelingCircleMult SetCloseRangeDuelingFallbackMult SetCloseRangeFlankingFlankDistance SetCloseRangeFlankingStalkTime
syn keyword papyrusFunction SetColor SetCombatStyle SetCritDamage SetCritEffect SetCritEffectOnDeath SetCritMultiplier SetDecibelAttenuation
syn keyword papyrusFunction SetDecibelVariance SetDefaultVoiceType SetDefensiveMult SetDisplayName SetEffectFlag SetEnchantArt SetEnchantment
syn keyword papyrusFunction SetEnchantmentValue SetEnchantShader SetEquipAbility SetEquippedModel SetEquipType SetExplosion SetExpressionModifier
syn keyword papyrusFunction SetExpressionPhoneme SetFaceMorph SetFacePreset SetFaceTextureSet SetFactionFlag SetFlightDiveBombChance
syn keyword papyrusFunction SetFlightFlyingAttackChance SetFlightHoverChance SetFloat SetForm SetFrequencyShift SetFrequencyVariance SetGameSettingBool
syn keyword papyrusFunction SetGameSettingFloat SetGameSettingInt SetGameSettingString SetGoldValue SetGreen SetGroupOffensiveMult SetHairColor SetHarvested
syn keyword papyrusFunction SetHarvestSound SetHeight SetHitEffectArt SetHitShader SetHue SetIconPath SetImageSpaceMod SetImpactDataSet SetIngredient SetInt
syn keyword papyrusFunction SetItemCharge SetItemHealthPercent SetItemMaxCharge SetKeywordRestrictions SetLight SetLongRangeStrafeMult SetMagicMult
syn keyword papyrusFunction SetMaxRange SetMeleeAttackStaggeredMult SetMeleeBashAttackMult SetMeleeBashMult SetMeleeBashPowerAttackMult
syn keyword papyrusFunction SetMeleeBashRecoiledMult SetMeleeMult SetMeleePowerAttackBlockingMult SetMeleePowerAttackStaggeredMult
syn keyword papyrusFunction SetMeleeSpecialAttackMult SetMerchantContainer SetMessageIconPath SetMinRange SetMiscStat SetModelNthTextureSet SetModelPath
syn keyword papyrusFunction SetName SetNodeLocalPosition SetNodeLocalPositionX SetNodeLocalPositionY SetNodeLocalPositionZ SetNodeLocalRotationEuler
syn keyword papyrusFunction SetNodeLocalRotationMatrix SetNodeScale SetNodeTextureSet SetNotSellBuy SetNthCount SetNthEffectArea SetNthEffectDuration
syn keyword papyrusFunction SetNthEffectMagnitude SetNthEntryLeveledList SetNthEntryPriority SetNthEntryQuest SetNthEntryRank SetNthEntrySpell
syn keyword papyrusFunction SetNthEntryStage SetNthEntryText SetNthEntryValue SetNthHeadPart SetNthIngredient SetNthIngredientQuantity SetNthLevel
syn keyword papyrusFunction SetNthRecoveryTime SetNthSpell SetNthTexturePath SetNthTintMaskColor SetNthTintMaskTexturePath SetNthWordOfPower SetOffensiveMult
syn keyword papyrusFunction SetOnlyBuysStolenItems SetPerk SetPerkPoints SetPlayerExperience SetPlayerKnows SetPlayerLevel SetPlayersLastRiddenHorse
syn keyword papyrusFunction SetProjectile SetQuality SetRaceFlag SetRangedMult SetReach SetRed SetResist SetResistance SetResult SetResultQuantity
syn keyword papyrusFunction SetSaturation SetShoutMult SetSkill SetSkillExperience SetSkillImproveMult SetSkillImproveOffset SetSkillLevel
syn keyword papyrusFunction SetSkillOffsetMult SetSkillUsageMult SetSkillUseMult SetSkin SetSkinFar SetSlotMask SetSpeed SetStaffMult SetStagger SetString
syn keyword papyrusFunction SetTintMaskColor SetTintMaskTexturePath SetUnarmedMult SetValidRaces SetVendorEndHour SetVendorRadius SetVendorStartHour
syn keyword papyrusFunction SetVoiceType SetWeaponType SetWeight SetWeightClass SetWorkbenchKeyword SetWorldModelNthTextureSet SetWorldModelPath
syn keyword papyrusFunction SheatheWeapon Split Substring
syn keyword papyrusFunction TapKey TempClone ToArray
syn keyword papyrusFunction UnbindObjectHotkey UnequipItemEx UnregisterForActorAction UnregisterForAllControls UnregisterForAllKeys UnregisterForAllMenus
syn keyword papyrusFunction UnregisterForAllModEvents UnregisterForCameraState UnregisterForControl UnregisterForCrosshairRef UnregisterForKey
syn keyword papyrusFunction UnregisterForMenu UnregisterForModEvent UnregisterForNiNodeUpdate UpdateHairColor UpdateThirdPerson UpdateTintMaskColors
syn keyword papyrusFunction UpdateWeight

" SSE Functions
syn keyword papyrusFunction GetWarmthRating

" Functions Available in Both SKSE/Skyrim?, source: https://www.creationkit.com/index.php?title=User:Cdcooley/Notepad%2B%2B_Papyrus_Syntax_Highlighting
syn keyword papyrusFunction AddKeyIfNeeded AddToFaction AllowPCDialogue AllowPickpocket AvoidsRoads
syn keyword papyrusFunction CanFly CanSwim CantOpenDoors CanWalk ClearAllowPCDialogue ClearAllowPickpocket ClearAvoidsRoads ClearCantOpenDoors
syn keyword papyrusFunction ClearForcedLandingMarker ClearNoCombatInWater ClearNoKNockdowns ClearNoShadow ClearVendor CountLinkedRefChain
syn keyword papyrusFunction DamageAV DeleteWhenAble DisableLinkChain
syn keyword papyrusFunction EnableLinkChain FindClosestActorFromRef FindClosestReferenceOfAnyTypeInListFromRef FindClosestReferenceOfTypeFromRef
syn keyword papyrusFunction FindRandomActorFromRef FindRandomReferenceOfAnyTypeInListFromRef FindRandomReferenceOfTypeFromRef ForceAV ForceRefIfEmpty
syn keyword papyrusFunction GetActorBase GetActorRef GetActorReference GetAR GetAV GetAVIByID GetAVIByName GetAVPercentage GetBaseAV GetBlue GetGreen GetHue
syn keyword papyrusFunction GetMaskForSlot GetNodePositionX GetNodePositionY GetNodePositionZ GetNumber GetRed GetRef GetSaturation GetScriptVersionRelease
syn keyword papyrusFunction GetSelfAsActor GetSkillLegendaryLevel GetStage GetStageDone GetValue GetValueInt
syn keyword papyrusFunction HasKeywordString
syn keyword papyrusFunction Invoke InvokeNumber InvokeNumberA IsBattleaxe IsBoots IsBow IsChildRace IsClothing IsClothingBody IsClothingFeet IsClothingHands
syn keyword papyrusFunction IsClothingHead IsClothingPoor IsClothingRich IsClothingRing IsCuirass IsDagger IsEnabled IsGauntlets IsGreatsword IsHeavyArmor
syn keyword papyrusFunction IsHelmet IsImmobile IsInInterior IsInLocation IsJewelry IsLightArmor IsMace IsNearPlayer IsNotPushable IsPlayable IsSameLocation
syn keyword papyrusFunction IsShield IsStaff IsSword IsVendor IsWarAxe IsWarhammer
syn keyword papyrusFunction KillEssential
syn keyword papyrusFunction MakeCanFly MakeCanSwim MakeCanWalk MakeChildRace MakeImmobile MakeMobile MakeNoKnockdowns MakeNonChildRace MakeNonFlying
syn keyword papyrusFunction MakeNonSwimming MakeNonWalking MakeNotPushable MakePlayable MakePlayerFriend MakePushable MakeUnplayable MakeVendor Mod ModAR
syn keyword papyrusFunction ModAV ModFavorPoints ModFavorPointsWithGlobal ModObjectiveGlobal MoveToIfUnloaded MoveToWhenUnloaded
syn keyword papyrusFunction NoCombatInWater NoKnockdowns NoShadow
syn keyword papyrusFunction RampRumble RestoreAV SetAllowPCDialogue
syn keyword papyrusFunction SetAllowPickpocket SetAR SetAV SetAvoidsRoads SetCantOpenDoors SetNoCombatInWater SetNodePositionX SetNodePositionY
syn keyword papyrusFunction SetNodePositionZ SetNoShadow SetNumber SetSkillLegendaryLevel SetStage SetValueInt SplineTranslateToRef TraceAndBox
syn keyword papyrusFunction TraceConditional TranslateToRef TryToAddToFaction TryToClear TryToDisable TryToDisableNoWait TryToEnable TryToEnableNoWait
syn keyword papyrusFunction TryToEvaluatePackage TryToKill TryToMoveTo TryToRemoveFromFaction TryToReset TryToStopCombat

" Skyrim Events
syn keyword papyrusEvent OnActivate OnAnimationEvent OnAnimationEventUnregistered OnAttachedToCell OnBeginState OnCellAttach OnCellDetach OnCellLoad OnClose
syn keyword papyrusEvent OnCombatStateChanged OnContainerChanged OnDeath OnDestructionStageChanged OnDetachedFromCell OnDying OnEffectFinish OnEffectStart
syn keyword papyrusEvent OnEndState OnEnterBleedout OnEquipped OnGainLOS OnGetUp OnInit OnGrab OnHit OnItemAdded OnItemRemoved OnLoad OnLocationChange
syn keyword papyrusEvent OnLockStateChanged OnLostLOS OnMagicEffectApply OnObjectEquipped OnObjectUnequipped OnOpen OnPackageChange OnPackageEnd
syn keyword papyrusEvent OnPackageStart OnPlayerBowShot OnPlayerLoadGame OnRaceSwitchComplete OnRead OnRelease OnReset OnSell OnSit OnSleepStart OnSleepStop
syn keyword papyrusEvent OnSpellCast OnStoryActivateActor OnStoryAddToPlayer OnStoryArrest OnStoryAssaultActor OnStoryBribeNPC OnStoryCastMagic
syn keyword papyrusEvent OnStoryChangeLocation OnStoryCraftItem OnStoryCrimeGold OnStoryCure OnStoryDialogue OnStoryDiscoverDeadBody OnStoryEscapeJail
syn keyword papyrusEvent OnStoryFlatterNPC OnStoryHello OnStoryIncreaseLevel OnStoryIncreaseSkill OnStoryInfection OnStoryIntimidateNPC OnStoryJail
syn keyword papyrusEvent OnStoryKillActor OnStoryNewVoicePower OnStoryPayFine OnStoryPickLock OnStoryPlayerGetsFavor OnStoryRelationshipChange
syn keyword papyrusEvent OnStoryRemoveFromPlayer OnStoryScript OnStoryServedTime OnStoryTrespass OnTrackedStatsEvent OnTranslationAlmostComplete
syn keyword papyrusEvent OnTranslationComplete OnTranslationFailed OnTrapHit OnTrapHitStart OnTrapHitStop OnTrigger OnTriggerEnter OnTriggerLeave
syn keyword papyrusEvent OnUnequipped OnUnload OnUpdate OnUpdateGameTime OnWardHit

" SKSE Events
syn keyword papyrusEvent OnActorAction OnControlDown OnControlUp OnCrosshairRefChange OnKeyDown OnKeyUp OnMenuClose OnMenuOpen OnNiNodeUpdate
syn keyword papyrusEvent OnPlayerCameraState

" SSE Events
syn keyword papyrusEvent OnLycanthropyStateChanged OnPlayerFastTravelEnd OnVampirismStateChanged OnVampireFeed

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
    HiLink papyrusImport Keyword
    HiLink papyrusScriptType Type
    HiLink papyrusType Type
    HiLink papyrusBoolean Boolean
    HiLink papyrusConditional Conditional
    HiLink papyrusRepeat Repeat
    HiLink papyrusFunction Function
    HiLink papyrusEvent Function

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
