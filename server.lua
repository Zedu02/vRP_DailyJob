local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
MySQL = module("vrp_mysql", "MySQL")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_alogin")

vRPdaily = {}
Tunnel.bindInterface("vRP_daily",vRPdaily)
Proxy.addInterface("vRP_daily",vRPdaily)
math.randomseed(os.time())
local jobs = {
	"UBER",
	"Sofer Autobuz",
	"Mecanic",
	"Curier Mancare Romaneasca",
	"Fan Courier",
	"Food Panda",
	"Gunoier"
}

local jobulzilei = jobs[math.random(1 , #jobs)]
local suma = math.random(1 , 5000)

AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
	if first_spawn then
		TriggerClientEvent('TN:UPDATEJOB' , source , jobulzilei)
		TriggerClientEvent('TN:UPDATESUMA' , source , suma)
	end
end)

function vRPdaily.hasDailyJob(user_id)
	if(vRP.hasGroup({user_id , jobulzilei})) then
		return true
	end
	return false
end

function vRPdaily.giveJobBonus(user_id)
	if vRPdaily.hasDailyJob(user_id) then
		vRP.giveMoney({user_id , suma})
		vRPclient.notify(vRP.getUserSource({user_id}) , {"[~b~Job Bonus~w~] ~g~Ai primit ~w~"..suma.."$"})
	end
end

RegisterCommand('updatejob', function(source, args, msg)
	if(#args > 0) then
		jobulzilei = args[1]
		suma = math.random(1 , 5000)
		TriggerClientEvent('TN:UPDATESUMA' , -1 , suma)
		TriggerClientEvent('TN:UPDATEJOB' , -1 , jobulzilei)
		vRPclient.notify(source , {"[~b~Daily Job~w~] ~g~Ai updatat jobul\n~b~Acum este ~w~"..jobulzilei})
	else
		jobulzilei = jobs[math.random(1 , #jobs)]
		suma = math.random(1 , 5000)
		TriggerClientEvent('TN:UPDATEJOB' , -1 , jobulzilei)
		TriggerClientEvent('TN:UPDATESUMA' , -1 , suma)
		vRPclient.notify(source , {"[~b~Daily Job~w~] ~g~Ai updatat jobul\n~b~Acum este ~w~"..jobulzilei})
	end
end)