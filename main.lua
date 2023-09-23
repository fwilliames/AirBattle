function love.load()
    --Import Modules
    Lume = require("libs.lume")
    --Import the Game Classes
    Player = require("Class.Player")
    Enemy = require("Class.Enemy")
    Bullet = require("Class.Bullet")
    GameData = require("Class.GameData")
    

    --Singleton
    MyGameData = GameData:new(TempRecord)
    _G.game = myGameData

    -- Create the Game Objects
    MyPlayer = Player:new()
    MyEnemy = Enemy:new()

    function saveGame()
        data = {}
        data.record = Record

        serialized = Lume.serialize(data)
    -- The filetype actually doesn't matter, and can even be omitted.
        love.filesystem.write("savedata.txt", serialized)
        
    end

    
end

function love.keypressed(key)
    MyPlayer:keyPressed(key)

    if key == "f1" then
        saveGame()
    end
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
