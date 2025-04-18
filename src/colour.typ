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
)
