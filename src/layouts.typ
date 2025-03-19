#import "@preview/touying:0.5.3": components

#import "../src/brand.typ": colour, brand

#let page-center(content) = {
  block(width: 100%)[
    #set align(horizon + center)
    #components.cell(width: auto)[
      #set align(left)
      #content
    ]
  ]
}

#let two-boxes(content1, content2) = {
  grid(
    columns: 2,
    column-gutter: 1em,
    align: horizon + center,
    
    block(
      height: 100%,
      width: 100%,
      fill: gradient.linear(colour.primary, colour.primary-light, angle: -30deg),
      inset: .5em,
      radius: .5em,
    )[
      #set text(fill: white)
      #content1
    ],
    
    block(
      height: 100%,
      width: 100%,
      fill: colour.neutral-light,
      stroke: colour.primary,
      inset: .5em,
      radius: .5em,
    )[
      #set text(fill: colour.primary)
      #content2
    ]
  )
}

#let contained(content, sidebar) = {
  block(
    inset: .5em,
    radius: .5em,
    width: 100%,
    height: 100%,
    fill: colour.neutral-light,

    grid(
      columns: 2,
      column-gutter: 1em,
      
      content,

      block(
        height: 100%,
        width: 100%,
        fill: colour.primary,
        inset: .5em,
        radius: .25em,

        align(horizon + center)[
          #set text(fill: white)
          #sidebar
        ]
      )
    )
  )
}

#let four-columns(..contents) = {
  let grid-item(fill, body) = {
    block(
      width: 100%,
      height: 100%,
      inset: .5em,
      radius: 4pt,
      fill: fill,
      body
    )
  }

  grid(
    columns: (1fr,) * 4,
    column-gutter: 1em,
    align: top + left,
    
    ..contents.pos().enumerate().map(((index, content)) => {
      let lightness = 20% * index
      grid-item(colour.primary.lighten(lightness))[
        #set text(fill: if lightness > 30% { black } else { white })
        #content
      ]
    })
  )
}

#let matrix(items) = {
  let matrix-item(body, fill: colour.primary) = {
    block(
      width: 100%,
      height: 50% - .5em,
      inset: .5em,
      radius: .5em,
      fill: fill,
      body
    )
  }

  grid(
    columns: (1fr,) * 3,
    rows: 2,
    gutter: 1em,
    align: horizon + center,
    ..items.map(item => matrix-item[#text(fill: white, item)])
  )
}
