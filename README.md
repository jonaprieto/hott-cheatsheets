# HoTT Cheatsheet [![Build Status](https://travis-ci.org/jonaprieto/hott-cheatsheet.svg?branch=master)](https://travis-ci.org/jonaprieto/hott-cheatsheet)

This is my attempt to have a "little" and practical compendium of some
definitions, lemmas, and theorems from the HoTT-Book.

#### Available Cheatsheets

- **Basics** (Chapter 2):
  - **Direct link: [basics.pdf](https://github.com/jonaprieto/hott-cheatsheet/releases/download/v0.1.0/basics.pdf)**

  ![](assets/basics-preview.png)

-----------------------------------------------------------------------------

#### Building

- A fairly new version of LaTeX.
[Texlive](http://www.tug.org/texlive/) 2012 is confirmed to work. You might need
to install some packages; see `hott.sty` and `cheat-sheet.cls` for packages that are used by the book.

[BasicTeX](http://www.tug.org/mactex/morepackages.html), which is a minimalistic
version of MacTeX, is confirmed to work once the following packages have been
installed: `tlmgr`, `install`, `braket`, `comment`, `courier`, `enumitem`,
`helvetic`, `mathpazo`, `nextpage`, `ntheorem`, `palatino`, `rsfs`, `stmaryrd`,
`symbol`, `titlesec`, `wallpaper`, `wasy`, `wasysym`, `xstring`, `zapfding`.

- If you have `make` utility and `latexmk` just
run `make` in the root directory of this repository.


#### License

This work is licensed under the same license of the book:

- [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/).

#### References

All sources of the HoTT book of
[homotopytypetheory.org](https://homotopytypetheory.org/book/).

```
    @Book{hottbook,
      author =    {The {Univalent Foundations Program}},
      title =     {Homotopy Type Theory: Univalent Foundations of Mathematics},
      publisher = {\url{https://homotopytypetheory.org/book}},
      address =   {Institute for Advanced Study},
      year =      2013}
```
