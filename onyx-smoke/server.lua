local QBCore = exports['qb-core']:GetCoreObject()

local function notify(source, notifType, description)
  TriggerClientEvent('ox_lib:notify', source, {
  type = notifType,
  description = description
    })
end

RegisterNetEvent('onyx-smoke:server:openPack', function(itemName)
    local src = source

if itemName == Config.Items.CigarettePack then
    local count = exports.ox_inventory:Search(src, 'count', Config.Items.CigarettePack)

    if count < 1 then
        notify(src, 'error', Config.Notify.MissingItem)
        return
    end

    local canCarry = exports.ox_inventory:CanCarryItem(src, Config.Items.Cigarette, Config.Amounts.CigarettesPerPack)

    if not canCarry then
        notify(src, 'error', Config.Notify.NotEnoughSpace)
        return
    end

    local removed = exports.ox_inventory:RemoveItem(src, Config.Items.CigarettePack, 1)

    if not removed then
        notify(src, 'error', Config.Notify.MissingItem)
        return
    end

    exports.ox_inventory:AddItem(src, Config.Items.Cigarette, Config.Amounts.CigarettesPerPack)
    notify(src, 'success', Config.Notify.OpenedCigarettePack)
    return
end

if itemName == Config.Items.SnusPack then
    local count = exports.ox_inventory:Search(src, 'count', Config.Items.SnusPack)

    if count < 1 then
        notify(src, 'error', Config.Notify.MissingItem)
        return
    end

    local canCarry = exports.ox_inventory:CanCarryItem(src, Config.Items.Snus, Config.Amounts.SnusPerPack)

    if not canCarry then
        notify(src, 'error', Config.Notify.NotEnoughSpace)
        return
    end

    local removed = exports.ox_inventory:RemoveItem(src, Config.Items.SnusPack, 1)
        
    if not removed then
        notify(src, 'error', Config.Notify.MissingItem)
        return
    end

    exports.ox_inventory:AddItem(src, Config.Items.Snus, Config.Amounts.SnusPerPack)
    notify(src, 'success', Config.Notify.OpenedSnusPack)
   end
end)

RegisterNetEvent('onyx-smoke:server:consumeItem', function(itemName)
  local src = source

if itemName ~= Config.Items.Cigarette and itemName ~= Config.Items.Snus then
    return
end

local count = exports.ox_inventory:Search(src, 'count', itemName)
  if count < 1 then
    notify(src, 'error', Config.Notify.MissingItem)
    return
    end
    exports.ox_inventory:RemoveItem(src, itemName, 1)
end)