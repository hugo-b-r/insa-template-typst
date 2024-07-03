#let project(title: "", student: "", promo_number: "", group_number: "", company: "", front_comment: "", date: datetime.today(), body, company_referent: "", school_referent: "", front_image: "") = {
  // Set the document's basic properties.
  set document(author: student, title: title)
  set page(
    paper: "a4",
    header: context {
      if counter(page).get().first() > 1 [
        #set text(10pt)
        #grid(
          columns: (1fr, 1fr),
          align(left,
            image("../assets/insa_logo.png", width: 50%)
          ),
          align(right, [
            #let subheading = query(
                selector(heading.where(level: 1)).before(here())
              )
            #if subheading.len() != 0 {
              subheading.last().body
            }
          ]),
        )
        #pad(bottom: 2pt, box(width: 100%, height: 1pt, fill: black))
      ]
    },
    header-ascent: 10%,
    number-align: center,
    numbering: "1",
    margin: (
      top: 2.5cm,
      bottom: 2cm,
      left: 2cm,
      right: 2cm,
    ),
  )

  set text(lang: "fr", font: "Times New Roman")
  
  // Title row.
  align(center + horizon)[
    #block(text(weight: 900, 21pt, title))
    // Author information.
    #set text(12pt)
    #student \
    Promotion n°#promo_number, année universitaire : #{date.year()-1}-#date.year()
    #if front_image != "" {
      pad(y: 40pt, image(front_image))
    }
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 20pt,
      align(center + horizon, image("../assets/insa_logo.png", width: 50%)),
      image("../assets/apple_logo.jpg", width: 15%),
      "INSA de Lyon",
      "Apple Computer",
      [Professeur référent: #school_referent],
      [Tuteur: #company_referent],
    )
    #pad(top: 20pt, text(weight: 900, 14pt, front_comment))
  ]
  

  // Main body.
  set par(justify: true)
  set heading(numbering: "I.1.a)")
  pagebreak()
  set text(11pt)

  body
}