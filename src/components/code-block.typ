#import "../../src/brand.typ": colour

#let DEFAULT_CODE_THEME = "../static/dark-plus.tmTheme"

#let code-block-icon(
  language: "python"
) = {
  // TODO re-enable when SVGs are reliably reproducible
  // block(
  //   width: .6em,
  //   height: .6em,
  //   image("../static/icons/github.svg")
  // )
}

#let code-block-title(
  title: "Code block",
  language: "python"
) = {
  let parts = title.split("/")
  let filename = parts.pop()
  let path = parts.join("/")

  let filenameParts = filename.split(".")
  let extension = filenameParts.pop()

  stack(
    dir: ltr,
    spacing: 0pt,

    align(
      horizon,
      code-block-icon(language: language),
    ),
    h(.3em),
    block(inset: (y: .1em))[
      #set text(size: .5em, font: "Monaco")
      #text(fill: black.lighten(80%), path + "/")#text(fill: white, filename)
    ] 
  )
}

#let code-block(
  theme: DEFAULT_CODE_THEME,
  filename: "app.py",
  language: "python",
  content,
) = {
  block(
    radius: .25em,
    inset: 0pt,
    stroke: black,
    clip: true,
    fill: colour.neutral-dark,

    stack(
      dir: ttb,
      spacing: 0pt,
      
      // Header with filename, language, and icon
      block(
        inset: (x: .8em, y: .5em),
        code-block-title(title: filename, language: language)
      ),

      // Code content
      block(
        inset: .8em,
        stroke: black,
        fill: black.lighten(10%),

        {
          show raw: it => block(
            text(fill: colour.neutral-light, it)
          )

          raw(
            content.trim(),
            lang: language,
            theme: theme,
          )
        }
      )
    )
  )
}
