function Draw3DText(x,y ,width,height,scale, text, r,g,b,a, outline, font, center)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextCentre(center)
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

local jobgoal = ""
local suma = 0
RegisterNetEvent('TN:UPDATEJOB')
AddEventHandler('TN:UPDATEJOB', function(stfOnl)
	jobgoal = stfOnl
end)
RegisterNetEvent('TN:UPDATESUMA')
AddEventHandler('TN:UPDATESUMA', function(stfOnl)
	suma = stfOnl
end)

Citizen.CreateThread(function()
	while true do
		Wait(3)
		DrawRect(0.946, 0.808, 0.1, 0.05, 0,0,0, 210)
		DrawRect(0.946, 0.808, 0.08, 0.03, 168, 107, 8, 200)
		Draw3DText(0.944, 0.303 + 0.49 - 0.027, 0.0, 0.0, 0.37, "~w~Daily Job", 255, 255, 255, 255, 1, 1, 1)
		Draw3DText(0.944, 0.303 + 0.49, 0.0, 0.0, 0.33,"  ~w~".. tostring(jobgoal).." ~w~+~r~ "..suma.."~w~$" , 255, 255, 255, 255, 1, 7, 1)
	end
end)
