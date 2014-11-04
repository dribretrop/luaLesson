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
local spawnEnemylocal startGamelocal gameTitlelocal scoreTxtlocal score = 0

-- preload audio
local sndBg = audio.loadSound("Bg.mp3")
local sndKill = audio.loadSound("boing-1.wav")
local sndBlast = audio.loadSound("blast.mp3")
local sndLose = audio.loadSound("wahwahwah.mp3")

------------------------------------------------------------------------
-- create play screen

local function createPlayScreen()
	audio.play(sndBg)
	local background = display.newImage("background.png")
	background.x = centerX    --set position
	background.y =  10
	background.alpha = 0
	--background:addEventListener("tap", shipSmash)
		
	local planet = display.newImage("planet.png")
	planet.x = centerX
	planet.y = centerY --display.contentHeight + 30
	planet.alpha = 0
	planet.xScale=1
	planet.yScale=1
	--#outlaw planet:addEventListener("tap", shipSmash)
	transition.to(background, {time=3000, alpha=1, x=centerX, y=500} )

		local function showTitle()
					gameTitle = display.newImage("gametitle.png")
					--gameTitle.x = centerX
					--gameTitle.y = centerY
					gameTitle.alpha = 0
					gameTitle:scale(50,30)
					transition.to( gameTitle, {time=500, alpha=1, xScale=1, yScale=1 } )
					--spawnEnemy()
					startGame()
		end
		transition.to(planet, { time=2000 , alpha=1, xScale=2, yScale=2, x=centerX, y=centerY, onComplete = showTitle } )
  	   --transition.to(planet, { time= 2000, x=100})	
end
---------------------------------------------------------------------- 	   
-- game functions

--[[
	local function gameStart()
		
end
]]

function spawnEnemy()
	local enemy = display.newImage("beetleship.png")
	enemy.x = math.random(20, display.contentWidth-20)
	enemy.y = math.random(20, display.contentHeight-20)
	enemy.alpha = .1
	transition.to(enemy, { time=1500, x=math.random(20,display.contentWidth-20), y=math.random(20,display.contentHeight-30), alpha=1})
	enemy:addEventListener("tap", shipSmash)
end
---------------------------------------------------------------------
function shipSmash(event)
	local obj = event.target
	display.remove(obj)
	audio.play(sndBlast)	score = score +28	scoreTxt.text = "Scroe :  ".. score	spawnEnemy()
	return true
end
-------------------------------------------------------------------	
function startGame()
	local  text = display.newText( "Tap to start.", 0, 0, "Helvetica", 15)
	text.x = centerX
	text.y = display.contentHeight - 20
	text.alpha = .1
	text:setTextColor(238, 255, 178)	transition.to(text, { time=200, alpha=1})		local function goAway(event)		audio.play(sndBlast)		display.remove(event.target)		text = nil		display.remove(gameTitle)		scoreTxt = display.newText("Score : 0", 0, 0, "Helvetica",22)		scoreTxt.x = centerX		scoreTxt.y = 10		spawnEnemy()		--return true	end	text:addEventListener("tap", goAway)end
	
----------------------------------------------------------------------- 
--gameStart()
createPlayScreen()


