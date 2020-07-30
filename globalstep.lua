local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >= 0.5 then
	timer = 0
		for _,player in pairs(minetest.get_connected_players()) do
			local name = player:get_player_name()
			local pos = player:get_pos()
			if player:get_attribute("player_particels") == "fire" then
				minetest.add_particlespawner({
					amount = 2,
					time = 1,
					minpos = {x=pos.x, y=pos.y, z=pos.z},
					maxpos = {x=pos.x, y=pos.y, z=pos.z},
					minvel = {x=-2, y=0.7, z=-2},
					maxvel = {x=2, y=0.7, z=2},
					minacc = {x=-0,y=0.2,z=-0},
					maxacc = {x=0,y=0.2,z=0},
					minexptime = 1,
					maxexptime = 1,
					minsize = 4,
					maxsize = 4,
					collisiondetection = false,
					vertical = false,
					texture = "fire.png",
					playername = player,
				})
				
            elseif player:get_attribute("player_particels") == "water" then
                minetest.add_particlespawner({
					amount = 2,
					time = 1,
					minpos = {x=pos.x, y=pos.y, z=pos.z},
					maxpos = {x=pos.x, y=pos.y, z=pos.z},
					minvel = {x=-0.5, y=0.7, z=-0.5},
					maxvel = {x=0.5, y=0.7, z=0.5},
					minacc = {x=-0,y=0.2,z=-0},
					maxacc = {x=0,y=0.2,z=0},
					minexptime = 1,
					maxexptime = 1,
					minsize = 2,
					maxsize = 2,
					collisiondetection = false,
					vertical = false,
					texture = "water.png",
					playername = player,
                })
            elseif player:get_attribute("player_particels") == "diamond" then
                minetest.add_particlespawner({
					amount = 1,
					time = 1,
					minpos = {x=pos.x, y=pos.y, z=pos.z},
					maxpos = {x=pos.x, y=pos.y, z=pos.z},
					minvel = {x=-0, y=1, z=-0},
					maxvel = {x=0, y=1, z=0},
					minacc = {x=-0,y=0.2,z=-0},
					maxacc = {x=0,y=0.2,z=0},
					minexptime = 1,
					maxexptime = 1,
					minsize = 4,
					maxsize = 4,
					collisiondetection = false,
					vertical = false,
					texture = "default_diamond.png",
					playername = player,
                })
            elseif player:get_attribute("player_particels") == "firework" then
                minetest.add_particlespawner({
					amount = 2,
					time = 1,
					minpos = {x=pos.x, y=pos.y, z=pos.z},
					maxpos = {x=pos.x, y=pos.y, z=pos.z},
                    minvel = {x=-2, y=2, z=-2},
                    maxvel = {x=2, y=2, z=2},
                    minacc = {x=0, y=-0.2, z=0},
                     maxacc = {x=0, y=-0.6, z=0},
					minexptime = 1,
					maxexptime = 1,
					minsize = 4,
					maxsize = 4,
					collisiondetection = false,
					vertical = false,
					texture = "firework.png",
					playername = player,
                })
            else   
				return false
			end
		end
	end
end)
