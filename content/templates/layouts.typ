#import "../../lib.typ": brand
#import "../../src/layouts.typ"

= Layouts

== Two boxes

#layouts.two-boxes(
  brand.wordmark,
  brand.wordmark
)



== Contained

#layouts.contained(
  columns(2, [
    - #lorem(10)
    - #lorem(15)
    - #lorem(25)
  ]),
  brand.wordmark
)



== Four columns

#layouts.four-columns(
  [
    #text(weight: "bold", brand.wordmark)
    #v(1em)
    #text(size: 10.5pt)[#lorem(60)]
  ],
  [
    #text(weight: "bold", brand.wordmark)
    #v(1em)
    #text(size: 10.5pt)[#lorem(45)]
  ],
  [
    #text(weight: "bold", brand.wordmark)
    #v(1em)
    #text(size: 10.5pt)[#lorem(75)]
  ],
  [
    #text(weight: "bold", brand.wordmark)
    #v(1em)
    #text(size: 10.5pt)[#lorem(50)]
  ]
)



== Matrix

#layouts.matrix((
  brand.wordmark,
  brand.wordmark,
  brand.wordmark,
  brand.wordmark,
  brand.wordmark,
  brand.wordmark
))