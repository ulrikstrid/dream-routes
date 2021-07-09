(lang dune 2.9)

(name dream-routes)

(version 1.0.0)

(generate_opam_files true)

(source
 (github ulrikstrid/dream-routes))

(license BSD3)

(authors "Ulrik Strid")

(maintainers "ulrik.strid@outlook.com")

(package
 (name dream-routes)
 (synopsis "Define your Dream router with Routes")
 (description
  "A middleware to define a Dream router with the Routes library")
 (depends dream routes))
