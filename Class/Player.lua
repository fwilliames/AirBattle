local class = require("libs.middleclass")
local Bullet = require("Class.Bullet")

---@class Player
local Player = class("player")

function Player:initialize()
    --Carregando Imagem do Player
    self.image = love.graphics.newImage("Assets/plane_b.png")

    -- Definindo posição inicial e
    self.x = 300
    self.y = 20
    self.speed = 500
    self.width = self.image:getWidth() 
    
end

function Player:draw()
    --love.graphics.draw(self.image)
    love.graphics.draw(self.image, self.x, self.y)
end

--Movimento
function Player:update(dt)
    if love.keyboard.isDown("a","left") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("d","right") then
        self.x = self.x + self.speed * dt
    end

    --Get the width of the window
    local window_width = love.graphics.getWidth()

    --If the x is too far too the left then..
    if self.x < 0 then
        --Set x to 0
        self.x = 0

    --Else, if the x is too far to the right then..
    elseif self.x + self.width > window_width then
        --Set the x to the window's width.
        self.x = window_width - self.width
    end
end

function Player:keyPressed(key)
    --If the spacebar is pressed
    if key == "space" then
        --Put a new instance of Bullet inside listOfBullets.
        local bullet = Bullet:new(self.x + 10, self.y + 50)
        
        table.insert(ListOfBullets, bullet)
    end
end

return Player