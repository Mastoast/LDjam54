function _init()
    -- enable mouse
    poke(0x5f2d, 3)
    cursor_color = 7
    --
    gtime = 0
    ndeath = 0
    freeze_time = 0
    shake = 0
    cam = {x = 0, y = 0}
    printable = 0
    --
    init_level()
end

function init_level()
    gtime = 0
    objects = {}
    particles = {}
    target = nil
    target_x = nil
    target_y = nil
    target_chair = nil
    --
    create(chair, 32, 32)
    create(ghost, 32, 100)
    create(ghost, 60, 100)
    create(chair, 50, 32)
    create(chair, 32, 50)
    create(chair, 50, 50)
    create(skeleton, 90, 55)
    create(vampire, 16, 100)
    create(wolf, 48, 16)
    create(witch, 12, 16)
end

function _update60()
    -- timers
    gtime += 1

    update_level()
end

function update_level()
    -- freeze
    if freeze_time > 0 then
        freeze_time -= 1
        return
    end

    -- screenshake
    shake = max(shake - 1)

    for o in all(objects) do
        if o.freeze > 0 then
            o.freeze -= 1
        else
            o:update()
        end

        if o.base != player and o.destroyed then
            del(objects, o)
        end
    end

    -- player actions
    if btnp(❎) then
        if target then
            release_target()
        else
            pickup_target()
        end
        update_solution()
    end

    if btnp(🅾️) then
        reset_target()
        update_solution()
    end

    if target then
        target.x = stat(32) - target.hit_w /2
        target.y = stat(33) - target.hit_h /2
    end

    for a in all(particles) do
        a:update()
    end

    printable = target_chair
end

function update_solution()
    for o in all(objects) do
        if o.base.base == monster then
            o:update_solution()
        end
    end
end

function pickup_target()
    for o in all(objects) do
        if o.movable and on_cursor(o) then
            if o.chair then
                target_chair = o.chair
                o.chair.user = nil
                o.chair = nil
            end
            target = o
            target_x, target_y = target.x, target.y
            target.picked = true
            break
        end
    end
end

function release_target()
    if not target then return end
    target.picked = false
    for o in all(objects) do
        if o != target and on_cursor(o) then
            if o.base == chair then
                if o.user == nil then
                    o.user = target
                    target.chair = o
                    target.x, target.y = o.x, o.y
                    target, target_x, target_y, target_chair = nil
                    break
                else
                    reset_target()
                end
            elseif o.movable then
                reset_target()
            end
        end
    end
    target, target_x, target_y, target_chair = nil
end

function reset_target()
    if not target then return end
    target.x, target.y = target_x, target_y
    if target_chair then
        target.chair = target_chair
        target.chair.user = target
    end
    target.picked = false
    target, target_x, target_y, target_chair = nil
end

function _draw()
    cls(0)
    
    -- camera
    if shake > 0 then
        camera(cam.x - 2 + rnd(5), cam.y - 2 + rnd(5))
    else
        camera(cam.x, cam.y)
    end

    -- draw map
    map(0, 0, 0, 0, 16, 16)

    -- draw objects
    for o in all(objects) do
        o:draw()
    end

    -- draw particles
    for a in all(particles) do
        a:draw()
    end

    -- UI

    draw_cursor()
    print(printable, cam.x + 80, cam.y + 120, 4)
end

function draw_cursor()
    local pixels = {{x = 0, y = -2}, {x = -2, y = 0}, {x = 2, y = 0}, {x = 0, y = 2}, {x = 0, y = 0}}
    for p in all(pixels) do
        pset(stat(32) + p.x, stat(33) + p.y, cursor_color)
    end
end

-- UTILS

function get_distance(obj1, obj2)
    return sqrt((obj2.x + obj2.hit_w/2 - obj1.x - obj1.hit_w/2)^2 + (obj2.y + obj2.hit_h/2 - obj1.y - obj1.hit_h/2)^2)
end

function on_cursor(object)
    return object:contains(stat(32), stat(33))
end

-- linear interpolation
function lerp(start,finish,t)
    return mid(start,start*(1-t)+finish*t,finish)
end

-- print at center
function print_centered(str, offset_x, y, col)
    print(str, cam.x + 64 - (#str * 2) + offset_x, y, col)
end

-- random range
function rrnd(min, max)
    return flr(min + rnd(max - min))
end

-- find index for element in table
function find_item_table_index(item, table)
    for k, v in pairs(table) do
        if v == item then return k end
    end
    return 0
end