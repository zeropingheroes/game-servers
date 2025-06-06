local textColor = Color.Red

OnPlayerChat = function(args)
    if args.text:sub(1,4) == "/tpm" then
        local tester = args.player:GetSteamId()
        local nameLook = args.text:sub(6)
        if nameLook and nameLook ~= "" then
            if tonumber(nameLook) and Player.GetById(tonumber(nameLook)) then
                local pFound = Player.GetById(tonumber(nameLook))
                local newPos = pFound:GetPosition()
                args.player:SetPosition(newPos)
                args.player:SendChatMessage("Teleporting to " .. pFound:GetName(), textColor)
            else
                args.player:SendChatMessage("Couldn't find anyone with id " .. nameLook, textColor)
                args.player:SendChatMessage("Press F6 to find out their id", textColor)
            end
        else
            args.player:SendChatMessage("Usage:", textColor)
            args.player:SendChatMessage("  /tpm <playerID>", textColor)
            args.player:SendChatMessage("Where playerID is their ID. To find out their ID", textColor)
            args.player:SendChatMessage("press F6 and use the search box at the bottom.", textColor)
        end
        return false
    else
        return true
    end
end

Events:Subscribe("PlayerChat", OnPlayerChat)
