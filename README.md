# LUA-Enhanced-Lyric-Parser
Lua Module to Parse ELRC file format

Use parse.lua convertLyrics with the full lyrics file as string argument

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
