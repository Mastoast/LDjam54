monster_map = { chair, ghost, skeleton, vampire, wolf, witch, table }

function load_level_from_map(level)
    local lmap = level.map
    for i=lmap.x,lmap.x + 15 do
        for j=lmap.y,lmap.y + 15 do
            local coord = {x = i*8 - lmap.x*8, y = j*8 - lmap.y*8 }
            local bitmap = fget(mget(i, j))
            --
            if fget(mget(i, j), 0) then create(chair, coord.x, coord.y) end
        end
    end
    for i=lmap.x,lmap.x + 15 do
        for j=lmap.y,lmap.y + 15 do
            local coord = {x = i*8 - lmap.x*8, y = j*8 - lmap.y*8 }
            local bitmap = fget(mget(i, j))
            --
            for index=1, #monster_map do
                if (bitmap & (1 << index)) != 0 then
                    local new = create(monster_map[index+1], coord.x, coord.y)
                    new.radius = level.radius
                end
            end
        end
    end
end

level0 = { radius = 256 }
function level0.init(self)
    create(chair, 32, 32)
    create(chair, 50, 32)
    create(chair, 32, 50)
    create(chair, 50, 50)
    create(ghost, 32, 100)
    create(ghost, 60, 100)
    create(skeleton, 90, 55)
    create(vampire, 16, 100)
    create(wolf, 48, 16)
    create(witch, 12, 16)
    for o in all(objects) do
        o.radius = self.radius
    end
end

level1_1 = { radius = 256 }
function level1_1.init(self)
    create(chair, 56, 56)
    create(skeleton, 90, 55)
    for o in all(objects) do
        o.radius = self.radius
    end
end

level1_2 = { radius = 20, map = {x = 16, y = 0} }
function level1_2.init(self)
    load_level_from_map(self)
end

level1_3 = { radius = 20, map = {x = 48, y = 0} }
function level1_3.init(self)
    load_level_from_map(self)
end


level1_4 = { radius = 20, map = {x = 32, y = 0} }
function level1_4.init(self)
    load_level_from_map(self)
end

level2_1 = { radius = 20, map = {x = 64, y = 0} }
function level2_1.init(self)
    load_level_from_map(self)
end

level2_2 = { radius = 20, map = {x = 80, y = 0} }
function level2_2.init(self)
    load_level_from_map(self)
end

level2_3 = { radius = 20, map = {x = 96, y = 0} }
function level2_3.init(self)
    load_level_from_map(self)
end

level2_4 = { radius = 40, map = {x = 112, y = 0} }
function level2_4.init(self)
    load_level_from_map(self)
end

level3_1 = { radius = 40, map = {x = 0, y = 16} }
function level3_1.init(self)
    load_level_from_map(self)
end

level3_2 = { radius = 30, map = {x = 16, y = 16} }
function level3_2.init(self)
    load_level_from_map(self)
end

level3_3 = { radius = 20, map = {x = 32, y = 16} }
function level3_3.init(self)
    load_level_from_map(self)
end

level3_4 = { radius = 30, map = {x = 48, y = 16} }
function level3_4.init(self)
    load_level_from_map(self)
end

level3_5 = { radius = 20, map = {x = 64, y = 16} }
function level3_5.init(self)
    load_level_from_map(self)
end

level3_6 = { radius = 35, map = {x = 96, y = 16} }
function level3_6.init(self)
    load_level_from_map(self)
end

level3_7 = { radius = 40, map = {x = 80, y = 16} }
function level3_7.init(self)
    load_level_from_map(self)
end

