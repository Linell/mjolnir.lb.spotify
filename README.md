### Install

~~~bash
$ luarocks install mjolnir.lb.spotify
~~~

### Require

~~~lua
local spotify = require "mjolnir.lb.spotify"
~~~

### Documentation

After requiring, usage is super simple. Bind a few Spotify actions to some hotkeys.
For me, my keyboard has pause, play, and next commands, so displaying the current 
song is the main thing I need. To accomplish that, it's just a matter of something 
like this:

~~~lua
hotkey.bind(mash, 'space', spotify.displayCurrentTrack)
~~~

Full documentation *should* be included in Dash's "Mjolnir" docset.
