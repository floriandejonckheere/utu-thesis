# Research thesis

This repository contains my research thesis for the Master of Science (Technology) in Information and Communication Technology: Software Engineering at the University of Turku.

The documents are typeset using the [Typst](https://typst.app/home) typesetting language.

# Usage

```
# Enter the directory
cd thesis

# Build document once
make

# Or, build document and watch for changes
make watch

# Remove intermediary generated files
make clean

# Print number of words per file
make words
```

# Development

## Bibliography

To import a BibTeX file, use the following command:

```
# Convert to YAML
hayagriva bibliography.bib > bibliography.yml

# Remove curly braces
sed -e 's/[\{\}]//g' -i bibliography.yml
```

# License

Logo: Copyright (C) University of Turku

Copyright (C) 2024 Florian Dejonckheere
