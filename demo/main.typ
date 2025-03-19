#import "@preview/touying:0.5.3": *
#import "@preview/numbly:0.1.0": *

#import "../lib.typ": lineal-theme, title-slide, colour, brand




#show: lineal-theme.with(
  aspect-ratio: "16-9",
  // config-common(handout: true),
  config-info(
    title: brand.wordmark,
    subtitle: [A Typst slide template],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
    logo: brand.logo,
  ),
)

#set heading(numbering: numbly("{1}", default: "1.1"))

#title-slide()

#include "content/index.typ"
