local QBCore = exports['qb-core']:GetCoreObject()
local usingItem = false

local function notify(data)
    lib.notify(data)
end

local function relieveStress(amount)
    if not Config.Stress.Enabled then return end
    if not Config.Stress.Event or Config.Stress.Event == '' then return end
    TriggerServerEvent(Config.Stress.Event, amount)
end

local function smokeCigarette()
    if usingItem then
        notify({
        type = 'error',
        description = Config.Notify.AlreadyBusy
        })
        return
    end

    usingItem = true

    local success = lib.progressBar({
        duration = Config.Progress.Cigarette,
        label = Config.Notify.Smoking,
        useWhileDead = false,
        canCancel = true,
        disable = {
        move = false,
        car = true,
        combat = true,
        mouse = false,
        sprint = true
        },
        anim = {
        dict = Config.Animations.Cigarette.dict,
        clip = Config.Animations.Cigarette.clip,
        flag = Config.Animations.Cigarette.flag
        },
        prop = {
        model = Config.Animations.Cigarette.prop.model,
        bone = Config.Animations.Cigarette.prop.bone,
        pos = Config.Animations.Cigarette.prop.pos,
        rot = Config.Animations.Cigarette.prop.rot
        }
    })

    usingItem = false

    if not success then
        notify({
        type = 'error',
        description = Config.Notify.Cancelled
        })
        return
    end
    TriggerServerEvent('onyx-smoke:server:consumeItem', Config.Items.Cigarette)
    relieveStress(Config.Stress.CigaretteAmount)
end

local function useSnus()
    if usingItem then
        notify({
        type = 'error',
        description = Config.Notify.AlreadyBusy
        })
        return
    end

    usingItem = true

    local success = lib.progressBar({
        duration = Config.Progress.Snus,
        label = Config.Notify.UsingSnus,
        useWhileDead = false,
        canCancel = true,
        disable = {
        move = false,
        car = true,
        combat = true,
        mouse = false,
        sprint = true
        },
        anim = {
        dict = Config.Animations.Snus.dict,
        clip = Config.Animations.Snus.clip,
        flag = Config.Animations.Snus.flag
        }
    })

    usingItem = false

    if not success then
        notify({
        type = 'error',
        description = Config.Notify.Cancelled
        })
        return
    end

    TriggerServerEvent('onyx-smoke:server:consumeItem', Config.Items.Snus)
    relieveStress(Config.Stress.SnusAmount)
end

local function openPack(itemName) TriggerServerEvent('onyx-smoke:server:openPack', itemName) end

exports('cigarettePack', function() openPack(Config.Items.CigarettePack) end)
exports('snusPack', function() openPack(Config.Items.SnusPack) end)
exports('cigarette', function() smokeCigarette() end)
exports('snus', function() useSnus() end)