::
:: ::
  ::
/?    310
/-  talk
/+  unfurl, talk
|%
  ++  card  
    $%
        {$hiss wire $~ $httr {$purl p/purl}}
        {$poke wire {@p term} $talk-command command:talk} ::<  talk-command poke
        {$peer wire dock path}                            ::<  start subscription
        {$pull wire dock $~}
        {$null $~}
    ==
  ++  move  {bone card}                                  
--                                               
|_  {hid/bowl state/{subbed/? aud/audience:talk tried/?}}
++  sigh-httr-oembed                                    ::< receive oembed response
  |=  {wir/wire code/@ud headers/mess body/(unit octs)}
  ^-  (quip move +>.$)
  =/  a  (extract-html:unfurl (trip q:(need body)))
  ?~  a
    [~ +>.$]
  ::&  (poja (crip p.u.a))
  [~ +>.$]
++  sigh-httr-meta
  |=  {wir/wire code/@ud headers/mess body/(unit octs)}
  ^-  (quip move +>.$)
  ?~  body  [~ +>.$]
  [~ +>.$]
::
++  sigh-httr
  |=  {wir/wire code/@ud headers/mess body/(unit octs)}
  ^-  (quip move +>.$)
  ?~  body  [~ +>.$]
  =/  md  (metadata:unfurl -.wir u.body)
  ?~  md  [~ +>.$]
  :_  +>.$  :_  ~  
            [ost.hid (send-talk [%app %unfurl (crip (metatape:unfurl (need md)))])]
::
++  talk-sub  
  :^    %peer 
      /talk 
    [our.hid %talk] 
  /f/[(main:talk our.hid)]/(scot %da now.hid)
::
++  talk-unsub
  :^    %pull
      /talk
    [our.hid %talk] 
  ~
++  send-talk
  |=  sep/speech:talk
  ^-  card
  :*  %poke  
      /speak
      [our.hid %talk]
      %talk-command  
      :-  %publish
      :_  ~
      :+  (shaf %thot eny.hid)
        :: porch
        [[[%& our.hid (main:talk our.hid)] *envelope:talk %pending] ~ ~]
      [now.hid *bouquet:talk sep]
  ==
::
++  send-image
  |=  {b/@t a/purl}
  ^-  (quip move +>.$)
  :_  +>.$
  :_  ~
  :-  ost.hid
  %-  send-talk 
  :+  %app 
    %unfurl 
  %-  crip 
  %-  pojo 
  %-  meta2json:unfurl
  :*  (some '')
      (some '')
      (some (crip (earn a)))
      (some '')
      (some '')
      (some '')
      (some '')
      `b
  ==
::
++  proc-grams
  |=  grams/(list telegram:talk)
  ^-  (quip move +>.$)
  ?~  grams  [~ +>.$]
  =*  gram  i.grams
  =*  seri  p.gram
  =.  aud.state  q.q.gram
  =*  spee  r.r.q.gram
  ?+  -.spee  [~ +>.$]
    $url  ?:  (is-image:unfurl p.p.spee) 
            (send-image (scot %uvh seri) p.p.spee)
          (send-req /(scot %uvh seri) p.p.spee)
  ==
::
++  send-req
  |=  {wir/wire prul/purl}
  ^-  (quip move +>.$)
  :_  +>.$  :_  ~  [ost.hid %hiss wir ~ %httr %purl prul]
::
++  poke-noun
  |=  cmd/@tas
  ^-  (quip move +>.$)
  ?:  =(cmd %listen)
    :_  +>.$  ~[[ost.hid talk-sub]]
  :_  +>.$  ~[[ost.hid talk-unsub]]
::
++  diff-talk-report                                    ::>  accept talk report
  |=  {wir/wire rep/report:talk}
  ^-  (quip move +>.$)
  ?+  -.rep  [~ +>.$]
    $grams  (proc-grams q.rep)
  ==
++  prep  _`.
--
