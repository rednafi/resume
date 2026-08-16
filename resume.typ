// Resume - Redowan Delowar
//
// Build:  typst compile resume.typ resume-redowan-delowar.pdf
//
// Extending this file:
//   - New job:        copy a #role(...)[...] block and edit the fields.
//   - New bullet:     add a "- ..." line inside the block. Keep it under two lines.
//   - New skill tag:  add a string to the skills list.
//   - New section:    write "= Section Name" and content below it.
// No other formatting knobs need touching.
//
// Tense convention: present for ongoing work in the current role,
// past for completed initiatives and all previous roles.

// ---------- document setup ----------

#set document(title: "Redowan Delowar - Resume", author: "Redowan Delowar")
#set page(paper: "a4", margin: (x: 1.55cm, top: 1.5cm, bottom: 1.5cm))
#set text(font: "Helvetica Neue", size: 9.3pt)
#set par(justify: false, leading: 0.55em)
#set list(indent: 0.4em, spacing: 0.55em)

#let gray = luma(110)

// Links: thin gray underline so they read as clickable, no color.
#show link: it => underline(stroke: 0.4pt + luma(150), offset: 1.5pt, it)

// Section headings: small, letter-spaced, gray caps. No rules.
#show heading.where(level: 1): it => {
  v(0.85em)
  block(text(size: 8pt, weight: "medium", tracking: 0.14em, fill: gray, upper(it.body)))
  v(0.1em)
}

// One job entry: company in bold caps, then a gray "title | location | dates" line.
// org-size shrinks the org name (used for education so it doesn't outweigh employers).
#let role(org: "", title: "", location: "", dates: "", org-size: 10.5pt, body) = {
  v(0.5em)
  block(text(size: org-size, weight: "bold", tracking: 0.03em, upper(org)))
  v(-0.35em)
  text(fill: gray, size: 9pt)[#title | #location | #dates]
  v(-0.1em)
  body
}

// Skill tags: light gray boxes that wrap like text.
#let pill(t) = box(
  fill: luma(243),
  inset: (x: 6.5pt, y: 3.5pt),
  radius: 3pt,
  text(size: 8.5pt, t),
)
#let pills(items) = par(leading: 1em, items.map(pill).join(h(5pt)))

// One labeled skill row: gray label on the left, pills wrapping on the right.
#let skillrow(label, items) = grid(
  columns: (6.2em, 1fr),
  column-gutter: 0.5em,
  align(left + top, pad(top: 3.5pt, text(size: 8.5pt, fill: gray, label))),
  pills(items),
)

// ---------- header ----------

#text(size: 16pt, weight: "bold", tracking: 0.04em)[REDOWAN DELOWAR]

#v(-0.3em)
#text(size: 10.5pt, weight: "medium")[Storage & Distributed Systems]

#v(-0.3em)
#text(fill: gray, size: 9pt)[
  Berlin, Germany |
  #link("https://github.com/rednafi", "github.com/rednafi") |
  #link("https://linkedin.com/in/rednafi", "linkedin.com/in/rednafi") |
  #link("mailto:redowan.nafi@gmail.com", "redowan.nafi@gmail.com") |
  +49 157 54763903
]

#v(0.15em)
Backend engineer with 8+ years of experience, focused on storage,
resilience, and observability. Operates #box[multi-region],
#box[active-active] databases at petabyte scale. Writes about Go,
databases, and distributed systems at
#link("https://rednafi.com", "rednafi.com") #box[(20k+ monthly readers)].

// ---------- experience ----------

= Work Experience

#role(
  org: "Wolt (DoorDash)",
  title: "Senior Software Engineer",
  location: "Berlin, Germany",
  dates: "Oct 2023 - Present",
)[
  // NOTE: every figure in this block (100+, 2,000+, 400+, 30+ TB,
  // minutes-to-seconds) is a realistic ESTIMATE added on request. Verify
  // each against real fleet data before sending.
  // TODO: verify "Own" matches your charter; if the control plane runs as
  // a Kubernetes operator, say so.
  - Own the #box[multi-tenant] control plane that provisions, scales, and
    repairs 100+ #box[multi-region], #box[active-active] Cassandra clusters
    (2,000+ nodes) for Wolt and DoorDash.
  - Build and operate the Go data plane that fronts the Cassandra clusters,
    centralizing authorization, query observability, and traffic control.
  // TODO: verify the 400+ service count and that "drove its adoption"
  // matches how the rollout happened.
  - Set the structured logging standard and drove its adoption across Wolt's
    400+ backend services.
  // TODO: verify 30+ TB/day. A retention or storage-cost angle would also
  // hit the cost-efficiency requirement that recurs in the target JDs.
  - Built the #box[high-performance] log ingestion and query platform that
    streams 30+ TB of logs a day from every backend service through Vector
    and Kafka into ClickHouse and serves queries through Grafana.
  // TODO: verify "minutes to seconds" against the real p99 numbers.
  - Diagnosed #box[head-of-line] blocking in the shared job queue and split
    latency-sensitive work onto a dedicated Go worker tier, cutting p99
    #box[job-start] delay from minutes to seconds.
  - Plan capacity for the storage fleet, review data-layer designs for
    teams across Wolt, and carry on-call for the platform.
  // TODO: if Wolt/DoorDash doesn't literally call this role "bar raiser",
  // change to "serve on the interview loop" - Amazon screeners read
  // "bar raiser" as their proprietary certification.
  - Mentor engineers and serve as bar raiser in Wolt's interview loops for
    Go, backend, and #box[distributed-systems] roles.
]

#role(
  org: "Dendi",
  title: "Software Engineer",
  location: "Remote (US)",
  dates: "Sep 2020 - Jul 2023",
)[
  - Designed a Kafka-backed orchestrator (FastAPI) that decoupled job
    execution from the Django monolith, unblocking independent deploys.
  // TODO: verify the retry/dead-letter wording matches what you built.
  - Shipped webhook delivery on a stateless Go service with retry and
    dead-letter handling (SQS, Cassandra, Lambda).
  - Built Go edge agents that stream lab-instrument readings from device
    fleets into Postgres for post-processing.
]

#role(
  org: "ShopUp",
  title: "Data Scientist",
  location: "Dhaka, Bangladesh",
  dates: "Sep 2018 - Aug 2020",
)[
  - Engineered a CDC pipeline (Postgres to Kafka to Snowflake) that enabled
    near-real-time lending analytics.
  - Owned the credit-eligibility inference backend that automated
    creditworthiness checks for microloans (Flask).
]

// ---------- skills ----------

= Skills

#skillrow("Languages", (
  "Go", "Rust", "Python", "TypeScript", "SQL",
))
#v(0.25em)
#skillrow("Datastores", (
  "PostgreSQL", "Cassandra", "DynamoDB", "MongoDB",
  "ClickHouse", "Snowflake", "Elasticsearch",
))
#v(0.25em)
#skillrow("Infrastructure", (
  "Kafka", "Vector", "Spark", "AWS", "Kubernetes", "Terraform",
  "Grafana", "OpenTelemetry", "Datadog",
))

// ---------- open source & community ----------

= Open Source & Community

- Open-source contributor since 2017, with
  #link(
    "https://github.com/rednafi?tab=repositories&q=&type=source&sort=stargazers",
    "projects",
  ) used by thousands of developers.
- Participant in Go proposal discussions on the golang/go issue tracker
  and in
  #link(
    "https://www.reddit.com/r/golang/search/?q=author%3Asigmoia&restrict_sr=1",
    "r/golang",
  ) (as u/sigmoia).
- Author of #link("https://rednafi.com", "rednafi.com"): 230+ posts since
  2020 on databases, Go concurrency, and distributed systems.
- Speaker at GDG Berlin and guest on the Cup o' Go podcast.

// ---------- education ----------

= Education

#role(
  org: "Ahsanullah University of Science & Technology",
  title: "BSc, Electrical & Electronic Engineering",
  location: "Dhaka, Bangladesh",
  dates: "2014 - 2018",
  org-size: 9.5pt,
)[]
