local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

 

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

labeld=50
xCount=50
yCount=120
squareSize=80
local function searchCountries(text)
temp={}
xCount=50
yCount=120
leng=string.len(text)
if (string.sub(text,1,1)==string.sub(text,1,1):lower()) then
     for i=1, #buttons do
        str=buttons[i].id:lower()
        if (text==str:sub(1, leng)) then
              table.insert(temp,buttons[i])
        end
     end
else
     for i=1, #buttons do
        str=buttons[i].id
        if (text==str:sub(1, leng)) then
              table.insert(temp,buttons[i])
        end
     end
end
buttonView=temp
for i=1, #buttonView do
    buttonView[i].x=xCount
    buttonView[i].y=yCount
	if (string.find(buttonView[i].label, "\n")~=nil) then
	buttonView[i].y=buttonView[i].y+10
	end
	
    if (i%3==0) then
        xCount=50
        yCount=yCount+140
    else
        xCount=xCount+110
    end
end
--composer.removeScene("searchScene", true)
composer.gotoScene("searchScene")
end



local function inputCountries( event )
 
    if ( event.phase == "began" ) then
        -- User begins editing "defaultField"
 
    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultField"
        
 
    elseif ( event.phase == "editing" ) then
	    
		
		searchCountries(event.newCharacters)
		 
	    --searchCountries(event.newCharacters)
        
    end
end
local function showInfo(event)
    
	local customParams={
	    countryName=event.target.id
	}
	
	
	composer.gotoScene("infoScene", {effect="slideLeft", time=500, params=customParams})
	
end


local widget=require("widget")
buttons = {}


buttonView={}

	



-- create()
function scene:create( event )

    local sceneGroup = self.view
	countries ={ "Afghanistan", "Albania", "Antigua and\n   Barbuda", "Argentina", "Australia", "Austria", "Bahamas", "Bangladesh", "Barbados", "Belarus", "Belgium",
 "Bolivia", " Bosnia and \nHerzegovina", "Botswana", "Brazil", "Bulgaria", "Burkina Faso", "Cambodia", "Cameroon", "Canada", "Chile", "China", "Colombia", "Costa Rica",
 "Cote d'Ivoire", "Croatia", "  Czech \nRepublic", "Denmark", "Dominica", "Dominican \n Republic", "Ecuador", "Egypt", "El Salvador", "Estonia", "Ethiopia", "Finland",
 "France", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guyana", "Honduras", "Hong Kong", "Hungary", "India", "Indonesia", "Iran", "Italy",
 "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kyrgyzstan", "Lebanon", "Liberia", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Mexico", "Moldova",
 "Mongolia", "Morocco", "Myanmar", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Nigeria", "Norway", "Pakistan", "Panama", "Peru", "Philippines", "Poland",
 "Portugal", "Republic of \n    Korea", "Romania", "Russia", "Senegal", "Serbia", "Sierra Leone", "Singapore", "Slovenia", "South Africa", "Spain", "Sri Lanka",
 "  St. Kitts\nand Nevis", "St. Lucia", "Suriname", "Sweden", "Tanzania", "Thailand", "      The \nGrenadines", "Trinidad and \n    Tobago", "Tunisia", "Turkey", 
 "Uganda", "Ukraine", "United Arab \n  Emirates", "  United \nKingdom", "United \nStates", "Uruguay", "Venezuela", "Vietnam"}
	
	altCountries={"Antigua and Barbuda","Bosnia and Herzegovina", "Czech Republic", "Dominican Republic", "Republic of Korea", "St. Kitts and Nevis", "St. Vincent and the Grenadines", "Trinidad and Tobago",
 "United Arab Emirates", "United Kingdom", "United States of America"}	
    t=1
	for i = 1, #countries do
	-- Create 2D array to hold our objects.
	labels=countries[i]
	if (string.find(labels, "\n")~=nil) then
	labels=altCountries[t]
	t=t+1
	labeld=60
	yCount2=yCount+10
	yCount3=yCount2
	else
	labeld=50
	yCount3=yCount
	end
	
	

	
	buttons[i] = widget.newButton(
	{
	label = countries[i],
	labelColor = {default = {0,0,0}},
	labelYOffset = labeld,
	onRelease = showInfo,
	id = labels,
	x = xCount, 
	y = yCount3,
	width = squareSize,
	height = squareSize,
	defaultFile=labels.."-01.png"
	}
	)
	buttons[i].label=countries[i]
	
	if (i%3==0) then
	xCount=50
	yCount=yCount+140
	else
	xCount=xCount+110
	end
	
	
	

	
	end
countries=nil
altCountries=nil

buttonView=buttons
    
	
	 

 
	
end
   
    
 
 
-- show()
function scene:show( event )
 local sceneGroup = self.view
 local phase = event.phase
  if ( phase == "will" ) then
    local scrollView = widget.newScrollView
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
		
 }
 
 for i=1, #buttonView do

	    scrollView:insert(buttonView[i])
end	

   
    sceneGroup:insert(scrollView)
	
	
 
   

	
    -- Code here runs when the scene is first created but has not yet appeared on screen

	
        -- Code here runs when the scene is still off screen (but is about to come on screen)
	-- its just a text field at the moment



-----------------------------------------------------------------------------------------------------------------
-- Scrolling
-----------------------------------------------------------------------------------------------------------------





-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
-- Button looping
-----------------------------------------------------------------------------------------------------------------
 
 -- constant variables for buttons



 
-- https://forums.coronalabs.com/topic/5665-how-to-create-buttonsobjectsvariables-dynamically-in-a-loop-in-lua/
-- local button = {}
-- for i = 1, 10 then
	-- buttons[#buttons+1] = ui.newButton()
-- end





--countries { "Afghanistan", "Albania", "Antigua and Barbuda", "Argentina", "Australia", "Austria", "Bahamas", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Bulgaria", "Burkina Faso", "Cambodia", "Cameroon", "Canada", "Chile", "China", "Colombia", "Costa Rica", "Cote d'Ivoire", "Croatia", "Czech Republic", "Denmark", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Estonia", "Ethiopia", "Finland", "France", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guyana", "Honduras", "Hong Kong SAR China", "Hungary", "India", "Indonesia", "Iran", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kyrgyzstan", "Lebanon", "Liberia", "Macedonia FYR", "Madagascar", "Malawi", "Malaysia" ,"Mexico", "Moldova", "Mongolia", "Morocco", "Myanmar", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Nigeria", "Norway", "Pakistan", "Panama", "Peru", "Philippines", "Poland", "Portugal", "Republic of Korea", "Romania", "Russia", "Senegal", "Serbia", "Sierra Leone", "Singapore", "Slovenia", "South Africa", "Spain", "Sri Lanka", "St. Kitts and Nevis", "St. Lucia", "St. Vincent and the Grenadines", "Suriname", "Sweden", "Tanzania", "Thailand", "Trinidad and Tobago", "Tunisia", "Turkey", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom","United States", "Uruguay", "Uzbekistan", "Venezuela", "Vietnam", "Zambia", "Zimbabwe" }

		
	
	
		
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
searchBar = native.newTextField( 160, 0, 300, 50 )
searchBar:addEventListener( "userInput", inputCountries )
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -----------------------------------------------------------------------------------
 
return scene