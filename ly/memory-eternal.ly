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
}

sopranoVoice = \relative c'' {
  \set Staff.autoBeaming = ##f
  \global
  \dynamicUp
  
  g2. g4
  g2 g2
  g2( b
  a) g
  
  fis2. fis4
  fis2 fis2
  fis( a
  g4\( fis e\)) fis

  g2. fis4
  e2 dis
  e( g
  fis e)
  dis1
  
  
   \bar "|."
  
}

verseOne = \lyricmode {
Me -- mo -- ry E -- ter -- nal,
Me -- mo -- ry E -- ter -- nal,
Me -- mo -- ry E -- ter -- nal.
  
}

\score {
  \new Staff { \sopranoVoice }
  \addlyrics { \verseOne }
  \layout { }
}
