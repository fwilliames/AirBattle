function love.load()
    GameData = require("Class.GameData")
    
    --Singleton
    MyGameData = GameData:new(TempRecord)
    _G.game = myGameData
end

function love.keypressed(key)
    MyPlayer:keyPressed(key)
    GameData:keyPressed(key)
  
end

function love.draw()

    love.graphics.rectangle( "fill", 50, 550, 100, 100, 100, 100, 3 )
    love.graphics.print({{100,0,0},"Score: " .. Score}, 75, 600)
    love.graphics.print({{100,0,0},"Record: " .. Record}, 75, 580)
    
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
