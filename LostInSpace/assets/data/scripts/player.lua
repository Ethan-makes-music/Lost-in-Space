Player = {}
require "assets.data.scripts.collision"

function Player.load()
    Plr = {
        Sprite = {
            Image = love.graphics.newImage("assets/images/spaceship.png"),
        },
        X = 300,
        Y = 450,
        W = 64,
        H = 64
    }
    Damage = 35
end

function Player.update(dt)
    if love.keyboard.isDown("a") then
        Plr.X = Plr.X - 10
    elseif love.keyboard.isDown("d") then
        Plr.X = Plr.X + 10
    end

    if Damage == 0 then
        Plr.Y = Plr.Y - 8
    end
end

function Player.draw()
    love.graphics.print("Plr Y: " ..Plr.Y, 300, 50)
    love.graphics.draw(Plr.Sprite.Image, Plr.X, Plr.Y)
    love.graphics.print("Damage:  " ..Damage, 50,50)
end