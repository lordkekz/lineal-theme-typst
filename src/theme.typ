#import "@preview/touying:0.5.3": *

#import "colour.typ": colour

#let multicolumns(columns: auto, alignment: top, gutter: 1em, ..bodies) = {
  let bodies = bodies.pos()
  if bodies.len() == 1 {
    return bodies.first()
  }
  let columns = if columns == auto {
    (1fr,) * bodies.len()
  } else {
    columns
  }
  grid(columns: columns, gutter: gutter, align: alignment, ..bodies)
}

#let _typst-builtin-align = align



#let slide(
  title: auto,
  align: auto,
  config: (:),
  repeat: auto,
  setting: body => body,
  composer: auto,
  ..bodies,
) = touying-slide-wrapper(self => {
  if align != auto {
    self.store.align = align
  }
  // restore typst builtin align function
  let align = _typst-builtin-align
  let header(self) = {
    set align(top)
    show: components.cell.with(inset: (x: 2em))
    set align(bottom)
    components.left-and-right(
      text(
        fill: self.colors.primary,
        weight: "bold",
        size: 1em,
        if title != auto {
          utils.fit-to-width.with(grow: false, 100%, title)
        } else {
          utils.call-or-display(self, self.store.header)
        }
      ),
      text(
        fill: self.colors.primary,
        weight: "bold",
        size: 0.6em,
        utils.call-or-display(self, self.store.header-right)
      ),
    )
    
  }
  let footer(self) = {
    set align(bottom)
    set text(size: 0.8em)
    show: components.cell.with(inset: (x: 2em, y: -1em))
    if self.store.footer-progress {
      box(width: 100%)[
        #components.progress-bar(height: 2pt, colour.primary, colour.primary-light)
      ]
    }
    show: components.cell.with(inset: (y: 2em))
    components.left-and-right(
      text(fill: self.colors.neutral-darkest.lighten(40%), utils.call-or-display(self, self.store.footer-left)),
      text(fill: self.colors.neutral-darkest, utils.call-or-display(self, self.store.footer-right)),
    )
  }
  let self = utils.merge-dicts(
    self,
    config-page(
      fill: self.colors.neutral-lightest,
      header: header,
      footer: footer,
    ),
  )
  let new-setting = body => {
    show: align.with(self.store.align)
    set text(fill: self.colors.neutral-darkest)
    show heading.where(level: self.slide-level + 1): it => {
      stack(
        dir: ltr, spacing: .4em,
        image("uob-bullet.svg", height: .8em),
        text(fill: self.colors.primary, it.body)
      )
    }
    set enum(numbering: (nums) => {
      text(fill: self.colors.primary, weight: "bold", str(nums) + ".")
    })
    set list(marker: (level) => {
      text(fill: self.colors.primary, weight: "bold", sym.triangle.r.filled)
    })
    set table(stroke: self.colors.primary)
    show: setting
    block(inset: (bottom: 1em), body)
  }
  touying-slide(self: self, config: config, repeat: repeat, setting: new-setting, composer: multicolumns, ..bodies)
})



#let title-slide(
  extra: none,
  ..args,
) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    set text(fill: self.colors.neutral-darkest)
    align(
      center + horizon,
      {
        block(
          inset: 0em,
          breakable: false,
          {
            text(size: 2em, info.title, weight: "bold")
            if info.subtitle != none {
              parbreak()
              text(size: 1.2em, info.subtitle)
            }
          },
        )
        set text(size: .8em)
        v(1em)
        if info.institution != none {
          parbreak()
          text(size: .9em, info.institution)
        }
        if info.date != none {
          parbreak()
          text(size: .8em, utils.display-info-date(self))
        }
      },
    )
  }
  self = utils.merge-dicts(
    self,
    config-common(freeze-slide-counter: true),
    config-page(
      fill: self.colors.primary-light,
      margin: 0em
    ),
  )
  touying-slide(self: self, body)
})



#let outline-slide(title: [Outline], column: 2, marker: auto, ..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let header = {
    set align(center + bottom)
    block(
      fill: self.colors.neutral-lightest,
      outset: (x: 2.4em, y: .8em),
      stroke: (bottom: self.colors.primary + 3.2pt),
      text(self.colors.primary, weight: "bold", size: 1.6em, title)
    )
  }
  let body = {
    set align(horizon)
    show outline.entry: it => {
      let mark = if ( marker == auto ) {
        image("uob-bullet.svg", height: .8em)
      } else if type(marker) == image {
        set image(height: .8em)
        image
      } else if type(marker) == symbol {
        text(fill: self.colors.primary, marker)
      }
      block(stack(dir: ltr, spacing: .8em, mark, it.body), below: 0pt)
    }
    show: pad.with(x: 1.6em)
    columns(column, outline(title: none, indent: 1em, depth: 1))
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      margin: (top: 4.8em, bottom: 1.6em),
      fill: self.colors.neutral-lightest
    )
  )
  touying-slide(self: self, body)
})



#let new-section-slide(level: 1, numbered: true, body) = touying-slide-wrapper(self => {
  let slide-body = {
    set align(horizon)
    show: pad.with(left: 15%, right: 15%)

    components.adaptive-columns(outline())
    
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(fill: self.colors.neutral-lightest),
  )
  touying-slide(self: self, slide-body)
})



#let focus-slide(align: horizon + center, body) = touying-slide-wrapper(self => {
  let _align = align
  let align = _typst-builtin-align
  self = utils.merge-dicts(
    self,
    config-common(freeze-slide-counter: true),
    config-page(fill: self.colors.neutral-lightest, margin: 2em),
  )
  set text(fill: self.colors.primary, size: 1.5em)
  touying-slide(self: self, align(_align, body))
})



#let lineal-theme(
  aspect-ratio: "16-9",
  align: horizon,
  header: self => utils.display-current-heading(setting: utils.fit-to-width.with(grow: false, 100%), depth: self.slide-level),
  logo: self => self.info.logo,
  header-right: context utils.slide-counter.display() + " / " + utils.last-slide-number,
  footer-left: self => pad(square(size: 1em, fill: gradient.linear(colour.primary, colour.primary-light, angle: -30deg), radius: .1em), y: -.2em),
  footer-right: "some info",
  footer-progress: true,
  ..args,
  body,
) = {
  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      margin: (top: 3em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(
      init: (self: none, body) => {
        set text(size: 20pt, font: "Lato")
        show highlight: body => text(fill: self.colors.primary, strong(body.body))
        body
      },
      alert: utils.alert-with-primary-color
    ),
    config-colors(..colour),
    // save the variables for later use
    config-store(
      align: align,
      header: header,
      header-right: header-right,
      footer-left: footer-left,
      footer-right: footer-right,
      footer-progress: footer-progress,
    ),
    config-info(
      datetime-format: "[day] [month repr:short] [year]"
    ),
    ..args,
  )
  body
}
