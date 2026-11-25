#import "style.typ": *
#let works = yaml("references.yml")

// One source of information for the timetable, paper covers and appended PDFs.
// Add more journal-club(...) entries for future students, each with a unique id.
#let sessions = (
  activity(
    time: "15.00–15.15",
    title: [Brief recap of index of refraction of metals & intro to magnetic materials.],
    // notes: [Reading together the first handout.],
    presenter: "Efrén Navarro",
    // handout: "/assets/handouts/how4.svg",
    // handout-pages: 1,
  ),
  journal-club(
    id: "jc1", topic: "(super)Paramagnetism", time: "15.15–15.35",
    presenter: "Julio Recuero", key: "li2025modified",
    // Replace none with a local PDF path, and 0 with its actual page count.
    pdf: "/assets/papers/s13360-025-06201-7.pdf",
    pages: 10,
    // The student's figure-summary PDF goes after “Journal club handouts”.
    // student-handout: "/assets/handouts/Electric transport in metals - Handout5.pdf",
    // handout-pages: 1,
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
    id: "jc2", topic: "Long-range order magnetism", time: "16.45–16.05",
    presenter: "Ángela Cuenca", key: "coak2021",
    // Replace none with a local PDF path, and 0 with its actual  page count.
    pdf: "/assets/papers/Long-range order magnetism - paper (1).pdf",
    pages: 10,
    student-handout: "/assets/handouts/Long-range order magnetism - handout.pdf",
    handout-pages: 1,
  ),
  activity(
    time: "16.05–17.15",
    title: [Lecture, discussion and revision of concepts.],
    // presenter: "Efrén Navarro",
  ),
)

#handout(
  week: 8,
  title: "Magnetic properties of solids",
  course: "Physics classes, M1 introductory module",
  program: "Master in Molecular Nanoscience and Nanotechnology",
  location: "ICMol Seminar room 0.10.6",
  // date: "15th of October",
  date: format-date[20261130],
  topics: [Magnetic susceptibility and magnetic properties of solids. Magnetostatics. (super) Paramagnetism. Long-range magnetic ordering.],
  sessions: sessions,
  works: works,
)
