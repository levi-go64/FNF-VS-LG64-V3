function onCreatePost()

    dadPositionX = getProperty("dad.x")
    dadPositionY = getProperty("dad.y")
    dadMaxX = dadPositionX+5000
    dadMaxY = dadPositionY+5000
    precacheSound("carCrash")

end



function opponentNoteHit(id, direction, noteType, isSustainNote)
    
    if isSustainNote == false then
        if direction == 0 then
            doTweenX("dadTweenCrash", "dad", (-1 * dadMaxX), 0.6, "expoIn")
        elseif direction == 1 then
            doTweenY("dadTweenCrash", "dad", dadMaxY, 0.6, "expoIn")
        elseif direction == 2 then
            doTweenY("dadTweenCrash", "dad", (-1 * dadMaxY), 0.6, "expoIn")
        elseif direction == 3 then
            doTweenX("dadTweenCrash", "dad", dadMaxX, 0.6, "expoIn")
        end
    end

end

function onUpdate(elapsed)
    if getProperty("dad.x") >= (dadMaxX) or getProperty("dad.x") <= (-1*dadMaxX) or getProperty("dad.y") >= (dadMaxY) or getProperty("dad.y") <= (-1*dadMaxY) then
        playSound("carCrash",2)
        triggerEvent('Screen Shake', '0.35, 0.05', '')
        doTweenX("dadTweenX","dad", dadPositionX, 2, "expoOut")
        doTweenY("dadTweenY","dad", dadPositionY, 2, "expoOut")
    end     
end


