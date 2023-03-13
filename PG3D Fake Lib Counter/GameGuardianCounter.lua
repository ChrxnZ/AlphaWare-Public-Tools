-- Local dependencies
local string = require("string")
-- GameGuardian dependencies
local gr = gg.getResults
local cr = gg.clearResults
local rr = gg.removeResults
local grc = gg.getResultCount
local sr = gg.setRanges
local rca = gg.REGION_CODE_APP
local tpb = gg.TYPE_BYTE
local sn = gg.searchNumber
local ed = gg.editNumber


-- Function to get info about the hex
function getHexInfo(Hex)
	Length = #Hex -- Get the length of the hex
	if Length == 95 then
		if string.match(Hex, " ") then
			noSpaceHex = string.gsub(Hex, " ", "")
			nshLength = #noSpaceHex
			if nshLength == 64 then
				print("getHexInfo(): 32 byte hex detected")
				return nshLength, noSpaceHex
			else
				print("Error occured in getHexInfo(): An error was detected in the hex space padding")
			end
		else
			return Length, Hex
		end
	elseif Length == 191 then
		if string.match(Hex, " ") then
			noSpaceHex = string.gsub(Hex, " ", "")
			nshLength = #noSpaceHex
			if nshLength == 128 then
				print("getHexInfo(): 64 byte hex detected")
				return nshLength, noSpaceHex
			else
				print("Error occured in getHexInfo(): An error was detected in the hex space padding")
			end
		else
			return Length, Hex
		end
	else
		print("Error occured in getHexInfo(): This function does not support any hex that is not 32 or 64 bytes")
	end
end


-- indent
	

function counterFakeLib(targetResults, formattedHex, editHex)
	t = targetResults -- ignore, this is just to assign the values to shorter variable names
	f = formattedHex
	e = editHex
	sr(rca) -- set region(s) to Libil2cpp.so
	cr() -- clear any current results to avoid interference
	sn("h" .. f, tpb) -- search the hex
	originalAmount = grc(gr(500000)) -- get current amount of results
	if originalAmount ~= t then -- if recieved amount of results not match the given target
		print("Error occured in counterFakeLib(): Expected " .. t .. " Recieved " .. originalAmount)
	else
		results = gr(t / 2) -- get the results of the fake libil2cpp.so by halving the target amount
		rr(results) -- remove fake libil2cpp.so results
		actualLib = gr(t / 2) -- get actual lib results
		ed("h" .. e, tpb) -- edit actual lib results
	end
end
