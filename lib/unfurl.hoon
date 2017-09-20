/+  string
|%
  ++  titl  
    :~  "twitter:title" 
        "og:title"
    ==
  ++  desc
    :~
      "og:description"
      "twitter:description"
    ==
  ++  imag
    :~
      "og:image"
      "twitter:image"
    ==
  ++  type
    :~
      "twitter:card"
    ==
  :: do we need size?
  ++  play
    :~
      "og:video:url"
      "twitter:player"
    ==
  ++  pwid
    :~
      "og:video:width"
      "twitter:player:width"
    ==
  ++  phei
    :~
      "og:video:height"
      "twitter:player:height"
    ==
  ++  url
    :~
      "og:url"
      "twitter:url"
    ==
  ++  meta  
    $:  titl/(unit @t) 
        desc/(unit @t) 
        imag/(unit @t) 
        play/(unit @t) 
        pwid/(unit @t) 
        phei/(unit @t) 
        url/(unit @t)
        seri/(unit @t)
    ==
  ::  find arbitrary tags
  ++  get-prop
    |=  {nodelist/(list marx) props/(list tape)}
    =/  out/(unit @t)  ~
    ^-  (unit @t)
    |-  
    ?~  nodelist  out
    ::
    %=  $
      out   =/  x  %+  grab-prop 
                -.nodelist 
              props
          ?~  x  out  (bind x crip)
      nodelist  +.nodelist
    ==
  ++  grab-prop
    |=  {node/marx props/(list tape)}
    =/  q/?  |
    =/  out/tape  ~
    ^-  (unit tape)
    |-
    ?~  a.node  ?:(q `out ~)
    %=  $
      a.node  +.a.node
      q   ?~  (find ~[v.i:-.a.node] props)
            q
          &
      out   ?:  ?=({$content *} -.a.node)
            ->.a.node
          out
    ==
  ++  parse-tag
    |=  a/@
    ^-  (unit marx)
    =/  b  (rush a head:poxa)
    :: needs to be a way to invert this?
    ?~  b  
      =/  c  (rush a empt:poxa)
      ?~  c
        c
      `-.u.c
    b
  ++  find-all-tags
    |=  {st/tape tsta/tape tsto/tape}
    ^-  (list marx)
    =/  ind  (fand tsta st)
    =/  stout/(list marx)  ~
    |-  
    ?~  ind  stout
    %=  $
      ind  +.ind
      stout  =/  x  %-  parse-tag
                    %-  crip
                    %^    find-tags
                        %^    get:string 
                            st 
                          -.ind 
                        ?:  (gth (lent ind) 1) 
                          +<.ind
                        (lent st)
                      tsta
                    tsto
             ?~  x  stout
             %+  welp
               stout
             :_  ~
             u.x
    ==
  ++  find-tags
    |=  {st/tape tsta/tape tsto/tape}
    :: return tag and contents
    ^-  tape
    =/  sta
    (find tsta st)
    ?~  sta  ~
    =/  sto
    (find tsto (get:string st u.sta (lent st)))
    ?~  sto  ~
    (get:string st u.sta (add (add u.sta u.sto) (lent tsto)))
  :: take in html, return meta object
  ++  meta2json
    |=  a/meta
    ^-  json
    %-  jobe
    :~
      title+[%s (fall titl.a '')]
      description+[%s (fall desc.a '')]
      image+[%s (fall imag.a '')]
      player+[%s (fall play.a '')]
      player-width+[%s (fall pwid.a '')]
      player-height+[%s (fall phei.a '')]
      url+[%s (fall url.a '')]
      serial+[%s (fall seri.a '')]
    ==
  ++  is-image
    |=  a/purl
    ^-  ?
    =*  ext  p.q.a
    ?~  ext  |
      ?:  ?|  =('jpg' (fall ext ''))
              =('jpeg' (fall ext ''))
              =('png' (fall ext ''))
              =('gif' (fall ext ''))
              =('tiff' (fall ext ''))
              =('JPG' (fall ext ''))
              =('JPEG' (fall ext ''))
              =('PNG' (fall ext ''))
          ==
          &
      |
  ::
  ++  metatape
    |=  a/meta
    ^-  tape
    (pojo (meta2json a))
  ::
  ::
  ++  metadata
    |=  {ser/@t htm/octs}
    ^-  (unit meta)
    =/  tmp  (find-all-tags (trip q.htm) "<meta" ">")
    ::  identify empties here
    =/  t  (get-prop tmp titl) 
    =/  d  (get-prop tmp desc) 
    =/  i  (get-prop tmp imag)
    =/  p  (get-prop tmp play)
    :: test
    ?:  ?&  ?=($~ (fall t ~))
            ?=($~ (fall d ~))
            ?=($~ (fall i ~))
            ?=($~ (fall p ~))
        ==
        ~
    %-  some
    :*
        t
        d
        i
        p
        (get-prop tmp pwid)
        (get-prop tmp phei)
        (get-prop tmp url)
        `ser
    ==
  ::  return all meta tags
  ++  get-meta
    |=  co/@t
    ^-  (unit manx)
    (poxa co)
  :: used for oembed
  ++  find-html
    |=  st/tape
    ^-  (unit (pair @u @u))
    ::`[0 0]
    =/  sta
    (find "\"html" st)
    ?~  sta  ~
    =/  sto
    (find-nth:string (get:string st u.sta (lent st)) "," 1)
    ?~  sto  ~
    `[u.sta (add u.sta u.sto)]
  ++  trim-html
    |=  st/tape
    ^-  (unit tape)
    =/  sta
    (find ": " st)
    ?~  sta  ~
    `(get:string st (add u.sta 2) (sub (lent st) 1))
  ++  extract-html
    |=  st/tape
    ^-  (unit (pair tape tape))
    =/  in
    (find-html st)
    ?~  in  ~
    =/  ht
    (trim-html (get:string st p.u.in (add q.u.in 1)))
    ?~  ht  ~
    `[(delete:string st p.u.in (add q.u.in 1)) u.ht]
--
