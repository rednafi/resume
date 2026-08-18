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
#let link-blue = rgb("#165D9C")

// Links: restrained blue with a matching underline for clear affordance.
#show link: it => underline(
  stroke: 0.5pt + link-blue,
  offset: 1.5pt,
  text(fill: link-blue, it),
)

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
#text(size: 10.5pt, weight: "medium")[Senior Software Engineer: Backend & Distributed Data Systems]

#v(-0.3em)
#text(fill: gray, size: 9pt)[
  Berlin, Germany |
  #link("https://github.com/rednafi", "github.com/rednafi") |
  #link("https://linkedin.com/in/rednafi", "linkedin.com/in/rednafi") |
  #link("mailto:redowan.nafi@gmail.com", "redowan.nafi@gmail.com") |
  +49 157 54763903
]

#v(0.15em)
Senior Software Engineer with 8+ years of experience delivering backend systems
and data infrastructure at startups and large technology companies. Specializes
in distributed systems, databases, streaming, and observability, with a track
record in system architecture, reliability, performance, and production
operations. Writes about databases and distributed systems at
#link("https://rednafi.com", "rednafi.com"), reaching 20k+ monthly readers.

// ---------- experience ----------

= Professional Experience

#role(
  org: "Wolt, a DoorDash company",
  title: "Senior Software Engineer",
  location: "Berlin, Germany",
  dates: "Oct 2023 - Present",
)[
  // Add only externally shareable, verified scale and impact figures. Useful
  // measures include fleet size, QPS, availability, cost, MTTR, toil,
  // provisioning time, adoption, and the number of teams influenced.
  - Own and operate the #box[multi-tenant] control plane for Wolt and DoorDash's
    petabyte-scale, #box[multi-region] Cassandra fleet, automating cluster
    provisioning, scaling, and repair.
  - Design and operate the Go data plane in front of the Cassandra fleet,
    centralizing authorization, query observability, and traffic control.
  - Built Wolt's centralized log ingestion and query platform, streaming
    backend logs through Vector and Kafka into ClickHouse for exploration in
    Grafana.
  - Defined Wolt's structured logging standard and led its adoption across
    the backend service fleet.
  - Diagnosed #box[head-of-line] blocking in the shared job queue and split
    latency-sensitive work onto a dedicated Go worker tier, substantially
    reducing p99 #box[job-start] latency.
  - Lead storage capacity planning and conduct data-layer design reviews for
    teams across Wolt, advising on scalability and operational tradeoffs.
  - Mentor engineers and conduct technical interviews for Go, backend, and
    #box[distributed-systems] roles.
]

#role(
  org: "Dendi",
  title: "Software Engineer",
  location: "Remote (US)",
  dates: "Sep 2020 - Jul 2023",
)[
  - Designed and delivered a Kafka-backed orchestration service that separated
    job execution from the Django monolith, enabling independent deployments
    (Python, FastAPI, Kafka).
  - Built a stateful webhook delivery service with retry and dead-letter
    handling (Go, SQS, PostgreSQL, AWS Lambda).
  - Built Go edge agents that streamed lab-instrument readings from device
    fleets into PostgreSQL for post-processing.
  - Owned and operated the Django/PostgreSQL backend powering Dendi's
    laboratory management system for 50+ customers, processing an average of
    100k+ orders per day (Python, Django, PostgreSQL).
]

#role(
  org: "ShopUp",
  title: "Data Scientist",
  location: "Dhaka, Bangladesh",
  dates: "Sep 2018 - Aug 2020",
)[
  - Built a CDC pipeline (PostgreSQL, Kafka, Snowflake) for near-real-time
    lending analytics.
  - Built and operated the Flask inference service that automated
    credit-eligibility decisions for microloans (Python, Flask).
]

// ---------- skills ----------

= Technical Skills

#skillrow("Languages", (
  "Go", "Python", "SQL", "Kotlin", "TypeScript",
))
#v(0.25em)
#skillrow("Storage", (
  "Cassandra", "PostgreSQL", "ClickHouse", "DynamoDB",
  "MongoDB", "Elasticsearch", "Snowflake",
))
#v(0.25em)
#skillrow("Infrastructure", (
  "Kafka", "Vector", "Spark", "AWS", "Kubernetes", "Terraform",
  "Grafana", "OpenTelemetry", "Datadog",
))

// ---------- open source & community ----------

= Open Source & Community

- Creator and maintainer of
  #link(
    "https://github.com/rednafi/fastapi-nano",
    "fastapi-nano",
  ) (1k+ GitHub stars, 100+ forks) and several Go and Python developer tools.
- #link(
    "https://www.youtube.com/watch?v=AtSutJ2rSr8",
    "Speaker at GDG Berlin",
  ) ("Go Interface Segregation Redux"); guest on the
  #link(
    "https://cupogo.dev/episodes/whats-coming-in-go-1-25-plus-redowan-delowar-on-what-makes-go-different-from-other-languages",
    "Cup o' Go podcast",
  ) to discuss Go design and dependency injection.

// ---------- education ----------

= Education

#role(
  org: "Ahsanullah University of Science & Technology",
  title: "BSc, Electrical & Electronic Engineering",
  location: "Dhaka, Bangladesh",
  dates: "2014 - 2018",
  org-size: 9.5pt,
)[]
