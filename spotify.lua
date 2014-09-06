--- === mjolnir.lb.spotify ===
--
-- Controls for Spotify music player
--
-- Usage: local spotify = require "mjolnir.lb.spotify"

local spotify = {}

local alert = require "mjolnir.alert"

-- Internal function to pass a command to Applescript.
local function tell(cmd)
  return os.execute('osascript -e \'tell application "Spotify" to ' .. cmd .. "'")
end

--- mjolnir.lb.spotify.play() -> nil
--- Function
--- Toggles play/pause of current Spotify track
function spotify.play()
  tell('playpause')
  alert.show(' ▶', 0.5)
end
--- mjolnir.lb.spotify.pause() -> nil
--- Function
--- Pauses of current Spotify track
function spotify.pause()
  tell('pause')
  alert.show(' ◼', 0.5)
end
--- mjolnir.lb.spotify.next() -> nil
--- Function
--- Skips to the next Spotify track
function spotify.next()
  tell('next track')
end
--- mjolnir.lb.spotify.previous() -> nil
--- Function
--- Skips to previous Spotify track
function spotify.previous()
  tell('previous track')
end

-- Internal command used to pass a command and get back output from the command.
local function get(cmd)
  local handle = io.popen('osascript -e \'tell application "Spotify" to ' .. cmd .. "'")
  local result = handle:read("*a")
  handle:close()
  return result
end

--- mjolnir.lb.spotify.displayCurrentTrack() -> nil
--- Function
--- Displays information for current track
function spotify.displayCurrentTrack()
  artist = get('get the artist of the current track')
  album  = get('get the album of the current track')
  track  = get('get the name of the current track')
  alert.show(track .. album .. artist, 1)
end

return spotify
