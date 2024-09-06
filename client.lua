local QBCore = exports['qb-core']:GetCoreObject()
local isAiming = false
Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        if IsPedArmed(playerPed, 4) then
            if IsControlPressed(0, 25) and not isAiming then
                SetFollowPedCamViewMode(4)
                isAiming = true
            end
            if isAiming then
                if GetFollowPedCamViewMode() ~= 4 then
                    SetFollowPedCamViewMode(4)
                end
            end
            if not IsControlPressed(0, 25) and isAiming then
                SetFollowPedCamViewMode(1)
                isAiming = false
            end
        end
        Citizen.Wait(0)
    end
end)