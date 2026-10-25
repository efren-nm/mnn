#import "style.typ": *
#let works = yaml("references.yml")

// One source of information for the timetable, paper covers and appended PDFs.
// Add more journal-club(...) entries for future students, each with a unique id.
#let sessions = (
  activity(
    time: "15.00–15.15",
    title: [Brief introduction to today's class: electrons across a solid.],
    // notes: [Reading together the first handout.],
    presenter: "Efrén Navarro",
    // handout: "/assets/handouts/how4.svg",
    // handout-pages: 1,
  ),
  journal-club(
    id: "jc1", topic: "Electronic transport across metals", time: "15.15–15.35",
    presenter: "Ángela Cuenca", key: "bid2006temperature",
    // Replace none with a local PDF path, and 0 with its actual page count.
    pdf: "/assets/papers/0607674v1.pdf",
    pages: 8,
    // The student's figure-summary PDF goes after “Journal club handouts”.
    student-handout: "/assets/handouts/Electric transport in metals - Handout5.pdf",
    handout-pages: 1,
  ),
  activity(
    time: "15.35–16.30",
    title: [Lecture, discussion and revision of concepts.],
    // presenter: "Efrén Navarro",
  ),
  activity(
    time: "16.30–16.45",
    title: [_Break_],
    // presenter: "Efrén Navarro",
  ),
  journal-club(
    id: "jc2", topic: "Electronic transport in semiconductors", time: "16.45–16.05",
    presenter: "Gladys Betanzo", key: "njema2024design",
    // Replace none with a local PDF path, and 0 with its actual  page count.
    pdf: "/assets/papers/s11082-024-07800-x.pdf",
    pages: 38,
    student-handout: "/assets/handouts/Paper Handout.pdf",
    handout-pages: 1,
  ),
  activity(
    time: "16.05–17.15",
    title: [Lecture, discussion and revision of concepts.],
    // presenter: "Efrén Navarro",
  ),
)

#handout(
  week: 4,
  title: "Electrons transport across solids",
  course: "Physics classes, M1 introductory module",
  program: "Master in Molecular Nanoscience and Nanotechnology",
  location: "ICMol Seminar room 0.10.6",
  // date: "15th of October",
  date: format-date[20261026],
  topics: [Charge transport: Drude model and Ohm's law. Transport in semiconductors: electrons and holes.],
  sessions: sessions,
  works: works,
)
