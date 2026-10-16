#import "style.typ": *
#let works = yaml("references.yml")

// One source of information for the timetable, paper covers and appended PDFs.
// Add more journal-club(...) entries for future students, each with a unique id.
#let sessions = (
  activity(
    time: "15.00–15.15",
    title: [Practical example of lattice & phonons and brief introduction to today's class: electrons],
    // notes: [Reading together the first handout.],
    presenter: "Efrén Navarro",
    handout: "/assets/handouts/how4.svg",
    handout-pages: 1,
  ),
  journal-club(
    id: "jc1", topic: "Harmonic oscillator and vibrations in molecules", time: "15.15–15.35",
    presenter: "Julio Recuero", key: "brozzesi2022graphene",
    // Replace none with a local PDF path, and 0 with its actual page count.
    pdf: "/assets/papers/nanomaterials-12-02118-v2 (1).pdf",
    pages: 13,
    // The student's figure-summary PDF goes after “Journal club handouts”.
    student-handout: "/assets/handouts/Vibration Handout.pdf",
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
    id: "jc2", topic: "Bands in semiconductors", time: "16.45–16.05",
    presenter: "Nerea Giménez", key: "zhu2021interlayer",
    // Replace none with a local PDF path, and 0 with its actual  page count.
    pdf: "/assets/papers/ja1c02932.pdf",
    pages: 6,
    student-handout: "/assets/handouts/Handout physics semiconductors (1).pdf",
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
  title: "Electrons in solids",
  course: "Physics classes, M1 introductory module",
  program: "Master in Molecular Nanoscience and Nanotechnology",
  location: "ICMol Seminar room 0.10.6",
  // date: "15th of October",
  date: format-date[20261019],
  topics: [Wave functions. Operators and states. Schrödinger equation. Quantum confinement and bound states. Bands in solids. Effective mass. Density of States. Metals and insulators.],
  sessions: sessions,
  works: works,
)
