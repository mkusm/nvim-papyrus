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

syn case ignore

syn keyword papyrusScript       ScriptName Extends

syn keyword papyrusKeyword      Event EndEvent nextgroup=papyrusEvent
syn keyword papyrusKeyword      Function EndFunction nextgroup=papyrusFunction
syn keyword papyrusKeyword      State EndState
syn keyword papyrusKeyword      Return

syn keyword papyrusConditional  If ElseIf Else EndIf
syn keyword papyrusRepeat       While EndWhile
syn keyword papyrusImport       Import

syn keyword papyrusType         Bool Boolean Int Integer Float String
syn keyword papyrusConstant     None Self Parent
syn keyword papyrusBoolean      true false

syn keyword papyrusKeyword      Global Native Property EndProperty Hidden Auto AutoReadOnly
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

syn region  papyrusString      start=/"/ skip=/\\"/ end=/"/
syn region  papyrusArray        start=/\[/ end=/\]/ contains=ALL contained

" Basic Skyrim Types, source: https://www.creationkit.com/index.php?title=Script_Objects
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

" Basic Skyrim Functions
syn keyword papyrusFunction abs acos Activate Add AddAchievement AddDependentAnimatedObjectReference AddForm AddHavokBallAndSocketConstraint AddInventoryEventFilter AddItem AddPerk AddPerkPoints AddShout AddSpell AddToMap AdvanceSkill AllowBleedoutDialogue Apply ApplyCrossFade ApplyHavokImpulse asin atan AttachAshPile BlockActivation CalculateEncounterLevel CalculateFavorCost CanFastTravelToMarker CanFlyHere CanPayCrimeGold CaptureFrameRate Cast Ceiling CenterOnCell CenterOnCellAndWait Clear ClearArrested ClearDestruction ClearExpressionOverride ClearExtraArrows ClearForcedMovement ClearKeepOffsetFromActor ClearLookAt ClearPrison ClearTempEffects CloseUserLog CompleteAllObjectives CompleteQuest cos CreateDetectionEvent DamageActorValue DamageObject DBSendPlayerPosition DebugChannelNotify DegreesToRadians Delete Disable DisableNoWait DisablePlayerControls Dismount Dispel DispelAllSpells DispelSpell DoCombatSpellApply DrawWeapon DropObject DumpAliasData Enable EnableAI EnableFastTravel EnableNoWait EnablePlayerControls EndDeferredKill EndFrameRateCapture EquipItem EquipShout EquipSpell EvaluatePackage FadeOutGame FailAllObjectives FastTravel Find FindClosestActor FindClosestReferenceOfAnyTypeInList FindClosestReferenceOfType FindRandomActor FindRandomReferenceOfAnyTypeInList FindRandomReferenceOfType FindWeather Fire Floor ForceActive ForceActorValue ForceAddRagdollToWorld ForceFirstPerson ForceLocationTo ForceMovementDirection ForceMovementDirectionRamp ForceMovementRotationSpeed ForceMovementRotationSpeedRamp ForceMovementSpeed ForceMovementSpeedRamp ForceRefTo ForceRemoveRagdollFromWorld ForceStart ForceTargetAngle ForceTargetDirection ForceTargetSpeed ForceThirdPerson GameTimeToString GetActorOwner GetActorValue GetActorValuePercentage GetAlias GetAngleX GetAngleY GetAngleZ GetAnimationVariableBool GetAnimationVariableFloat GetAnimationVariableInt GetAssociatedSkill GetAt GetAverageFrameRate GetBaseActorValue GetBaseObject GetBribeAmount GetBudgetCount GetBudgetName GetCasterActor GetClass GetClassification GetCombatState GetCombatTarget GetConfigName GetCrimeFaction GetCrimeGold GetCrimeGoldNonViolent GetCrimeGoldViolent GetCurrentBudget GetCurrentDestructionStage GetCurrentGameTime GetCurrentLocation GetCurrentMemory GetCurrentPackage GetCurrentRealTime GetCurrentScene GetCurrentStageID GetCurrentWeather GetCurrentWeatherTransition GetDeadCount GetDialogueTarget GetDistance GetEditorLocation GetEquippedItemType GetEquippedShield GetEquippedShout GetEquippedSpell GetEquippedWeapon GetFactionOwner GetFactionRank GetFactionReaction GetFlyingState GetForcedLandingMarker GetForm GetFormFromFile GetFormID GetGameSettingFloat GetGameSettingInt GetGameSettingString GetGiftFilter GetGoldAmount GetGoldValue GetHeadingAngle GetHeight GetHighestRelationshipRank GetInfamy GetInfamyNonViolent GetInfamyViolent GetItemCount GetItemHealthPercent GetKey GetKeywordData GetKiller GetLength GetLevel GetLeveledActorBase GetLightLevel GetLinkedRef GetLocation GetLockLevel GetLowestRelationshipRank GetMass GetMaxFrameRate GetMinFrameRate GetNoBleedoutRecovery GetNthLinkedRef GetOpenState GetOutgoingWeather GetOwningQuest GetParentCell GetPlatformName GetPlayer GetPlayerControls GetPlayerGrabbedRef GetPlayersLastRiddenHorse GetPositionX GetPositionY GetPositionZ GetRace GetReaction GetRealHoursPassed GetReference GetRefTypeAliveCount GetRefTypeDeadCount GetRelationshipRank GetScale GetSex GetSitState GetSize GetSkyMode GetSleepState GetState GetStolenItemValueCrime GetStolenItemValueNoCrime GetSunPositionX GetSunPositionY GetSunPositionZ GetTargetActor GetTemplate GetTriggerObjectCount GetValue GetVersionNumber GetVoiceRecoveryTime GetVoiceType GetWidth GetWorldSpace GoToState HasAssociation HasCommonParent HasEffectKeyword HasFamilyRelationship HasForm HasKeyword HasLOS HasMagicEffect HasMagicEffectWithKeyword HasNode HasParentRelationship HasPerk HasRefType HasSpell HideTitleSequenceMenu IgnoreFriendlyHits IncrementSkill IncrementSkillBy IncrementStat InterruptCast Is3DLoaded IsActionComplete IsActivateChild IsActivateControlsEnabled IsActivationBlocked IsActive IsAlarmed IsAlerted IsAllowedToFly IsArrested IsArrestingTarget IsAttached IsBeingRidden IsBleedingOut IsBribed IsCamSwitchControlsEnabled IsChild IsCleared IsCommandedActor IsCompleted IsDead IsDeleted IsDetectedBy IsDisabled IsDoingFavor IsEquipped IsEssential IsFactionInCrimeGroup IsFastTravelControlsEnabled IsFastTravelEnabled IsFightingControlsEnabled IsFlying IsFurnitureInUse IsFurnitureMarkerInUse IsGhost IsGuard IsHostile IsHostileToActor IsIgnoringFriendlyHits IsInCombat IsInDialogueWithPlayer IsInFaction IsInKillMove IsInMenuMode IsInterior IsIntimidated IsInvulnerable IsJournalControlsEnabled IsLoaded IsLockBroken IsLocked IsLookingControlsEnabled IsMapMarkerVisible IsMenuControlsEnabled IsMovementControlsEnabled IsObjectiveCompleted IsObjectiveDisplayed IsObjectiveFailed IsOnMount IsPlayerExpelled IsPlayersLastRiddenHorse IsPlayerSungazing IsPlayerTeammate IsPlaying IsProtected IsRunning IsSneaking IsSneakingControlsEnabled IsSprinting IsStageDone IsStarting IsStopped IsStopping IsTrespassing IsUnconscious IsUnique IsWeaponDrawn IsWordUnlocked KeepOffsetFromActor Kill KillSilent KnockAreaEffect LearnAllEffects LearnEffect LearnNextEffect Lock MessageBox ModActorValue ModCrimeGold ModFactionRank ModReaction MoveTo MoveToInteractionLocation MoveToMyEditorLocation MoveToNode MoveToPackageLocation Mute Notification OpenInventory OpenUserLog OverBudget PathToReference Pause PlaceActorAtMe PlaceAtMe Play PlayAndWait PlayAnimation PlayAnimationAndWait PlayBink PlayerKnows PlayerMoveToAndWait PlayerPayCrimeGold PlayGamebryoAnimation PlayIdle PlayIdleWithTarget PlayImpactEffect PlaySubGraphAnimation PlaySyncedAnimationAndWaitSS PlaySyncedAnimationSS PlayTerrainEffect PopTo pow PrecacheCharGen PrecacheCharGenClear Preload ProcessTrapHit PushActorAway QueryStat QuitGame QuitToMainMenu RadiansToDegrees RandomFloat RandomInt RegisterForAnimationEvent RegisterForLOS RegisterForSingleLOSGain RegisterForSingleLOSLost RegisterForSingleUpdate RegisterForSingleUpdateGameTime RegisterForSleep RegisterForTrackedStatsEvent RegisterForUpdate RegisterForUpdateGameTime ReleaseOverride RemoteCast Remove RemoveAddedForm RemoveAllInventoryEventFilters RemoveAllItems RemoveCrossFade RemoveDependentAnimatedObjectReference RemoveFromAllFactions RemoveFromFaction RemoveHavokConstraints RemoveInventoryEventFilter RemoveItem RemovePerk RemoveShout RemoveSpell RequestAutoSave RequestModel RequestSave Reset ResetHealthAndLimbs ResetHelpMessage RestoreActorValue Resurrect Revert Say SendAnimationEvent SendAssaultAlarm SendPlayerToJail SendStealAlarm SendStoryEvent SendStoryEventAndWait SendTrespassAlarm SendWereWolfTransformation ServeTime SetActive SetActorCause SetActorOwner SetActorValue SetAlert SetAllowFlying SetAllowFlyingEx SetAllowFlyingMountLandingRequests SetAlly SetAlpha SetAngle SetAnimationVariableBool SetAnimationVariableFloat SetAnimationVariableInt SetAttackActorOnSight SetBeastForm SetBribed SetCameraTarget SetCleared SetCrimeFaction SetCrimeGold SetCrimeGoldViolent SetCriticalStage SetCurrentStageID SetDestroyed SetDoingFavor SetDontMove SetEnemy SetEssential SetExpressionOverride SetEyeTexture SetFactionOwner SetFactionRank SetFogColor SetFogPlanes SetFogPower SetFootIK SetForcedLandingMarker SetFrequency SetGhost SetGodMode SetHeadTracking SetHudCartMode SetInChargen SetINIBool SetINIFloat SetINIInt SetINIString SetInstanceVolume SetIntimidated SetInvulnerable SetKeywordData SetLockLevel SetLookAt SetMotionType SetNoBleedoutRecovery SetNoFavorAllowed SetNotShowOnStealthMeter SetObjectiveCompleted SetObjectiveDisplayed SetObjectiveFailed SetOpen SetOutfit SetPlayerAIDriven SetPlayerControls SetPlayerEnemy SetPlayerExpelled SetPlayerReportCrime SetPlayerResistingArrest SetPlayerTeammate SetPosition SetProtected SetPublic SetRace SetReaction SetRelationshipRank SetRestrained SetScale SetSittingRotation SetSubGraphFloatVariable SetSunGazeImageSpaceModifier SetUnconscious SetValue SetVehicle SetVoiceRecoveryTime SetVolume ShakeCamera ShakeController Show ShowAsHelpMessage ShowBarterMenu ShowFirstPersonGeometry ShowGiftMenu ShowLimitedRaceMenu ShowRaceMenu ShowRefPosition ShowTitleSequenceMenu ShowTrainingMenu sin SplineTranslateTo SplineTranslateToRefNode sqrt Start StartCannibal StartCombat StartDeferredKill StartFrameRateCapture StartObjectProfiling StartScriptProfiling StartSneaking StartStackProfiling StartTitleSequence StartVampireFeed Stop StopCombat StopCombatAlarm StopInstance StopObjectProfiling StopScriptProfiling StopStackProfiling StopTranslation TakeScreenshot tan TeachWord TetherToHorse ToggleAI ToggleCollisions ToggleMenus Trace TraceStack TraceUser TranslateTo TrapSoul TriggerScreenBlood UnequipAll UnequipItem UnequipItemSlot UnequipShout UnequipSpell Unload UnLockOwnedDoorsInCell UnlockWord UnMute UnPause UnregisterForAnimationEvent UnregisterForLOS UnregisterForSleep UnregisterForTrackedStatsEvent UnregisterForUpdate UnregisterForUpdateGameTime UpdateCurrentInstanceGlobal UsingGamepad Wait WaitForAnimationEvent WaitGameTime WaitMenuMode WillIntimidateSucceed WornHasKeyword

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

" Basic Skyrim Events
syn keyword papyrusEvent OnActivate OnAnimationEvent OnAnimationEventUnregistered OnAttachedToCell OnBeginState OnCellAttach OnCellDetach OnCellLoad OnClose OnCombatStateChanged OnContainerChanged OnDeath OnDestructionStageChanged OnDetachedFromCell OnDying OnEffectFinish OnEffectStart OnEndState OnEnterBleedout OnEquipped OnGainLOS OnGetUp OnInit OnGrab OnHit OnItemAdded OnItemRemoved OnLoad OnLocationChange OnLockStateChanged OnLostLOS OnMagicEffectApply OnObjectEquipped OnObjectUnequipped OnOpen OnPackageChange OnPackageEnd OnPackageStart OnPlayerBowShot OnPlayerLoadGame OnRaceSwitchComplete OnRead OnRelease OnReset OnSell OnSit OnSleepStart OnSleepStop OnSpellCast OnStoryActivateActor OnStoryAddToPlayer OnStoryArrest OnStoryAssaultActor OnStoryBribeNPC OnStoryCastMagic OnStoryChangeLocation OnStoryCraftItem OnStoryCrimeGold OnStoryCure OnStoryDialogue OnStoryDiscoverDeadBody OnStoryEscapeJail OnStoryFlatterNPC OnStoryHello OnStoryIncreaseLevel OnStoryIncreaseSkill OnStoryInfection OnStoryIntimidateNPC OnStoryJail OnStoryKillActor OnStoryNewVoicePower OnStoryPayFine OnStoryPickLock OnStoryPlayerGetsFavor OnStoryRelationshipChange OnStoryRemoveFromPlayer OnStoryScript OnStoryServedTime OnStoryTrespass OnTrackedStatsEvent OnTranslationAlmostComplete OnTranslationComplete OnTranslationFailed OnTrapHit OnTrapHitStart OnTrapHitStop OnTrigger OnTriggerEnter OnTriggerLeave OnUnequipped OnUnload OnUpdate OnUpdateGameTime OnWardHit

" SKSE Events
syn keyword papyrusEvent OnActorAction OnControlDown OnControlUp OnCrosshairRefChange OnKeyDown OnKeyUp OnMenuClose OnMenuOpen OnNiNodeUpdate OnPlayerCameraState

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
