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

    end

    function GameData:saveGame()
        data = {}
        data.record = Record

        serialized = Lume.serialize(data)
    -- The filetype actually doesn't matter, and can even be omitted.
        love.filesystem.write("savedata.txt", serialized)
        
    end

return GameData