#import "style.typ": *
#let works = yaml("references.yml")

// One source of information for the timetable, paper covers and appended PDFs.
// Add more journal-club(...) entries for future students, each with a unique id.
#let sessions = (
  activity(
    time: "15.00–15.15",
    title: [Brief introduction to today's class: crystal structure in a nutshell],
    // notes: [Reading together the first handout.],
    presenter: "Efrén Navarro",
  ),
  journal-club(
    id: "jc1", topic: "Crystal structure and lattices", time: "15.15–15.35",
    presenter: "Lucía Navas", key: "zha2027",
    // Replace none with a local PDF path, and 0 with its actual page count.
    pdf: "/assets/papers/s40820-026-02278-6.pdf",
    pages: 13,
    // The student's figure-summary PDF goes after “Journal club handouts”.
    // student-handout: "/assets/handouts/mireia1_Reciprocal space and diffraction. Handout.pdf",
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
    id: "jc2", topic: "Diffraction and reciprocal space", time: "16.45–17.05",
    presenter: "Mireia Arroyo", key: "zha2027",
    // Replace none with a local PDF path, and 0 with its actual page count.
    pdf: "/assets/papers/0034-48852F5%2FR05.pdf",
    pages: 69,
    student-handout: "/assets/handouts/mireia1_Reciprocal space and diffraction. Handout.pdf",
    handout-pages: 1,
  ),
  activity(
    time: "17.05–18.15",
    title: [Lecture, discussion and revision of concepts.],
    // presenter: "Efrén Navarro",
  ),
)

#handout(
  week: 1,
  title: "Crystal structure and reciprocal space",
  course: "Physics classes, M1 introductory module",
  program: "Master in Molecular Nanoscience and Nanotechnology",
  location: "ICMol Seminar room 0.10.6",
  // date: "15th of October",
  date: format-date[20261005],
  topics: [The unit cell and Bravais lattices. Crystal systems. Space groups and point groups. Diffraction techniques and reciprocal space.],
  sessions: sessions,
  works: works,
)
