--Split all lines up
function splitLines(lyrics)
	local linesTable = {}
	
	for s in lyrics:gmatch("[^\r\n]+") do
   		table.insert(linesTable, s)
	end
	
	return linesTable
end

function formatLyricLine(line)
	local tableOfTimes, tableOfWords, timeWords = {}, {}, {}
	local firsttime, firstword = line:match("%[(.-)%](.-)%<")
	timeWords[1] = {firsttime, firstword}
	
	for t in string.gmatch(line, "%<(.-)%>") do
	   	table.insert(tableOfTimes, t)
	end
	
	for word in string.gmatch(line, "%>(.-)%<") do
		table.insert(tableOfWords, word)
	end
	
	for i, wordTime in pairs(tableOfTimes) do
		table.insert(timeWords, {wordTime, tableOfWords[i]})
	end
	
	if #tableOfTimes >= 1 then
		local lastword = string.sub(line, string.find(line, ">[^>]*$")+1, string.find(line, "\n"))
		timeWords[#timeWords][2] = lastword
	end
	
	return timeWords
end

function formatLines(linesTable)
	local lyrics = {}
	lyrics.Lines = {}
	
	for _, line in pairs(linesTable) do
		local tag, value = line:match("%[(%a+):(.-)%]")
		
		if tag and value then
			if tag == "ti" then
				lyrics.Title = value
			elseif tag == "la" then
				lyrics.Language = value
			elseif tag == "re" then
				lyrics.Caption = value
			elseif tag == "ve" then
				lyrics.Version = value
			end
		end
		
		table.insert(lyrics["Lines"], formatLyricLine(line))
	end

	return lyrics
end

function convertLyrics(lyrics)
	local lines = splitLines(lyrics)
	local lyricsTable = formatLines(lines)
	
	return lyricsTable
end
