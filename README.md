# HoTT Cheatsheets

[![Build](https://github.com/jonaprieto/hott-cheatsheets/actions/workflows/ci.yml/badge.svg)](https://github.com/jonaprieto/hott-cheatsheets/actions/workflows/ci.yml)

A pocket-sized companion for reading the
[HoTT Book](https://homotopytypetheory.org/book/).
Each cheatsheet condenses a chapter into a dense, printable reference sheet.

## Cheatsheets

| Chapter | PDF |
|---------|-----|
| All-in-one | [hott-all.pdf](https://github.com/jonaprieto/hott-cheatsheets/releases/latest/download/hott-all.pdf) |
| Basics (Ch. 2) | [hott-basics.pdf](https://github.com/jonaprieto/hott-cheatsheets/releases/latest/download/hott-basics.pdf) |
| Sets and Logic (Ch. 3) | [hott-logic.pdf](https://github.com/jonaprieto/hott-cheatsheets/releases/latest/download/hott-logic.pdf) |
| Equivalences (Ch. 4) | [hott-equivalences.pdf](https://github.com/jonaprieto/hott-cheatsheets/releases/latest/download/hott-equivalences.pdf) |
| Categories (Ch. 9) | [hott-categories.pdf](https://github.com/jonaprieto/hott-cheatsheets/releases/latest/download/hott-categories.pdf) |
| Formal Type Theory (Appendix) | [hott-formal.pdf](https://github.com/jonaprieto/hott-cheatsheets/releases/latest/download/hott-formal.pdf) |

## Building locally

**Requirements:** TeX Live (2020+), `latexmk`, `ghostscript` (for thumbnails).

With [just](https://github.com/casey/just):

```sh
just          # build PDFs and thumbnails
just pdfs     # build PDFs only
just clean    # remove all build artifacts
just watch    # rebuild on file changes (requires fswatch)
```

Or directly:

```sh
latexmk -cd -f -pdf -interaction=nonstopmode -output-directory=./../docs src/hott-all.tex
```

## Contributing

All changes go through pull requests. The `main` branch is protected — CI must
pass before merging. Each PR automatically builds the PDFs and uploads them as
downloadable artifacts (kept for 14 days).

## About `hott.sty`

The custom style file `src/hott.sty` is based on `macros.tex` from the
[HoTT/book](https://github.com/HoTT/book) LaTeX sources. The upstream file has
been essentially frozen since 2015, and our copy is a faithful mirror with
adaptations for the cheatsheet format (narrow-column layout macros, compact
spacing).

## License

[Creative Commons Attribution-ShareAlike 3.0 Unported](http://creativecommons.org/licenses/by-sa/3.0/)
— same as the HoTT Book.

## References

> The Univalent Foundations Program.
> *Homotopy Type Theory: Univalent Foundations of Mathematics.*
> Institute for Advanced Study, 2013.
> [homotopytypetheory.org/book](https://homotopytypetheory.org/book/)
> — LaTeX sources: [HoTT/book](https://github.com/HoTT/book)
