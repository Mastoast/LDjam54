rectangle = new_type(0)
rectangle.color = 7

function rectangle.draw(self)
    rectfill(self.x, self.y, self.x + self.hit_w - 1, self.y + self.hit_h - 1, self.color)
end

chair = new_type(16)
chair.sprite_w = 2
chair.sprite_h = 2
chair.hit_w = 16
chair.hit_h = 16

monster = new_type(0)
monster.sprite_w = 2
monster.sprite_h = 2
monster.hit_w = 16
monster.hit_h = 16
monster.movable = true
monster.radius = 20
monster.chair = nil
monster.is_happy = false
function monster.update_solution(self) self.is_happy = true; return self.is_happy end

function monster.update(self)
    
end

function monster.draw(self)
    local size = self.hit_h
    if self.picked then
        size = gtime % 50 < 25 and self.hit_h or self.hit_h - 1
    end
    sspr((self.spr % 16) * 8, flr(self.spr \ 16) * 8, self.hit_w, self.hit_h, self.x, self.y, self.hit_w, size)
end

function monster.draw_ui(self)
    -- draw radius
    if self.picked then
        circ(self.x + self.hit_w/2, self.y + self.hit_h/2, self.radius, 7)
    end
    if self.chair then
        if  self.is_happy then
            print("♥", self.x  + self.hit_w / 2, self.y - 7, 8)
        else
            print("!", self.x  + self.hit_w / 2, self.y - 7, 8)
        end
    end
end

ghost = new_type(20, monster)
function ghost.update_solution(self)
    self.is_happy = false
    for o in all(objects) do
        if self != o and o.base == ghost and get_distance(self, o) < self.radius then
            self.is_happy = true
        end
    end
    return self.is_happy
end

skeleton = new_type(22, monster)

vampire = new_type(24, monster)
function vampire.update_solution(self)
    self.is_happy = true
    for o in all(objects) do
        if self != o and o.base == wolf and get_distance(self, o) < self.radius then
            self.is_happy = false
        end
    end
    return self.is_happy
end

wolf = new_type(26, monster)
function wolf.update_solution(self)
    self.is_happy = true
    for o in all(objects) do
        if self != o and o.base == vampire and get_distance(self, o) < self.radius then
            self.is_happy = false
        end
    end
    return self.is_happy
end

witch = new_type(28, monster)

chandelier = new_type(4)
function chandelier.update(self)
    if gtime % 20 == 1 then
        spawn_particles(4, 3, self.x, self.y, 10, true)
    end
    if gtime % 10 == 1 then
        spawn_particles(1, 2, self.x, self.y, 9, false)
    end
end

function chandelier.draw(self)
    circfill(self.x, self.y, 1, 9)
end

button = new_type(0)
button.color = 7
button.hit_w = 10
button.hit_h = 10
button.lvl = nil
button.name = ""

function button.update(self)
    if btnp(❎) and on_cursor(self) then
        current_level = find_item_table_index(self.lvl, levels)
        init_level(self.lvl)
    end
end

function button.draw(self)
    rectfill(self.x, self.y, self.x + self.hit_w - 1, self.y + self.hit_h - 1, self.color)
    rect(self.x, self.y, self.x + self.hit_w - 1, self.y + self.hit_h - 1, 1)
    print(self.name, self.x + self.hit_w/2, self.y + self.hit_h/2, 1)
end

-- PARTICLES
particles = {}

-- number
-- size
-- x / y
-- color
function spawn_particles(nb,s,x,y,c, randomize)
    randomize = randomize or false
    for i=1,flr(nb) do
        local xm = x + (randomize and (rnd(2) - 1) or 0)
        local ym = y + (randomize and (rnd(2) - 1) or 0)
        add(particles, make_particle(s,xm,ym,c))
    end
end

function make_particle(s,x,y,c)
    local p={
        s=s or 1,
        c=c or 7,
        x=x,y=y,k=k,
        t=0, t_max=16+flr(rnd(4)),
        dx=rnd(2)-1,dy=-rnd(3),
        ddy=0.05,
        update=update_particle,
        draw=draw_particle
    }
    return p
end

function draw_particle(a)
    circfill(a.x,a.y,a.s,a.c)
end

function update_particle(a)
    if a.s>=1 and a.t%4==0 then a.s-=1 end
    if a.t%2==0 then
        a.dy+=a.ddy
        a.x+=a.dx
        a.y+=a.dy
    end
    a.t+=1
    if (a.t==a.t_max) del(particles, a)
end