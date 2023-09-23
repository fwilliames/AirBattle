local class = require("libs.middleclass")

local GameData = class("GameData") --- @class GameData

    function GameData:initialize(newRecord)
        --Import Modules
        Lume = require("libs.lume")
        --Import the Game Classes
        Player = require("Class.Player")
        Enemy = require("Class.Enemy")
        Bullet = require("Class.Bullet")

        --Carregando Musica de Fundo
        Sound = love.audio.newSource("Assets/combat.ogg","stream")
        Sound:setLooping(true)
        Sound:play()

        ListOfBullets = {}
        Score = 0
        TempRecord = 0
        dataRecord = 0

        if love.filesystem.getInfo("savedata.txt") then
            file = love.filesystem.read("savedata.txt")

            --[[
                Comentar a linha de cima e ativar essa quando for compactar para criar 
                o executavel onde o airBattle eh o nome do arquivo zipado
            ]]
            
            --file = love.filesystem.read("../airBattle/savedata.txt") 
            dataRecord = Lume.deserialize(file).record
            
        end
        
        if newRecord ~= nil then
            if newRecord < dataRecord then
                newRecord = dataRecord
            end
            if newRecord > Record then
                Record = newRecord
            end
        else
            Record = dataRecord
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
        elseif key == "f2" then
            love.filesystem.remove("savedata.txt")
                love.event.quit("restart")
        end
    end

    function GameData:print()
        love.graphics.rectangle( "fill", 50, 550, 100, 100, 100, 100, 3 )
        love.graphics.print({{100,0,0},"Score: " .. Score}, 75, 600)
        love.graphics.print({{100,0,0},"Record: " .. Record}, 75, 580)
        
    end
return GameData