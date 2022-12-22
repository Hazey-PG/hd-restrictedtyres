------------------------
-- hd-restrictedtyres --
------------------------

showMessage = true -- Enable/Disable
restrictMessage = "~r~Theese Tires is BANNABLE!." -- Message displayed

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end
-- Determines What tires are on the vehicle
Citizen.CreateThread(function()

    while true do
        Citizen.Wait(500)
        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsUsing(ped)
        
        if IsPedInAnyVehicle(ped, false) then
            if not GetVehicleTyresCanBurst(veh) then
                SetVehicleTyresCanBurst(veh, true)
                if showMessage then
                    ShowNotification(restrictMessage)
                end
            end
        end
	end
end)