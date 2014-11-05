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
local hitPlanetlocal planetDamagelocal planetlocal level1local level2local level3--local planetDamage
-- preload audio
local sndBg = audio.loadSound("Bg.mp3")
local sndKill = audio.loadSound("boing-1.wav")
local sndBlast = audio.loadSound("blast.mp3")
local sndLose = audio.loadSound("wahwahwah.mp3")

------------------------------------------------------------------------
-- create play screen

local function createPlayScreen()
	--audio.play(sndBg)
	local background = display.newImage("background.png")
	background.x = centerX    --set position
	background.y =  10
	background.alpha = 0
	--background:addEventListener("tap", shipSmash)
		
    planet = display.newImage("planet.png")
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
		transition.to(planet, { time=2000 , alpha=1, xScale=1, yScale=1, x=centerX, y=centerY, onComplete = showTitle } )
  	   --transition.to(planet, { time= 2000, x=100})	
end
---------------------------------------------------------------------- 	   
-- game functions

--[[
	local function gameStart()
		
end
]]

function spawnEnemy()
	 enemy = display.newImage("beetleship.png")
	enemy.alpha = 1	--enemy.x = math.random(20, display.contentWidth-20)
	--enemy.y = math.random(20, display.contentHeight-20)				if math.random(2)==1 then			enemy.x = math.random(-100 , -10)			else			enemy.x = math.random(display.contentWidth+10, display.contentWidth+100)		end		enemy.y = math.random(display.contentHeight)				--= 		enemy:addEventListener("tap", shipSmash)		--enemy.trans = transition.to(enemy, {time=3500 ,x=centerX, y=centerY, onComplete=hitPlanet })		if score<100 then level1()			else if score<200 then level2()				else level3()			end		end		
	--transition.to(enemy, { time=1500, x=math.random(20,display.contentWidth-20), y=math.random(20,display.contentHeight-30), alpha=1})
end-------------------------------------------------------------------function level1()	enemy.trans = transition.to(enemy, {time=4000 ,x=centerX, y=centerY, onComplete=hitPlanet })endfunction level2()	enemy.trans = transition.to(enemy, {time=2000 ,x=centerX, y=centerY, onComplete=hitPlanet })endfunction level3()	enemy.trans = transition.to(enemy, {time=1000 ,x=centerX, y=centerY, onComplete=hitPlanet })end--------------------------------------------------------------------function planetDamage()	local function goAway()		planet.xScale = 1		planet.yScale = 1	end	transition.to(planet,{ time=100, xScale=1.2, yScale=1.2, onComplete = goAway })		--#outlaw transition.cancel(planet)end--------------------------------------------------------------------function hitPlanet(obj)	display.remove(obj)	planetDamage()	audio.play(sndBlast)	score = score -30	scoreTxt.text = "Score : "..score	if (score<=0) then		local gameOver = display.newText("GAME OVER", 300, 300,"Helvetica", 30)		gameOver.x = centerX		gameOver.y = centerY		local function endGame(obj)			display.remove(obj)		end		transition.to(planet,{time=100, onComplete=endGame})		else		spawnEnemy()	endend
---------------------------------------------------------------------
function shipSmash(event)
	local obj = event.target
	display.remove(obj)
	audio.play(sndKill)	transition.cancel(obj.trans)	score = score +28	scoreTxt.text = "Score : "..score	spawnEnemy()
	return true
end
-------------------------------------------------------------------	
function startGame()
	local  logo = display.newText( "Tap to start.", 0, 0, "Helvetica", 15)
	logo.x = centerX
	logo.y = display.contentHeight - 20
	logo.alpha = .1
	logo:setTextColor(238, 255, 178)	transition.to(logo, { time=200, alpha=1})			local function goAway(event)		audio.play(sndBlast)		display.remove(event.target)		logo = nil		display.remove(gameTitle)		scoreTxt = display.newText("Score : 0", 0, 0, "Helvetica",22)		scoreTxt.x = centerX		scoreTxt.y = 10		score = 0		spawnEnemy()		--return true	end	logo:addEventListener("tap", goAway)end
	
----------------------------------------------------------------------- 
--gameStart()
createPlayScreen()---------------------------------------------------------------------


