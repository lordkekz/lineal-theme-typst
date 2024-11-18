#import "@preview/touying:0.5.3": *
#import "@preview/numbly:0.1.0": *

#import "src/theme.typ": lineal-theme, title-slide

#show: lineal-theme.with(
  aspect-ratio: "16-9",
  // config-common(handout: true),
  config-info(
    title: [lineal],
    subtitle: [A Typst slide template],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
    logo: "/assets/img/logo.svg",
  ),
)

#set heading(numbering: numbly("{1}", default: "1.1"))

#title-slide()

#include "content/index.typ"
