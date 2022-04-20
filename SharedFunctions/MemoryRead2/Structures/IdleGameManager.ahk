class IdleGameManager_Parent extends System.StaticBase
{
    Offset := MemoryReader.Reader.isTarget64bit ? 0x491A90 : 0x3A0574
}

;instance := new IdleGameManager
class IdleGameManager extends GameManager
{
    ;FB-IdleGameManager
    game := new CrusadersGame.Game(160, 216, this)
    ;FE
    
    __new()
    {
        this.Offset := MemoryReader.Reader.isTarget64bit ? 0xC88 : 0x658
        this.GetAddress := this.variableGetAddress
        this.ParentObj := new IdleGameManager_Parent
        return this
    }
}

;base class UnityEngine.MonoBehaviour
class GameManager extends System.Object
{
    ;FB-GameManager
    TimeScale := new System.Single(72, 128, this)
    ;FE
}

class CrusadersGame
{
    class ChampionsGameInstance extends System.Object
    {
        ;FB-CrusadersGame.ChampionsGameInstance
        Screen := new CrusadersGame.GameScreen.CrusadersGameScreen(8, 16, this)
        Controller := new CrusadersGame.GameScreen.CrusadersGameController(12, 24, this)
        ActiveCampaignData := new CrusadersGame.GameScreen.ActiveCampaignData(16, 32, this)
        HeroHandler := new CrusadersGame.User.Instance.UserInstanceHeroHandler(20, 40, this)
        ResetHandler := new CrusadersGame.User.Instance.UserInstanceResetHandler(28, 56, this)
        PatronHandler := new CrusadersGame.User.Instance.UserInstancePatronHandler(40, 80, this)
        FormationSaveHandler := new CrusadersGame.User.UserInstanceFormationSaveHandler(48, 96, this)
        offlineProgressHandler := new OfflineProgressHandler(64, 128, this)
        ResetsSinceLastManual := new System.Int32(136, 268, this)
        instanceLoadTimeSinceLastSave := new System.Int32(144, 276, this)
        ClickLevel := new System.Int32(156, 288, this)
        ;FE
    }

    class Defs
    {
        class AdventureDef extends UnityGameEngine.Data.DataDef
        {
            ;inherits id
        }

        class AttackDef extends UnityGameEngine.Data.DataDef
        {
            ;FB-CrusadersGame.Defs.AttackDef
            CooldownTimer := new System.Single(120, 176, this)
            ;FE
        }

        class EffectDef extends UnityGameEngine.Data.DataDef
        {
            ;inherits id
        }

        class HeroDef extends UnityGameEngine.Data.DataDef
        {
            ;FB-CrusadersGame.Defs.HeroDef
            name := new System.String(24, 48, this)
            SeatID := new System.Int32(248, 384, this)
            ;FE
        }

        class FormationSaveV2Def extends UnityGameEngine.Data.DataDef
        {
            ;FB-CrusadersGame.Defs.FormationSaveV2Def
            Formation := new System.List(12, 24, this, System.Int32)
            SaveID := new System.Int32(28, 56, this)
            Name := new System.String(24, 48, this)
            Favorite := new System.Int32(36, 64, this)
            ;FE
        }

        class PatronDef extends UnityGameEngine.Data.DataDef
        {
            ;FB-CrusadersGame.Defs.PatronDef
            Tier := new System.Int32(112, 192, this)
            ;FE
        }

        class UpgradeDef extends UnityGameEngine.Data.DataDef
        {
            ;FB-CrusadersGame.Defs.UpgradeDef
            SpecializationName := new System.String(32, 64, this)
            RequiredLevel := new System.Int32(76, 124, this)
            RequiredUpgradeID := new System.Int32(84, 132, this)
            SpecializationGraphic := new System.Int32(88, 136, this)
            ;FE
        }
    }

    class Effects
    {
        class ActiveEffectKeyHandler extends System.Object
        {

        }


        class Effect extends System.Object
        {
            ;FB-CrusadersGame.Effects.Effect
            def := new CrusadersGame.Defs.EffectDef(8, 16, this)
            effectKeyHandlers := new System.List(28, 56, this, CrusadersGame.Effects.EffectKeyHandler)
            ;FE
        }


        class EffectKey extends System.Object
        {
            ;FB-CrusadersGame.Effects.EffectKey
            parentEffectKeyHandler := new CrusadersGame.Effects.EffectKeyHandler(8, 16, this)
            ;FE
        }


        class EffectKeyCollection extends System.Object
        {
            ;FB-CrusadersGame.Effects.EffectKeyCollection
            effectKeysByKeyName := new System.Dictionary(44, 88, this, System.String, [System.List, CrusadersGame.Effects.EffectKey])
            ;FE
        }


        class EffectKeyHandler extends System.Object
        {
            ;FB-CrusadersGame.Effects.EffectKeyHandler
            parent := new CrusadersGame.Effects.Effect(8, 16, this)
            activeEffectHandlers := new System.List(148, 296, this, CrusadersGame.Effects.ActiveEffectKeyHandler)
            ;FE
        }


        class EffectStacks extends System.Object
        {
            ;FB-CrusadersGame.Effects.EffectStacks
            stackCount := new System.Double(88, 152, this)
            ;FE
        }
    }

    class Game extends UnityGameEngine.GameBase
    {
        ;FB-CrusadersGame.Game
        gameUser := new UnityGameEngine.UserLogin.GameUser(84, 168, this)
        gameInstances := new System.List(88, 176, this, CrusadersGame.ChampionsGameInstance)
        gameStarted := new System.Boolean(124, 248, this)
        ;FE
    }

    class GameScreen
    {
        class ActiveCampaignData extends System.Object
        {
            ;FB-CrusadersGame.GameScreen.ActiveCampaignData
            currentObjective := new CrusadersGame.Defs.AdventureDef(12, 24, this)
            currentArea := new CrusadersGame.GameScreen.AreaLevel(20, 40, this)
            currentAreaID := new System.Int32(68, 136, this)
            highestAvailableAreaID := new System.Int32(76, 144, this)
            gold := new System.Int64(528, 600, this) ;OR-TYPE
            ;FE
        }

        class Area extends System.Object
        {
            ;FB-CrusadersGame.GameScreen.Area
            activeMonsters := new System.List(36, 72, this, CrusadersGame.GameScreen.Monster)
            Active := new System.Boolean(244, 480, this)
            secondsSinceStarted := new System.Single(276, 516, this)
            basicMonstersSpawnedThisArea := new System.Int32(336, 576, this)
            ;FE
        }

        class AreaLevel extends System.Object
        {
            ;FB-CrusadersGame.GameScreen.AreaLevel
            level := new System.Int32(40, 76, this)
            QuestRemaining := new System.Int32(48, 84, this)
            ;FE
        }

        class AreaTransitioner extends System.Object
        {
            ;FB-CrusadersGame.GameScreen.AreaTransitioner
            IsTransitioning := new System.Boolean(28, 56, this)
            transitionDirection := new CrusadersGame.GameScreen.AreaTransitioner.AreaTransitionDirection(32, 60, this)
            ;FE

            class AreaTransitionDirection extends System.Enum
            {
                Type := "System.Int32"
                Enum := {0:"Forward", 1:"Backward", 2:"Static"}
            }
        }

        class CrusadersGameController extends System.Object
        {
            ;FB-CrusadersGame.GameScreen.CrusadersGameController
            area := new CrusadersGame.GameScreen.Area(12, 24, this)
            formation := new CrusadersGame.GameScreen.Formation(20, 40, this)
            areaTransitioner := new CrusadersGame.GameScreen.AreaTransitioner(32, 64, this)
            userData := new CrusadersGame.User.UserData(80, 160, this)
            ;FE
        }

        class CrusadersGameScreen extends UnityGameEngine.GameScreenController.GameScreen
        {
            ;FB-CrusadersGame.GameScreen.CrusadersGameScreen
            uiController := new CrusadersGame.GameScreen.UIController(624, 936, this)
            ;FE
        }

        class Formation extends System.Object
        {
            ;FB-CrusadersGame.GameScreen.Formation
            slots := new System.List(12, 24, this, CrusadersGame.GameScreen.FormationSlot)
            transitionOverrides := new System.Dictionary(84, 168, this, CrusadersGame.GameScreen.Formations.FormationSlotRunHandler.TransitionDirection, [System.ListSystem.Action<System.Action])
            transitionDir := new CrusadersGame.GameScreen.Formations.FormationSlotRunHandler.TransitionDirection(224, 396, this)
            inAreaTransition := new System.Boolean(228, 400, this)
            numAttackingMonstersReached := new System.Int32(236, 408, this)
            numRangedAttackingMonsters := new System.Int32(240, 412, this)
            ;FE
        }

        class Formations
        {
            class FormationSlotRunHandler
            {
                class TransitionDirection extends System.Enum
                {
                    Type := "System.Int32"
                    Enum := {0:"OnFromLeft", 1:"OnFromRight", 2:"OffToLeft", 3:"OffToRight"}
                }
            }
        }

        class FormationSlot extends System.Object
        {
            ;FB-CrusadersGame.GameScreen.FormationSlot
            hero := new CrusadersGame.GameScreen.Hero(20, 40, this)
            heroAlive := new System.Boolean(337, 593, this)
            ;FE
        }


        class Hero extends System.Object
        {
            ;FB-CrusadersGame.GameScreen.Hero
            def := new CrusadersGame.Defs.HeroDef(12, 24, this)
            effects := new CrusadersGame.Effects.EffectKeyCollection(64, 128, this)
            allUpgradesOrdered := new System.Dictionary(268, 536, this, CrusadersGame.ChampionsGameInstance, [System.List, CrusadersGame.Defs.UpgradeDef])
            effectsByUpgradeId := new System.Dictionary(284, 568, this, System.Int32, [System.List, CrusadersGame.Effects.Effect])
            Owned := new System.Boolean(384, 748, this)
            slotID := new System.Int32(388, 752, this)
            Benched := new System.Boolean(400, 764, this)
            Level := new System.Int32(428, 792, this)
            health := new System.Double(480, 848, this)
            ;FE
        }

        class Monster extends UnityGameEngine.Display.Drawable
        {
            ;FB-CrusadersGame.GameScreen.Monster
            active := new System.Boolean(1865, 2601, this)
            ;FE
        }

        class UIComponents
        {
            class TopBar
            {
                ;class ObjectiveProgress
                ;{
                    class AreaLevelBar extends UnityGameEngine.Display.Drawable
                    {
                        ;FB-CrusadersGame.GameScreen.UIComponents.TopBar.ObjectiveProgress.AreaLevelBar
                        autoProgressButton := new UnityGameEngine.Display.DrawableButton(576, 848, this)
                        ;FE
                    }

                    class ObjectiveProgressBox extends UnityGameEngine.Display.Drawable
                    {
                        ;FB-CrusadersGame.GameScreen.UIComponents.TopBar.ObjectiveProgress.ObjectiveProgressBox
                        areaBar := new CrusadersGame.GameScreen.UIComponents.TopBar.AreaLevelBar(600, 896, this) ;OR-TYPE
                        ;FE
                    }
                ;}

                class TopBar extends UnityGameEngine.Display.Drawable
                {
                    ;FB-CrusadersGame.GameScreen.UIComponents.TopBar.TopBar
                    objectiveProgressBox := new CrusadersGame.GameScreen.UIComponents.TopBar.ObjectiveProgressBox(572, 840, this) ;OR-TYPE
                    ;FE
                }
            }

            class UltimatesBar
            {
                class UltimatesBar extends UnityGameEngine.Display.Drawable
                {
                    ;FB-CrusadersGame.GameScreen.UIComponents.UltimatesBar.UltimatesBar
                    ultimateItems := new System.List(608, 912, this, CrusadersGame.GameScreen.UIComponents.UltimatesBar.UltimatesBarItem)
                    ;FE
                }

                class UltimatesBarItem extends UnityGameEngine.Display.Drawable
                {
                    ;FB-CrusadersGame.GameScreen.UIComponents.UltimatesBar.UltimatesBarItem
                    hero := new CrusadersGame.GameScreen.Hero(600, 896, this)
                    ;FE
                }
            }
        }


        class UIController extends System.Object
        {
            ;FB-CrusadersGame.GameScreen.UIController
            topBar := new CrusadersGame.GameScreen.UIComponents.TopBar.TopBar(12, 24, this)
            ultimatesBar := new CrusadersGame.GameScreen.UIComponents.UltimatesBar.UltimatesBar(20, 40, this)
            ;FE
        }
    }

    class User
    {
        class Instance
        {
            class UserInstanceDataHandler extends System.Object
            {

            }

            class UserInstanceHeroHandler extends CrusadersGame.User.Instance.UserInstanceDataHandler
            {
                ;FB-CrusadersGame.User.Instance.UserInstanceHeroHandler
                parent := new CrusadersGame.User.UserHeroHandler(36, 72, this)
                ;FE
            }

            class UserInstancePatronHandler extends CrusadersGame.User.Instance.UserInstanceDataHandler
            {
                ;FB-CrusadersGame.User.Instance.UserInstancePatronHandler
                ActivePatron := new CrusadersGame.Defs.PatronDef(16, 32, this)
                ;FE
            }

            class UserInstanceResetHandler extends CrusadersGame.User.Instance.UserInstanceDataHandler
            {
                ;FB-CrusadersGame.User.Instance.UserInstanceResetHandler
                resetting := new System.Boolean(28, 56, this)
                tries := new System.Int32(32, 60, this)
                ;FE
            }
        }

        class UserData extends System.Object
        {
            ;FB-CrusadersGame.User.UserData
            HeroHandler := new CrusadersGame.User.UserHeroHandler(8, 16, this)
            StatHandler := new CrusadersGame.User.UserStatHandler(24, 48, this)
            ModronHandler := new CrusadersGame.User.UserModronHandler(108, 216, this)
            redRubies := new System.Int32(308, 556, this)
            redRubiesSpent := new System.Int32(312, 560, this)
            inited := new System.Boolean(336, 584, this)
            ActiveUserGameInstance := new System.Int32(356, 604, this)
            ;FE
        }

        ;base object only includes parent (User), so recursive... maybe
        class UserHeroHandler extends System.Object
        {
            ;FB-CrusadersGame.User.UserHeroHandler
            heroes := new System.List(12, 24, this, CrusadersGame.GameScreen.Hero)
            ;FE
        }
        
        class UserDataHandler extends System.Object
        {

        }

        class UserInstanceFormationSaveHandler extends CrusadersGame.User.UserDataHandler
        {
            ;FB-CrusadersGame.User.UserInstanceFormationSaveHandler
            formationSavesV2 := new System.List(24, 48, this, CrusadersGame.Defs.FormationSaveV2Def)
            formationCampaignID := new System.Int32(64, 128, this)
            ;FE
        }

        class UserModronHandler extends CrusadersGame.User.UserDataHandler
        {
            ;FB-CrusadersGame.User.UserModronHandler
            modronSaves := new System.List(16, 32, this, CrusadersGame.User.UserModronHandler.ModronCoreData)
            ;FE

            class ModronCoreData extends System.Object
            {
                ;FB-CrusadersGame.User.UserModronHandler+ModronCoreData
                FormationSaves := new System.Dictionary(12, 24, this, System.Int32, System.Int32)
                CoreID := new System.Int32(36, 72, this)
                InstanceID := new System.Int32(40, 76, this)
                ExpTotal := new System.Int32(44, 80, this)
                targetArea := new System.Int32(48, 84, this)
                ;FE
            }
        }

        class UserStatHandler extends CrusadersGame.User.UserDataHandler
        {
            ;FB-CrusadersGame.User.UserStatHandler
            BlackViperTotalGems := new System.Int32(616, 664, this)
            BrivSteelbonesStacks := new System.Int32(712, 760, this)
            BrivSprintStacks := new System.Int32(716, 764, this)
            ;FE
        }
    }
}

class OfflineProgressHandler extends System.Object
{
    ;FB-OfflineProgressHandler
    modronSave := new CrusadersGame.User.UserModronHandler.ModronCoreData(32, 64, this)
    monstersSpawnedThisArea := new System.Int32(160, 216, this)
    inGameNumSecondsToProcess := new System.Int32(180, 236, this)
    finishedOfflineProgressType := new OfflineProgressHandler.OfflineCompleteType(268, 324, this)
    ;FE

    class OfflineCompleteType extends System.Enum
    {
        Type := "System.Int32"
        Enum := {0:"Canceled", 1:"FinishedFullTime", 2:"FinishedPartialTimeWithReset"}
    }
}

class UnityGameEngine
{
    class Data
    {
        class DataDef extends System.Object
        {
            ;FB-UnityGameEngine.Data.DataDef
            ID := new System.Int32(8, 16, this)
            ;FE
        }
    }

    class Display
    {
        class DrawableButton extends UnityGameEngine.Display.Drawable
        {
            ;FB-UnityGameEngine.Display.DrawableButton
            toggled := new System.Boolean(634, 930, this)
            ;FE
        }


        class Drawable extends System.Object
        {

        }
    }

    class GameBase extends System.Object
    {
        ;FB-UnityGameEngine.GameBase
        screenController := new UnityGameEngine.GameScreenController.ScreenController(8, 16, this)
        ;FE
    }

    class GameScreenController
    {
        class GameScreen extends System.Object
        {
            ;FB-UnityGameEngine.GameScreenController.GameScreen
            currentScreenWidth := new System.Int32(572, 836, this)
            currentScreenHeight := new System.Int32(576, 840, this)
            ;FE
        }

        class ScreenController extends System.Object
        {
            ;FB-UnityGameEngine.GameScreenController.ScreenController
            activeScreen := new CrusadersGame.GameScreen.CrusadersGameScreen(12, 24, this)  ;OR-TYPE
            ;FE
        }
    }

    class UserLogin
    {
        class GameUser extends System.Object
        {
            ;FB-UnityGameEngine.UserLogin.GameUser
            Hash := new System.String(16, 32, this)
            ID := new System.Int32(48, 88, this)
            ;FE
        }
    }
}
;Processing Time (minutes): 0.615617