-- Project: Attack of the Cuteness Game
-- http://MasteringCoronaSDK.com
-- Version: 1.0
-- Copyright 2013 J. A. Whye. All Rights Reserved.
-- "Space Cute" art by Daniel Cook (Lostgarden.com) 

-- housekeeping stuff

display.setStatusBar(display.HiddenStatusBar)  --disable StatusBar

local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- set up forward references


-- preload audio
--local spawnEnemy
-- create play screen

local function createPlayScreen()
	local background = display.newImage("background.png")
	background.x = centerX    --set position
	background.y =  10
	background.alpha = 0
		
	local planet = display.newImage("planet.png")
	planet.x = centerX
	planet.y = centerY --display.contentHeight + 30
	planet.alpha = 0
	planet.xScale=1
	planet.yScale=1
	
	transition.to(background, {time=7000, alpha=1, x=centerX, y=500} )

		local function showTitle()
					local gameTitle = display.newImage("gametitle.png")
					--gameTitle.x = centerX
					--gameTitle.y = centerY
					gameTitle.alpha = 0
					gameTitle:scale(50,30)
					transition.to( gameTitle, {time=500, alpha=1, xScale=1, yScale=1 } )
		end
		transition.to(planet, { time=4000 , alpha=1, xScale=2, yScale=2, x=centerX, y=centerY, onComplete = showTitle } )
  	   --transition.to(planet, { time= 2000, x=100})	
end
  	   
-- game functions

--[[
		
end
]]
--gameStart()
createPlayScreen()
