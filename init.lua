--loading all other files
dofile(minetest.get_modpath("player_particels").."/globalstep.lua")

minetest.register_on_joinplayer(function(player)
	if player:get_attribute("player_particels") == nil then
		player:set_attribute("player_particels", "none")
	end
end)


minetest.register_chatcommand("set_particels", {
    description = "Allows you to set a walking particel",
    privs = {interact=true},
    func = function(name, param) 
        local player = minetest.get_player_by_name(name)

        if player == nil then 
            minetest.chat_send_all("Something went wrong pls report it to the admin")
            return
        end
        if param == nil then
            minetest.chat_send_player(name, "Param is missing")
            return
        end
        if param == "fire" or param == "none" or param == "water" or param == "diamond" or param == "firework" then
            player:set_attribute("player_particels", param)
            minetest.chat_send_player(name, minetest.colorize("#0000ff", "Your Particels got updated to "..param..""))
        else 
            minetest.chat_send_player(name, minetest.colorize("#ff0000", "Unknown Particel use fire, water, none"))
        end
    end 
})


--Maybe making in the future a priv for set_player_particels
minetest.register_chatcommand("set_player_particels", {
    description = "Allows you to set a player's particels",
    privs = {server=true},
    func = function(name, param)
        local target = param:split(' ')[1]
        local player = minetest.get_player_by_name(name)
        local particel = param:split(' ')[2]
        if target == nil then
            minetest.chat_send_player(name, "Pleas set a playername first")
            return
        end
        if player == nil then 
            minetest.chat_send_player(name, "Invaild Player name Player has to be online")
            return
        end
        if not particel == "fire" or particel == "none" or particel == "water" or particel == "diamond" or particel == "firework" then
            minetest.chat_send_player(name, "Invaild Particels pleas use fire, water or none")
            return
        end
        if target ~= nil and player ~= nil then
            player:set_attribute("player_particels", particel)
        else
            return false
        end
    end
})


