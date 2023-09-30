local RSGCore = exports['rsg-core']:GetCoreObject()

Main = {}
local inside = false

CreateThread(function()
    Main:Int()
end)

function Main:Int()
    exports['rsg-target']:AddTargetModel(Config.haybale.Model, {
        options = {
            {
                event = 'rsg:hidein:enter',
                type = 'client',
                icon = "fa-user-circle-o",
                label = Lang.Hide,
            },
            {
                event = 'rsg:hidein:exit',
                type = 'client',
                icon = "fa-user-circle-o",
                label = Lang.Exit,
            },
        },
        distance = Config.haybale.Distance,
    })
end

RegisterNetEvent('rsg:hidein:enter',function()
    Main:Enter()
end)

RegisterNetEvent('rsg:hidein:exit',function()
    Main:Exit()
end)

function Main:Enter()
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(PlayerPedId())
    for k,v in pairs(Config.haybale.Model) do
        local objectId = GetClosestObjectOfType(pedCoords, Config.haybale.Distance, Config.haybale.Model[k], false)
        if DoesEntityExist(objectId) then
            inside = true
            local objectcoords = GetEntityCoords(objectId)
            oldcoords = GetEntityCoords(ped)
            SetEntityCoords(ped, objectcoords.x, objectcoords.y, objectcoords.z, 0.0, 0.0, 0.0)
            FreezeEntityPosition(ped, true)
            SetEntityVisible(ped, false)
            return
        end
    end
end

function Main:Exit()
    local ped = PlayerPedId()
    if not inside then 
        self:Notify(Lang.NotInside)
        return
    end
    inside = false
    SetEntityCoords(ped,oldcoords.x,oldcoords.y,oldcoords.z - 1)
    FreezeEntityPosition(ped, false)
    SetEntityVisible(ped, true)
end


