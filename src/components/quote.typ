#import "../../src/brand.typ": colour

#let quote(content, author: str) = {
  block(
    width: 100%,
    fill: colour.neutral-light,
    inset: 2em,
    radius: .5em,
    
    stack(
      dir: ttb,
      spacing: 1em,

      {
        set align(left)
        text(fill: black.lighten(80%), size: 3em, weight: "bold", ["])
        v(-3em)
        [
          #content
          #align(right)[--- #author]
        ]
      },
    )
  )
}
