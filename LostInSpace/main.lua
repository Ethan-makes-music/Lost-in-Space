require "assets.data.scripts.player"
require "assets.data.scripts.upgrade"
require "assets.data.scripts.asteroids"

function love.load()
    MaxSpeed = 15
    Going = true
    Level = 1
    if Going == true then
        Upgrade.load()
        Asteroids.load()
    end
    Player.load()
    Bg = love.graphics.newImage("assets/images/bg.png")
end

function love.update(dt)
    if Going == true then
        Asteroids.update()
        Upgrade.update()
    end
    Player.update()

    if Damage == 0 then
        Going = false
    end

    if Plr.Y <= -390 then
        Plr.Y = 450
        Level = Level + 1
        Damage = Damage + 45
        Going = true
    end
    if Damage == 100 then
        love.event.quit()
    end
    if Speed >= MaxSpeed then
        Speed = MaxSpeed
    end
end

function love.draw()
    love.graphics.draw(Bg)
    if Going == true  then
        Upgrade.draw()
        Asteroids.draw()
    end
    Player.draw()
    love.graphics.print("Level: " ..Level)
end