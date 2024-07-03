#import "../templates/short-report.typ":project

#show: project.with(
  title: "A spoonful of title",
  authors: ("Walt Disney",),
  
)

#lorem(42)
= Premier Lorem
== Premier sous-Lorem
=== Premier sous sous lorem
#lorem(42)
=== Second sous sous lorem
#lorem(42)
== second sous lorem
=== Troisieme sous sous lorem
#lorem(42)
=== quatrieme sous sous lorem
#lorem(42)
