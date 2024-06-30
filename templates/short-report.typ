#import "@preview/datify:0.1.2": day-name, month-name, custom-date-format

#let project(title: "", authors: (), date: datetime.today(), body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(
    paper: "a4",
    header: [
      #set text(8pt)
      #grid(
        columns: (1fr, 1fr, 1fr),
        align(left,
          image("../assets/insa_logo.png", width: 50%)
        ),
        align(center, [
          #title
        ]),
        align(right, [
          #for aut in authors [
            #aut,
          ]
        ])
      )
      #box(width: 100%, height: 1pt, fill: black)
    ],
    header-ascent: 0%,
    number-align: center,
    numbering: "1",
    margin: (
      top: 2cm,
      bottom: 2cm,
      left: 2cm,
      right: 2cm,
    ),
  )

  set text(lang: "fr")

  // Title row.
  align(center)[
    #pad(top: 24pt, bottom: 0pt, [
        #block(text(weight: 0, 17pt, title))
        #emph(custom-date-format(date, "Day DD MMMM YYYY", "fr"))
      ]
    )
  ]

  // Author information.
  pad(
    top: 0.25cm,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, author)),
    ),
  )

  // Main body.
  set par(justify: true)
  set text(11pt)

  body
}