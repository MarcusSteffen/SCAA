---------------------------------------------------------------------------------
--
-- main.lua
--
---------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- require the composer library
local composer = require "composer"

-- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc)
-- local options = {
    -- effect = "fade",
    -- time = 500,
    -- params = {
        -- someKey = "someValue",
        -- someOtherKey = 10
    -- }
-- }

local json = require( "json" )

function loadFromJson( filename, base )
	
	-- set default base dir if none specified
	if not base then base = system.DocumentsDirectory; end

	-- create a file path for corona i/o
	local path = system.pathForFile( filename, base )

	-- will hold contents of file
	local file, contents

	-- io.open opens a file at path. returns nil if no file found
	if path then
		file = io.open( path, "r" )
	end

	if file then
	    -- read all contents of file into a string
	    contents = file:read( "*a" )
	    io.close( file )-- close the file after using it
		print("x")
		
	else
		--if not found then return a string representing an empty table
		contents = "[]"
		print("x")
	end

	--convert the json string to a table
	local returnTable = json.decode(contents)

	--return the table
	return returnTable
end

-- Add any system wide event handlers, location, key events, system resume/suspend, memory, etc.

_G.countryData = loadFromJson("Country info.json", system.DocumentsDirectory)

-- load scene1
composer.gotoScene( "searchScene" )
