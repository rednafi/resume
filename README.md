# Resume

Typst source for my resume. The compiled PDF is checked in.

## Build

```sh
typst compile resume.typ resume-redowan-delowar.pdf
```

Uses Helvetica Neue, which ships with macOS. On other platforms, install the
font or swap it in the `#set text` line.

All content and layout live in `resume.typ`. Comments at the top of the file
explain how to add a job, a bullet, or a skill tag without touching formatting.
