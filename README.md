#Link Unfurling For WebTalk

This library and associated modification to the webtalk front-end will unfurl incoming links, giving 
you previews of links and expanding images and youtube videos.

A simple `%gall` app watches your porch (your incoming `%talk` messages) and, when it sees a candidate 
for unfurling, it checks the url to see if there is available metadata, or otherwise expands the link. 
The resulting metadata is then inserted into your porch (invisible to the rest of the `%talk` channel), 
where it is formatted by a modified version of webtalk. 

![screenshot](https://i.imgur.com/i1eCgyB.png)

##Setup

1. Install `%gall` application

- This application depends on ~palfun's string library https://github.com/Fang-/urbit-string
- Copy the contents of the /app and /lib directory from this repo into the appropriate locations on 
your planet. Better distro methods forthcoming!
- In `%dojo` run the following commands:
- `|start %unfurl`
- `:unfurl %listen`
- To stop the app from unfurling links, you can run
- `:unfurl %ignore`

2. Install front-end

- If you'd like to keep your original webtalk pristine, copy the contents of <your ship>/home/web/talk to 
somewhere civilized
- Copy the contents of this repo's /web/talk into your ship's <your ship>/home/web/talk
- If you'd like to poke around at some very poorly written coffeescript, check here http://www.github.com/vvisigoth/talk/tree/unfurl

##TODO
*includes interface issues*
[ ] 302
[ ] feed style
[ ] include oembed call
[ ] unfurl not a separate message
[ ] refactor hoon lib
[x] second size
[x] multi-type: image w/caption, link prev, video player
[x] mobile(tall) view
[x] measure width at list level
[x] serial in json
[x] eat empties
[x] iframe player
[x] title format
[x] max description
[x] easy start/stop
[x] own component 
[x] handle images at lib level
