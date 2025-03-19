#import "@preview/touying:0.5.3": components

#import "../brand.typ": colour, tech-colours

#let repository(name: str, languages: dictionary, ..args) = {
  let total = languages.values().sum()
  let columns = languages.pairs().map(pair => pair.last() * 100% / total)
  let fills = languages.pairs().map(pair => tech-colours.at(lower(pair.first()), default: tech-colours.other))

  stack(
    dir: ttb,

    link("https://github.com/" + name)[
      #set align(left)
      #stack(
        dir: ltr,
        image("../static/icons/github.svg", alt: "GitHub", fit: "contain", format: "svg", height: 1em, width: 1em),
        h(.2em) + "/" + h(.2em),
        text(size: .8em, font: "Monaco", weight: "bold", name),
      )
      #v(.5em)
    ],

    components.cell(
      radius: .5em,
      stroke: colour.neutral-dark,
      height: 1em,
      clip: true,

      grid(
        columns: columns,
        rows: 1em,
        ..fills.map(fill => components.cell(
          fill: fill,
          stroke: colour.neutral-dark,
        ))
      )
    ),

    v(.5em),

    ..languages.pairs().map(pair => {
      let language = pair.first()
      let percentage = pair.last()
      let fill = tech-colours.at(lower(language), default: tech-colours.other)
      let label = text(weight: "bold", language) + " " * 3 + text(size: .75em, fill: colour.neutral-dark.lighten(50%), str(percentage) + "%")


      set align(left)
      stack(
        dir: ltr,
        components.cell(
          fill: fill,
          width: .5em,
          height: .5em,
          stroke: if pair.first() == "Other" { colour.neutral-dark },
          radius: 100%
        ),
        h(.25em) + text(fill: colour.neutral-dark, size: .6em, label),
        v(.75em)
      )
    })
  )
}