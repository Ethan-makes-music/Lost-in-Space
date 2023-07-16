Asteroids = {}
require "assets.data.scripts.collision"

function Asteroids.load()
    Sound = love.audio.newSource("assets/sounds/Explosion.wav", "static")
    Speed = 8
    Asteroid = {
        Sprite = {
            Image = love.graphics.newImage("assets/images/asteroid1.png")
        },
        X = love.math.random(0,500),
        Y = 50,
        W = 30,
        H = 30
    }
    Asteroid2 = {
        Sprite = {
            Image = love.graphics.newImage("assets/images/asteroid2.png")
        },
        X = love.math.random(0,500),
        Y = 50,
        W = 30,
        H = 30
    }
end

function Asteroids.update(dt)
    --Asteroid 1
    Asteroid.Y = Asteroid.Y + Speed

    if Asteroid.Y > 550 then
        Asteroid.Y = 50
        Asteroid.X = love.math.random(0,500)
    end

    if Check_collision(Plr, Asteroid) then
        Asteroid.Y = 50
        Asteroid.X = love.math.random(0,500)
        Damage = Damage + 5
        Speed = Speed - 1
        Sound:play()
    end

    --Asteroid 2
    Asteroid2.Y = Asteroid2.Y + Speed

    if Asteroid2.Y > 550 then
        Asteroid2.Y = 50
        Asteroid2.X = love.math.random(0,500)
    end

    if Check_collision(Plr, Asteroid2) then
        Asteroid2.Y = 50
        Asteroid2.X = love.math.random(0,500)
        Damage = Damage + 5
        Speed = Speed - 1
        Sound:play()
    end

    --overlapping
    if Check_collision(Asteroid, Asteroid2) then
        Asteroid.X = love.math.random(0,500)
    end
end

function Asteroids.draw()
    --Asteroid 1
    love.graphics.draw(Asteroid.Sprite.Image, Asteroid.X, Asteroid.Y)
    --Asteroid 2
    love.graphics.draw(Asteroid2.Sprite.Image, Asteroid2.X, Asteroid2.Y)
end