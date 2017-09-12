/+  string
|%
  ++  titl  
    :~  "twitter:title" 
        "og:title"
    ==
  ++  desc
    :~
      "twitter:description"
      "og:description"
    ==
  ++  imag
    :~
      "twitter:image"
      "og:image"
    ==
  ++  meta  {titl/(unit @t) desc/(unit @t) imag/(unit @t)}
  ::++  entry  (pair schemes/(list tape) endpoint/tape)
  ::++  oembed-map  (map tape entry)
  ::++  find-string
  ::  |=  st/tape
  ::  =/  oema/oembed-map
  ::  %-  my
  ::  :~  :-  "test"
  ::      "this"
  ::      :-  "https://reddit.com/"
  ::      :-  :_  ~
  ::          "https://reddit.com/r/*/comments/*/*"
  ::      "https://www.reddit.com/oembed"
  ::      ::
  ::      :-  "https://www.nytimes.com"
  ::      :-  :~  "https://www.nytimes.com/svc/oembed"
  ::              "https://nytimes.com/*"
  ::              "https://*.nytimes.com/*"
  ::          ==
  ::      "https://www.nytimes.com/svc/oembed/json/"
  ::  ==
  ::  (~(get by oema) st)
  ::  tape -> (unit {start stop})
  ::  find arbitrary tags
  ++  get-prop
    |=  {nl/(list marx) props/(list tape)}
    =/  b/(unit @t)  ~
    ^-  (unit @t)
    |-  
    ?~  nl  b
    ::
    %=  $
      b   =/  x  %+  gp 
                -.nl 
              props
          ?~  x  b  (bind x crip)
      nl  +.nl
    ==
  ++  gp
    |=  {n/marx props/(list tape)}
    =/  q/?  |
    =/  b/tape  ~
    ^-  (unit tape)
    |-
    ?~  a.n  ?:(q `b ~)
    %=  $
      a.n  +.a.n
      q   ?~  (find ~[v.i:-.a.n] props)
            q
          &
      b   ?:  ?=({$content *} -.a.n)
            ->.a.n
          b
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
    ==
  ++  metatape
    |=  a/meta
    ^-  tape
    (pojo (meta2json a))
  ++  metadata
    |=  htm/octs
    ^-  (unit meta)
    =/  tmp  (find-all-tags (trip q.htm) "<meta" ">")
    `[(get-prop tmp titl) (get-prop tmp desc) (get-prop tmp imag)]
  ::  return all meta tags
  ++  get-meta
    |=  co/@t
    ^-  (unit manx)
    (poxa co)
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
