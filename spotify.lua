local spotify = {}
-- If you don't have a C or Objective-C submodule, the above line gets simpler:
-- local foobar = {}

-- If your module depends on other Mjolnir modules, require them into locals like this:
local application = require "mjolnir.application"
local alert = require "mjolnir.alert"

-- Simple functions that can be defined in Lua, should be defined in Lua:
function spotify.tell(cmd)
  return os.execute('osascript -e \'tell application "Spotify" to ' .. cmd .. "'")
end

function spotify.play()
  spotify.tell('playpause')
  alert.show(' ▶', 0.5)
end
function spotify.pause()
  spotify.tell('pause')
  alert.show(' ◼', 0.5)
end
function spotify.next()
  spotify.tell('next track')
end
function spotify.previous()
  spotify.tell('previous track')
end

function spotify.get(cmd)
  local handle = io.popen('osascript -e \'tell application "Spotify" to ' .. cmd .. "'")
  local result = handle:read("*a")
  handle:close()
  return result
end

function spotify.displayCurrentTrack()
  artist = spotify.get('get the artist of the current track')
  album  = spotify.get('get the album of the current track')
  track  = spotify.get('get the name of the current track')
  alert.show(track .. album .. artist, 1)
end


-- Always return your top-level module; never set globals.
return spotify
