minetest.register_globalstep(function()
    local player = minetest.localplayer
    
    if minetest.settings:get_bool("blockarrow") then
        for _, obj in ipairs(minetest.get_objects_inside_radius(player:get_pos(), 4)) do
            local block = true

            if obj:is_local_player() then
                block = false
            end
            
            if obj:is_player() then
                block = false
            end
            
            if obj:get_item_textures() == "mcl_bows:arrow_box.png" then
                block = false
            end

            if block then
                minetest.place_node(obj:get_pos())
            end
        end
    end

end)

minetest.register_cheat("BlockArrow", "Combat", "blockarrow")
