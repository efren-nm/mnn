#import "style.typ": *
#let works = yaml("references.yml")

// One source of information for the timetable, paper covers and appended PDFs.
// Add more journal-club(...) entries for future students, each with a unique id.
#let sessions = (
  activity(
    time: "10.00–10.15",
    title: [Brief introduction to today's class: vibrations in reciprocal space],
    // notes: [Reading together the first handout.],
    presenter: "Efrén Navarro",
  ),
  journal-club(
    id: "jc1", topic: "Harmonic oscillator and vibrations in molecules", time: "10.15–10.35",
    presenter: "Lucía Navas", key: "loza-vega-paracetamol-2027",
    // Replace none with a local PDF path, and 0 with its actual page count.
    pdf: "/assets/papers/1-s2.0-S0969806X26008601-main.pdf",
    pages: 10,
    // The student's figure-summary PDF goes after “Journal club handouts”.
    // student-handout: "/assets/handouts/Lattices Handout.pdf",
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
    id: "jc2", topic: "Vibrations in periodic structures", time: "11.45–12.05",
    presenter: "Nerea Giménez", key: "balestra2016thermal",
    // Replace none with a local PDF path, and 0 with its actual page count.
    pdf: "/assets/papers/acs.chemmater.6b03457.pdf",
    pages: 8,
    student-handout: "/assets/handouts/nerea1.pdf",
    handout-pages: 1,
  ),
  activity(
    time: "12.05–13.15",
    title: [Lecture, discussion and revision of concepts.],
    // presenter: "Efrén Navarro",
  ),
)

#handout(
  week: 3,
  title: "Vibrations in solids",
  course: "Physics classes, M1 introductory module",
  program: "Master in Molecular Nanoscience and Nanotechnology",
  location: "ICMol Seminar room 0.10.6",
  // date: "15th of October",
  date: format-date[20261013],
  topics: [Small oscillations around the equilibrium. Normal vibrational modes in molecules. Phonons in crystals. Damped and forced oscillations. Resonances.],
  sessions: sessions,
  works: works,
)
