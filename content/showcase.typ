#import "@preview/touying:0.5.3": components
#import "@preview/tablex:0.0.9": *

#import "../src/brand.typ": brand, colour

= Showcase

== Table

#let table-cell(img, title, description) = {
  align(top + left, block[
    #set align(horizon)
    #stack(
      dir: ltr,
      spacing: .5em,
      img,
      text(weight: "bold", title),
    )
    #v(-.33em)
    #description
  ])
}

#grid(
  columns:(2fr, 1fr),
  column-gutter: 1em,

  components.cell(inset: (y: .5em))[
    #set text(size: 10.5pt)
    #tablex(
      columns: (1fr,) * 3,
      inset: (x: 1em, y: 1em),
      align: top + left,
      auto-vlines: false,
      auto-hlines: false,
      header-rows: 2,

      fill: (column, row) => {
        if calc.even(row) {
          none
        } else {
          colour.neutral-light
        }
      },
      
      // Header
      text(size: 14pt)[*Free*], text(size: 14pt)[*Basic*], text(size: 14pt)[*Pro*], 
      hlinex(),
    
      table-cell(
        brand.logo,
        "Feature 1",
        lorem(20),
      ),
      table-cell(
        brand.logo,
        "Feature 1",
        lorem(15),
      ),
      table-cell(
        brand.logo,
        "Feature 1",
        lorem(18),
      ),
      [],
      table-cell(
        brand.logo,
        "Feature 2",
        lorem(12),
      ),
      table-cell(
        brand.logo,
        "Feature 2",
        lorem(16),
      ),
      [],
      [],
      table-cell(
        brand.logo,
        "Feature 3",
        lorem(30),
      ),
      hlinex(),
    )
  ],

  block(
    fill: colour.neutral-light,
    width: 100%,
    height: 100%,
    radius: .5em,
    inset: 1em,

    align(top + left, [
      #set text(size: 10.5pt)
      #set list(marker: (level) => {
        place(dy: 2pt, square(fill: colour.primary, radius: 1.5pt, size: 4pt))
        h(.5em)
      })

      #text(size: 14pt)[*Features*]

      + Item 1
        - Subitem 1
        - Subitem 2
      + Item 2
        - Subitem 1
        - Subitem 2
      + Item 3
        - Subitem 1
        - Subitem 2

      #lorem(70)
    ])
  )
)


