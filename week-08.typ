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
    id: "jc1", topic: "Oscillators and Claussius-Mossotti relation", time: "15.15–15.35",
    presenter: "Mireia Arroyo", key: "li2025modified",
    // Replace none with a local PDF path, and 0 with its actual page count.
    pdf: "/assets/papers/s13360-025-06201-7.pdf",
    pages: 10,
    // The student's figure-summary PDF goes after “Journal club handouts”.
    // student-handout: "/assets/handouts/Electric transport in metals - Handout5.pdf",
    // handout-pages: 1,
  ),
  journal-club(
    id: "jc2", topic: "Index of refraction and dielectric constant", time: "15.35–15.55",
    presenter: "Gladys Betanzo", key: "mamo2026plasmonic",
    // Replace none with a local PDF path, and 0 with its actual page count.
    pdf: "/assets/papers/1-s2.0-S1386947725002012-main.pdf",
    pages: 11,
    // The student's figure-summary PDF goes after “Journal club handouts”.
    student-handout: "/assets/handouts/Size and dielectric-dependent plasmonic resonances in CdS@Ag core–shell quantum dots_ Field enhancement, dispersion, and slow-light effects.pdf",
    handout-pages: 1,
  ),
  activity(
    time: "15.55–16.30",
    title: [Lecture, discussion and revision of concepts.],
    // presenter: "Efrén Navarro",
  ),
  activity(
    time: "16.30–16.45",
    title: [_Break_],
    // presenter: "Efrén Navarro",
  ),
  journal-club(
    id: "jc3", topic: "Reflection and interfaces", time: "16.45–16.05",
    presenter: "Nerea Giménez", key: "wu2021chameleon",
    // Replace none with a local PDF path, and 0 with its actual  page count.
    pdf: "/assets/papers/nn1c05612.pdf",
    pages: 8,
    student-handout: "/assets/handouts/Handout physics Optical properties (1).pdf",
    handout-pages: 1,
  ),
  activity(
    time: "16.05–17.15",
    title: [Lecture, discussion and revision of concepts.],
    // presenter: "Efrén Navarro",
  ),
)

#handout(
  week: 7,
  title: "Optical properties of solids",
  course: "Physics classes, M1 introductory module",
  program: "Master in Molecular Nanoscience and Nanotechnology",
  location: "ICMol Seminar room 0.10.6",
  // date: "15th of October",
  date: format-date[20261122],
  topics: [Dielectric constant and electric polarization in materials: Conductors and dielectrics.
Optical properties of solids. Reflection, absorption, and transmission.],
  sessions: sessions,
  works: works,
)
