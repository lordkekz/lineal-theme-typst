#import "../src/layouts.typ"
#import "../src/components/repository.typ": repository
#import "../src/components/code-block.typ": code-block
#import "../src/components/quote.typ": quote

= Components

== Repository

#layouts.page-center(
  block(width: 50%)[    
    #repository(
      name: "ellsphillips/lineal",
      languages: (
        "Typst": 100,
      )
    )
  ]
)



== Quote

#layouts.page-center(
  quote(author: "Steve Jobs")[
    The only way to do great work is to love what you do.
  ]
)



== Code block

#let pre = "
def hello(name: str) -> None:
    print(f'Hello, {name}!')

if __name__ == '__main__':
    hello('Typst')
"

#layouts.page-center(
  code-block(
    filename: "src/app/hello_typst.py",
    language: "python",
    pre,
  )
)
