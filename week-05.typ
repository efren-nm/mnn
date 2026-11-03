#import "style.typ": *
#let works = yaml("references.yml")

// One source of information for the timetable, paper covers and appended PDFs.
// Add more journal-club(...) entries for future students, each with a unique id.
#let sessions = (
  activity(
    time: "10.00–10.15",
    title: [Brief introduction to today's class: why care about electromagnetism?],
    // notes: [Reading together the first handout.],
    presenter: "Efrén Navarro",
    // handout: "/assets/handouts/how4.svg",
    // handout-pages: 1,
  ),
  journal-club(
    id: "jc1", topic: "Electric and magnetic forces", time: "10.15–10.35",
    presenter: "Lucía Navas", key: "hyodo2022displacement",
    // Replace none with a local PDF path, and 0 with its actual page count.
    pdf: "/assets/papers/Hyodo_2022_Eur._J._Phys._43_065202.pdf",
    pages: 13,
    // The student's figure-summary PDF goes after “Journal club handouts”.
    // student-handout: "/assets/handouts/Electric transport in metals - Handout5.pdf",
    // handout-pages: 1,
  ),
  activity(
    time: "10.35–11.30",
    title: [Lecture, discussion and revision of concepts.],
    // presenter: "Efrén Navarro",
  ),
  activity(
    time: "11.30–11.45",
    title: [_Break_],
    // presenter: "Efrén Navarro",
  ),
  journal-club(
    id: "jc2", topic: "Maxwell at the nanoscale", time: "11.45–12.05",
    presenter: "Ángela Cuenca", key: "alaeian2014",
    // Replace none with a local PDF path, and 0 with its actual  page count.
    pdf: "/assets/papers/Maxwell equations - paper.pdf",
    pages: 7,
    student-handout: "/assets/handouts/Maxwell equations - Handout6.pdf",
    handout-pages: 1,
  ),
  activity(
    time: "12.05–13.15",
    title: [Lecture, discussion and revision of concepts.],
    // presenter: "Efrén Navarro",
  ),
)

#handout(
  week: 5,
  title: "Basic electromagnetism in vacuum and solids",
  course: "Physics classes, M1 introductory module",
  program: "Master in Molecular Nanoscience and Nanotechnology",
  location: "ICMol Seminar room 0.10.6",
  // date: "15th of October",
  date: format-date[20261106],
  topics: [Electric and magnetic forces. Maxwell equations and electromagnetic waves.],
  sessions: sessions,
  works: works,
)
