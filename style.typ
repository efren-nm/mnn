// InDesign-inspired weekly packet. All layout settings live here.
#let handout-font = "Libertinus Serif"
#let body-size = 12pt
#let title-size = 17pt
#let page-margin = 12.7mm
#let time-column = 32mm
#let column-gap = 4mm
#let row-gap = 12pt
#let reference-size = 11pt
#let global-leading = 0.55em
#let journal-names = (
  "Chemistry of Materials": "Chem. Mater.",
  "Physical Review B": "Phys. Rev. B",
  "Physical Review Letters": "Phys. Rev. Lett.",
  "Nano Letters": "Nano Lett.",
  "Nature Materials": "Nat. Mater.",
  "Nature Nanotechnology": "Nat. Nanotechnol.",
  "Journal of Raman Spectroscopy": "J. Raman Spectrosc.",
  "The Journal of Chemical Physics": "J. Chem. Phys.",
  "Applied Physics Letters": "Appl. Phys. Lett.",
  "Advanced Materials": "Adv. Mater.",
  "Angewandte Chemie": "Angew. Chem.",
)

#let activity(time: "", title: [], presenter: "", notes: none) = (
  kind: "activity", time: time, title: title, presenter: presenter, notes: notes,
)
#let journal-club(
  id: "", time: "", topic: "", presenter: "", key: "",
  pdf: none, pages: 0, student-handout: none, handout-pages: 0,
) = (
  kind: "journal-club", id: id, time: time, topic: topic, presenter: presenter,
  key: key, pdf: pdf, pages: pages,
  student-handout: student-handout, handout-pages: handout-pages,
)

// Read article details directly from the Hayagriva data. There is no separate
// bibliography: the complete bibliographic details appear at each relevant slot.
#let article-title(entry) = {
  let title = entry.title
  if type(title) == dictionary { title = title.value }
  title.replace("{", "").replace("}", "")
}
#let author-name(author) = {
  let parts = if type(author) == str { author.split(",") } else {
    (author.name, author.at("given-name", default: ""))
  }
  let family = parts.at(0).trim()
  let given = if parts.len() > 1 { parts.last().trim() } else { "" }
  let initials = given.split(" ").filter(x => x != "").map(x => x.first() + ".").join(" ")
  if initials == "" { family } else { initials + " " + family }
}
#let paper-reference(entry) = {
  let authors = if type(entry.author) == array { entry.author } else { (entry.author,) }
  let journal = entry.parent.title
  if type(journal) == dictionary { journal = journal.value }
  let journal = journal-names.at(journal, default: journal)
  let year = str(entry.date).slice(0, 4)
  let citation = [
    #author-name(authors.first())#if authors.len() > 1 [ et al.]
    #emph(journal) #strong(str(entry.parent.volume))#if "issue" in entry.parent [(#entry.parent.issue)],
    #str(entry.at("page-range", default: "")).replace("-", "–") (#year).
  ]
  if "doi" in entry.at("serial-number", default: (:)) {
    link("https://doi.org/" + entry.serial-number.doi, citation)
  } else { citation }
}
#let paper-label(slot) = label("paper-first-" + slot.id)

#let timetable-row(slot, works) = block(below: row-gap, breakable: false)[
  #grid(
    columns: (time-column, 1fr), column-gutter: column-gap,
    [#slot.time],
    [
      #if slot.kind == "journal-club" [
        #article-title(works.at(slot.key))
        #v(3pt)
        #text(size: reference-size)[#paper-reference(works.at(slot.key))]
        #v(3pt)
        #strong(slot.presenter)
        #v(3pt)
        #text(size: 10.5pt)[
          #link(paper-label(slot))[
            Full paper: page #context counter(page).at(paper-label(slot)).first()
          ]
        ]
      ] else [
        #slot.title
        #if slot.notes != none [#linebreak()#emph(slot.notes)]
        #if slot.presenter != "" [#v(3pt)#strong(slot.presenter)]
      ]
    ],
  )
]

#let section-cover(title) = page(numbering: none)[
  #align(center + horizon)[#text(size: 30pt, weight: "bold")[#title]]
]
#let slot-cover(slot, works) = page(/* numbering: none */)[
  #v(1fr)
  #text(size: 22pt, weight: "bold")[Topic: #slot.topic]
  #v(10pt)
  #text(size: 22pt, weight:200, fill: rgb("#9e9d9d"))[Time: #slot.time]
  #v(65pt)
  #text(size: 15pt)[#article-title(works.at(slot.key))]
  #v(10pt)
  #text(size: 15pt)[#paper-reference(works.at(slot.key))]
  #v(10pt)
  #text(size: 15pt, weight: "bold")[#slot.presenter]
  #v(1fr)
]

// Each source PDF page gets its own A4 page, without cropping.
// The first-page marker supplies the live link in the timetable.
#let append-pdf(path, pages, first-label: none) = {
  assert(pages > 0, message: "Set the actual page count for " + path)
  for n in range(1, pages + 1) {
    page(margin: (x: 7mm, top: 7mm, bottom: 14mm))[
      #if n == 1 and first-label != none {
        place(top + left)[#metadata("PDF first page")#first-label]
      }
      #image(path, page: n, width: 100%, height: 100%, fit: "contain")
    ]
  }
}

#let handout(
  week: none, title: none, course: none, program: none,
  location: none, date: none, topics: none,
  sessions: (), works: (:),
) = {
  set page(paper: "a4", margin: page-margin, numbering: "1", number-align: center)
  set text(font: handout-font, size: body-size, fill: black)
  set par(leading: global-leading, spacing: 0.5em)
  let clubs = sessions.filter(s => s.kind == "journal-club")
  assert(clubs.map(s => s.id).dedup().len() == clubs.len(), message: "Each journal club needs a unique id")
  page[
    #text(size: title-size, weight: "bold")[Week #week: #title]
    #v(6pt)
    #course\
    #program\
    #location
    #v(20pt)
    #strong[Topics:]
    #v(6pt)
    #topics
    #v(20pt)
    #strong[Timetable:]\
    #v(7pt)
    #strong(date)
    #v(12pt)
    #for slot in sessions { timetable-row(slot, works) }
  ]
  section-cover("Journal club handouts")
  for slot in clubs {
    if slot.student-handout != none {
      append-pdf(slot.student-handout, slot.handout-pages)
    }
  }
  section-cover("Full papers")
  for slot in clubs {
    slot-cover(slot, works)
    if slot.pdf != none {
      append-pdf(slot.pdf, slot.pages, first-label: paper-label(slot))
    } else {
      page[
        #place(top + left)[#metadata("Reserved first paper page")#paper-label(slot)]
        #align(center + horizon)[
          #strong[Paper PDF not yet supplied]\
          #article-title(works.at(slot.key))
        ]
      ]
    }
  }
}

#let format-date(value) = {
  let s = if type(value) == str { value } else { value.text }
  assert(s.len() == 8, message: "Use YYYYMMDD")

  let day = int(s.slice(6, 8))
  let d = datetime(
    year: int(s.slice(0, 4)),
    month: int(s.slice(4, 6)),
    day: day,
  )

  let suffix = if day >= 11 and day <= 13 {
    "th"
  } else {
    ("1": "st", "2": "nd", "3": "rd").at(
      str(calc.rem(day, 10)),
      default: "th",
    )
  }

  [#day#super(suffix) of #d.display("[month repr:long]")]
}