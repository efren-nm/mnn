# Weekly handouts in Typst

`week-01.typ` is the editable example. `style.typ` controls its A4 portrait layout and Libertinus Serif typography. `references.yml` contains the unique papers from `Papers.docx` in Hayagriva format. Duplicates in the Word list have one key. Entries whose source said “et al.” list only the supplied first author and are marked for completion in the YAML; check the full author list and original publication metadata before distributing a selected paper.

Duplicate `week-01.typ` for each week. Update the named `handout(...)` fields, add `schedule-row(...)` entries, and add one `paper(presenter: ..., title: [...], key: "...")` per student under **Papers for discussion**. Use a matching key from `references.yml`. The paper gets a citation, and the References section includes only selected papers. `discussion: [Question for the group]` is optional.

Compile with `typst compile week-01.typ`. Keep `style.typ` and `references.yml` beside each weekly file. Install Libertinus Serif on the compiling computer.

For **full article pages** in the output PDF, place authorized PDF copies in `papers/`, uncomment `appendices:` in the weekly file, and set each PDF's actual page count. Add an `append-paper-pdf(...)` call per PDF. The provided `Papers.docx` is a reading list; it does not contain the article PDFs.
