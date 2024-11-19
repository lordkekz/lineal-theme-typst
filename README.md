# Lineal

IPA: /ˈlɪniəl/

Made up of, or having the characteristic of, lines.

Lineal is a Typst template for generating beautifully clean and configurably awesome slides.

![Demo slide deck](/assets/img/demo.gif)

## Philosophy

As a long time user of TeX, I have developed and embedded countless LaTeX applications into personal and corporate environments, e.g. automating documentation, conference materials, posters, resumes, etc.

However, LaTeX is showing its age. Compiling a some 30-slide presentation, for instance, takes perhaps a second, and may requires multiple renders to sync TikZ positioning and cross-document referencing. Typst remediates these issues in real-time and with better control and confidence in its data modelling.

Hence, Lineal was born. A professional set of slides produced near instantly, readily equipped with configurable theming and a suite of flexible components.

## Usage

Lineal is currently only available here. Get started by cloning the repository and populating your own `/content/<slug>.typ` files:

```bash
git clone https://www.github.com/ellsphillips/lineal
```

Marking up content is as you would with any other Typst document, where the section (`= <section-title>`) and subsection (`== <slide-title>`) shorthands generate the new section slides with dynamic outline and new tracked slides respectively.

## Contributing

PRs are very welcome. If you think Lineal could be improved in any way or is missing a feature, please raise a request 😎

## Acknowledgements

A heartfelt thank you to the team behind [Typst](https://github.com/typst/typst), developing a product that not only preserves the beauty of LaTeX's typesetting, but improves on its developer experience in every way, in line with ongoing community feedback.

The creators of the [`Touying`](https://github.com/touying-typ/touying) and [`Polylux`](https://github.com/andreasKroepelin/polylux) Typst packages, on which Lineal is built.
