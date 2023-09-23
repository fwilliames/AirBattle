local class = require("libs.middleclass")

local GameData = class("GameData") --- @class GameData

    function GameData:initialize(record)
        --Import Modules
        Lume = require("libs.lume")
        --Import the Game Classes
        Player = require("Class.Player")
        Enemy = require("Class.Enemy")
        Bullet = require("Class.Bullet")

        ListOfBullets = {}
        Score = 0
        TempRecord = 0
        
        if record ~= nil then
            if record > Record then
                Record = record
            end
        else
            Record = 0
        end

        
    -- Create the Game Objects
        MyPlayer = Player:new()
        MyEnemy = Enemy:new()

    end

    function GameData:saveGame()
        data = {}
        data.record = Record

        serialized = Lume.serialize(data)
    -- The filetype actually doesn't matter, and can even be omitted.
        love.filesystem.write("savedata.txt", serialized)
        
    end

    function GameData:keyPressed(key)
        if key == "f1" then
            self:saveGame()
        end
    end

    function GameData:print()
        love.graphics.rectangle( "fill", 50, 550, 100, 100, 100, 100, 3 )
        love.graphics.print({{100,0,0},"Score: " .. Score}, 75, 600)
        love.graphics.print({{100,0,0},"Record: " .. Record}, 75, 580)
        
    end

return GameData