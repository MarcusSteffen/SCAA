-- Information Scene


local composer = require( "composer" )

 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 

 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
	
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
	
	

        -- Code here runs when the scene is still off screen (but is about to come on screen)
	-- its just a text field at the moment
 local addressField = native.newTextField( display.contentCenterX, display.contentCenterY * 0.01, 300, 40 )
 local widget=require("widget")
 local scroll = widget.newScrollView
	 {
		left = 0,
		top = 50,
		width = 400,
		height = 500,
		topPadding = -50,
		bottomPadding = 50,
		horizontalScrollDisabled = true,
		verticalScrollDisabled = false,
		backgroundColor = {1,1,1,1},
		listener = scrollListener,
 }
 local function goBack(event)
	
	composer.gotoScene("searchScene", {effect = "slideRight", time = 500})
	
end
-----------------------------------------------------------------------------------------------------------------
-- Scrolling
-----------------------------------------------------------------------------------------------------------------

local image=display.newImage(event.params.countryName.."-01.png")
	image.x=55
	image.y=95
	image.width=80
	image.height=80
	scroll:insert(image)
	--sceneGroup:insert(image)



-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
-- Button looping
-----------------------------------------------------------------------------------------------------------------
 
 -- constant variables for buttons
squareSize = 80
label = 60

 
-- https://forums.coronalabs.com/topic/5665-how-to-create-buttonsobjectsvariables-dynamically-in-a-loop-in-lua/
-- local button = {}
-- for i = 1, 10 then
	-- buttons[#buttons+1] = ui.newButton()
-- end

yCount = 120
xCount = 0




	backButton = widget.newButton(
	{
	onRelease = goBack,
	label = "X",
	x = 300,
	y = 80,
	width = 80,
	height = 80,
	}
	)
	scroll:insert(backButton)
	
	countryInfo = display.newText( "Country information", 175, 100, arial, 16 )
	countryInfo:setFillColor( 1, 0, 0 )
	
	
	-- print data
	currentCountry = event.params.countryName
	printIndex = 1
	
	yloc = -100
	
	
	while(printIndex <= 55) do
	for key,value in pairs(countryData[printIndex]) do 
	if(key == "Country") then typeOfInfo = display.newText(scroll, value, -50, yloc, arial, 16)  typeOfInfo:setFillColor( 0, 0, 0 ) yloc = yloc + 20 end end 
	for key,value in pairs(countryData[printIndex]) do 
	if(key == currentCountry) then typeOfInfo = display.newText(scroll, value, -50, yloc, arial, 16)  typeOfInfo:setFillColor( 0, 0, 0 ) yloc = yloc + 20 end end
	printIndex = printIndex + 1 end
	
	hyperLink = "https://www.google.com.au/search?q="..currentCountry.."+media&source=lnms&tbm=nws"
	--put button at bottom of page and insert have it system.openURL(hyperLink)
	
	
	scroll:insert(countryInfo)
	--sceneGroup:insert(countryInfo)
	sceneGroup:insert(scroll)
	
	
	sceneGroup:insert(backButton)

		
--	buttons:addEventListener("tap", buttons )
	
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene