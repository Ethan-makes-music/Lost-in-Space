Upgrade = {}
require "assets.data.scripts.collision"
require "assets.data.scripts.asteroids"

function Upgrade.load()
    Sound2 = love.audio.newSource("assets/sounds/Pickup.wav", "static")
    Scrap = {
        Sprite = {
            Image = love.graphics.newImage("assets/images/shuttle.png"),
        },
        X = love.math.random(0, 600),
        Y = 50,
        W = 30,
        H = 30
    }
end

function Upgrade.update(dt)
    Scrap.Y = Scrap.Y + Speed

    if Check_collision(Plr, Scrap) then
        Scrap.Y = 50
        Damage = Damage - 5
        Speed = Speed + 1
        Scrap.X = love.math.random(0, 600)
        Sound2:play()
    end
    if Scrap.Y > 550 then
        Scrap.Y = 50
        Scrap.X = love.math.random(0, 600)
    end

    if Check_collision(Asteroid, Scrap) then
        Asteroid.X = love.math.random(0,500)
    elseif Check_collision(Asteroid2, Scrap) then
        Asteroid2.X = love.math.random(0,500)
    end
end

function Upgrade.draw()
    love.graphics.draw(Scrap.Sprite.Image, Scrap.X, Scrap.Y)
end