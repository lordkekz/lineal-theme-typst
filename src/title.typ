#import "@preview/touying:0.5.3": *

#import "brand.typ": colour

#let title-slide(
  extra: none,
  ..args,
) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    set text(fill: self.colors.neutral-darkest)

    // TODO re-enable when SVGs are reliably reproducible
    // place(
    //   horizon + center,
    //   image("static/title-bg.svg")
    // )

    block(
      width: 75%,
      inset: 2cm,
      breakable: false,
      align(
        horizon + left,
        {
          v(.5em)
          if info.date != none {
            v(1em + .7em)
          }
          block(
            inset: 0em,
            breakable: false,
            {
              stack(
                dir: ltr,
                spacing: 1fr,
                text(size: 40pt, info.title),
                info.logo,
              )
              line(
                length: 100%,
                stroke: 2pt + colour.primary,
              )
              if info.subtitle != none {
                parbreak()
                text(size: 1.2em, info.subtitle)
              }
            },
          )
          v(.5em)
          if info.author != none {
            parbreak()
            text(size: .7em, info.author)
          }
          v(.5em)
          if info.institution != none {
            parbreak()
            text(size: .7em, info.institution)
          }
          if info.date != none {
            v(1em)
            text(size: .7em, utils.display-info-date(self))
          }
        },
      )
    )
  }
  self = utils.merge-dicts(
    self,
    config-common(freeze-slide-counter: true),
    config-page(
      fill: self.colors.neutral-light,
      margin: 0em
    ),
  )
  touying-slide(self: self, body)
})
