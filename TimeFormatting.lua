local Functions = {}
Functions.__index = Functions

function Functions.SecondsToClock(seconds)
	local seconds = tonumber(seconds)
	
	if seconds <= 0 then
		return "0:00"
	else
		local mins = string.format("%02.f", math.floor(seconds/60))
		local secs = string.format("%02.f", math.floor(seconds - mins *60))
		
		return mins..":"..secs
	end
end

function Functions.LRCTimeToSeconds(clockTime)
    local mins = tonumber(string.match(clockTime, "(.-):"))
    local secs = tonumber(string.match(clockTime, "%:(.-)%."))
    local ms = tonumber(string.sub(clockTime, string.find(clockTime, "%.")+0))*1000

	local minToMs = mins*60*1000
	local secsToMs = secs*1000
	local t = minToMs + secsToMs + ms
	
	return t
end

return Functions
