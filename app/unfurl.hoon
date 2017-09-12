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
        {$null $~}
    ==
  ++  move  {bone card}                                  
--                                               
|_  {hid/bowl state/{subbed/? aud/audience:talk}}
++  sigh-httr-oembed
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
  ::[~ +>.$]
  :_  +>.$  :_  ~  
            :: this is atrocious and terrible
            :: conslidate all meta libs
            [ost.hid (send-talk [%app %unfurl (crip (metatape:unfurl (need (metadata:unfurl u.body))))])]
++  talk-sub  [%peer /talk [our.hid %talk] /f/[(main:talk our.hid)]/(scot %da now.hid)]
::
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
        [[[%& our.hid (main:talk our.hid)] *envelope:talk %pending] ~ ~]
      [now.hid *bouquet:talk sep]
  ==
++  proc-grams
  |=  grams/(list telegram:talk)
  ^-  (quip move +>.$)
  ?~  grams  [~ +>.$]
  =*  gram  i.grams
  =*  seri  p.gram
  =.  aud.state  q.q.gram
  ::~&  aud.state
  ::~&  (my [[our.hid (main:talk our.hid)] *envelope:talk %pending] ~ )
  =*  spee  r.r.q.gram
  ?+  -.spee  [~ +>.$]
    $url  (send-req /(scot %uvh seri) p.p.spee)
  ==
++  send-req
  |=  {wir/wire prul/purl}
  ^-  (quip move +>.$)
  :_  +>.$  :_  ~  [ost.hid %hiss wir ~ %httr %purl prul]
++  poke-noun
  |=  {wi/wire turl/@t}
  ^-  (quip move +>.$)
  =+  ^=  url
  %-  epur
  turl
  ?~  url
    [~ +>.$]
  :_  +>.$  ~[[ost.hid talk-sub] [ost.hid %hiss wi ~ %httr %purl u.url]]
::
++  diff-talk-report                                    ::>  accept talk report
  |=  {wir/wire rep/report:talk}
  ^-  (quip move +>.$)
  ::[~ +>.$]
  ?+  -.rep  [~ +>.$]
    $grams  (proc-grams q.rep)
  ==
++  prep  _`.
--
