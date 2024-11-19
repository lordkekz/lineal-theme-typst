#import "@preview/touying:0.5.3": utils, components

#import "colour.typ": colour



#let get-current-section-number() = (
  context {
    let selector = selector(heading.where(level: 1)).before(here())
    let level = counter(selector)
    let headings = query(selector)

    if headings.len() == 0 {
      return
    }

    let heading = headings.last()

    return level.get(heading.numbering)
  }
)



#let calculate-progress-ratios(variant, callback) = (
  context {
    let ratios = (
      calc.min(1.0, utils.slide-counter.get().first() / utils.last-slide-counter.final().first()),
      calc.min(1.0, 1 - utils.slide-counter.get().first() / utils.last-slide-counter.final().first())
    )

    callback(ratios)
  }
)



#let progress-bar(variant: str, height: 2pt, ratios: array) = calculate-progress-ratios(ratios => {
  grid(
      columns: ratios.map(r => r * 100%),
      rows: height,
      components.cell(fill: colour.primary),
      components.cell(fill: colour.primary-light),
  )
})
