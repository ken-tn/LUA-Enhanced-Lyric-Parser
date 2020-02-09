# LUA-Enhanced-Lyric-Parser
Lua Module to Parse ELRC file format

How to use:
Call function convertLyrics with the full lyrics file to get lua table output

Table Format:
{
  ["Title"] = "Hi",
  ["Language"] = "English"
  ["Lines"] = {
    LINENUMBER {
      {TIME, WORD},
      {TIME, WORD}
    },
    LINENUMBER {
      {TIME, WORD},
      {TIME, WORD}
    }
  }
}
