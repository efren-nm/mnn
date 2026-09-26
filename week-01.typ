#import "style.typ": *
#let works = yaml("references.yml")

// One source of information for the timetable, paper covers and appended PDFs.
// Add more journal-club(...) entries for future students, each with a unique id.
#let sessions = (
  activity(
    time: "10.00–10.10",
    title: [Know your fellow master students exercise!],
    presenter: "Whole class",
  ),
  activity(
    time: "10.10–10.30",
    title: [Goal, limitations and mechanics of the course.],
    notes: [Reading together the first handout.],
    presenter: "Efrén Navarro",
  ),
  activity(
    time: "10.30–11.00",
    title: [Introduction to the journal club and slot allocation.],
    presenter: "Efrén Navarro",
  ),
  journal-club(
    id: "demo", topic: "Student journal club demo", time: "11.00–11.30",
    presenter: "Efrén Navarro", key: "mcguire-2015-cri3",
    // Replace none with a local PDF path, and 0 with its actual page count.
    pdf: "/assets/papers/demo.pdf",
    pages: 3,
    // The student's figure-summary PDF goes after “Journal club handouts”.
    student-handout: "/assets/handouts/demo_handout.pdf",
    handout-pages: 1,
  ),
)

#handout(
  week: 1,
  title: "Introduction to the course",
  course: "Physics classes, M1 introductory module",
  program: "Master in Molecular Nanoscience and Nanotechnology",
  location: "ICMol Seminar room 0.10.6",
  // date: "15th of October",
  date: format-date[20260928],
  topics: [Getting to know each other (class self-awareness). Goal of the course and teaching philosophy. Limitations of the course. Mechanics of the course. Introduction to the student journal club.],
  sessions: sessions,
  works: works,
)
