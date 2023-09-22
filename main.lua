function love.load()
    Player = require("Class.Player")
    Enemy = require("Class.Enemy")
    Bullet = require("Class.Bullet")

    MyPlayer = Player:new()
    MyEnemy = Enemy:new()
    ListOfBullets = {}

end

function love.keypressed(key)
    MyPlayer:keyPressed(key)
end

function love.draw()
    MyPlayer:draw()
    MyEnemy:draw()
    for i,v in ipairs(ListOfBullets) do
        v:draw()
    
        v:checkCollision(MyEnemy)
        if v.dead then
            --Remove it from the list
            table.remove(ListOfBullets, i)
        end
    end
   
end

function love.update(dt)
    MyPlayer:update(dt)
    MyEnemy:update(dt)

    for i,v in ipairs(ListOfBullets) do
        v:update(dt)
    end

end
