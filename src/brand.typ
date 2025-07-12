#let tech-colours = (
  other: rgb("#ffffff"),
  typescript: rgb("#3178C6"),
  javascript: rgb("#f7df1e"),
  html: rgb("#e34c26"),
  css: rgb("#264de4"),
  python: rgb("#306998"),
  typst: rgb("#239CAD"),
  docker: rgb("#384d54"),
  mustache: rgb("#724b3b"),
  smarty: rgb("#f0c040"),
)

#let base-colours = (
  primary: rgb("#368429"),
  secondary: rgb("#003169"),
  neutral-light: rgb("#fafafa"),
  neutral-dark: rgb("#233b37"),
)

#let colour = (
  ..base-colours,
  primary-light: base-colours.primary.lighten(50%),
  dev: rgb("#ec4899"),
  tech: tech-colours,
)

#let brand = (
  wordmark: [$bb("L")"ineal"$],
  logo: square(size: 1em, fill: gradient.linear(colour.primary, colour.primary-light, angle: -30deg), radius: .1em),
)
