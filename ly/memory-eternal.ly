\version "2.18.2"

  #(set! paper-alist (cons '("program" . (cons (* 5.5 in) (* 8.5 in))) paper-alist))
  #(set-default-paper-size "program")
  #(set-global-staff-size 16)

z = {
  \bar "" \break
}

\paper {
  indent = 0\in
  annotate-spacing = ##f
  top-margin = .5\in
  left-margin = .5\in
  bottom-margin = 0\in
  before-title-space = 0\in
  ragged-last = ##f

  %% Between-System Spacing
  system-system-spacing =
    #'((basic-distance . 0)
       (minimum-distance . 0)
       (padding . 4)
       (stretchability . 0))

  line-width = 4.5\in %% presets can be specified in the web form
                      %% note that this doesn't include the width
                      %% of the system brace.

  myStaffSize = #17   %% Same as #(set-global-staff size)

  %% FONT SPECIFICATIONS FOR LYRICS
  %% - Like in the Gregorio app, a dropdown can be created for the user
  %%   to specify the desired lyric font.
  %% - Users should be allowed to choose only the first font; the second 
  %%   and third fonts are for 'sans' and 'fixed-width' font overrides.
  %% - Alternatively, you can pass the same font into all three fields.

  #(define fonts
    (make-pango-font-tree "Garamond Premier Pro"
                          "Arial"
                          "Courier"
                           (/ myStaffSize 20)))
}

\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
  \context {
    \Voice
    \consists "Melody_engraver"
    \override Stem #'neutral-direction = #'()
  }
}

global = {
  \key g \major
  \numericTimeSignature
  \time 4/4
  \partial 4
}

sopranoVoice = \relative c'' {
  \set Staff.autoBeaming = ##f
  \global
  \dynamicUp
  g8[ fis]
  e4 e e d
  g g a g8[ a]
  b4 b a8[ g] e4
  d2. \z
  g8[ fis] 
  e4 e e d
  g g a g8[ a]
  b4 b a8[ g] e4
  e2. \z
  b'8[ c]
  d4 b b8[ a] g4
  a a b g8[ a]
  b4 b8[ a] g4 e
  d2. \z
  g8[fis]
  e4 e e8[d] e[ fis] 
  g4 g a g8[ a] 
  b4 b a8[ g] e4
  e2. \bar "|."
  
}

verseOne = \lyricmode {
LORD, let thy ser -- vant now de -- part
In -- to thy pro -- mised rest;
Since my ex -- pect -- ing Eyes have been
With thy Sal -- va -- tion blessed;
Which, till the Time thy fa -- voured Saints,
And Pro -- phets, on -- ly knew,
Long since pre -- pared, but now set forth
In all the peo -- ple's view.
  
}

\score {
  \new Staff { \sopranoVoice }
  \addlyrics { \verseOne }
  \layout { }
}
