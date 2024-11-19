#import "@preview/touying:0.5.3": *
#import "@preview/numbly:0.1.0": *

#import "src/theme.typ": lineal-theme
#import "src/title.typ": title-slide
#import "src/colour.typ": colour

#let lineal-wordmark = text(size: 40pt)[$bb("L")"ineal"$]
#let lineal-logo = square(size: 1em, fill: gradient.linear(colour.primary, colour.primary-light, angle: -30deg), radius: .1em)

#show: lineal-theme.with(
  aspect-ratio: "16-9",
  // config-common(handout: true),
  config-info(
    title: lineal-wordmark,
    subtitle: [A Typst slide template],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
    logo: lineal-logo,
  ),
)

#set heading(numbering: numbly("{1}", default: "1.1"))

#title-slide()

#include "content/index.typ"
