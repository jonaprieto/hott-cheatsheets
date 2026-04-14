# HoTT Cheatsheets — build recipes

sources := "src/hott-all.tex src/hott-basics.tex src/hott-categories.tex src/hott-equivalences.tex src/hott-formal.tex src/hott-logic.tex"
outdir := "docs"
assetsdir := "assets"

# Build all PDFs and thumbnails
default: pdfs thumbnails

# Build all PDFs
pdfs:
    @mkdir -p {{outdir}}
    @for f in {{sources}}; do \
        echo "Building $f ..."; \
        latexmk -cd -f -pdf -interaction=nonstopmode -synctex=1 \
            -output-directory=./../{{outdir}} \
            "$f"; \
    done

# Generate PNG thumbnails from PDFs (requires ghostscript)
thumbnails: pdfs
    @mkdir -p {{assetsdir}}
    @for pdf in {{outdir}}/hott-*.pdf; do \
        name=$(basename "$pdf" .pdf); \
        echo "Thumbnail: $name ..."; \
        gs -sDEVICE=png16m \
           -r1200 \
           -dPDFFitPage=true \
           -dDEVICEWIDTHPOINTS=250 \
           -dDEVICEHEIGHTPOINTS=150 \
           -dDownScaleFactor=4 \
           -sOutputFile={{assetsdir}}/$name.png \
           -dLastPage=1 \
           -dBATCH -dNOPAUSE \
           "$pdf"; \
    done

# Watch for changes and rebuild
watch:
    @echo "Watching src/ for changes..."
    @fswatch -o src/ | while read; do just pdfs; done

# Clean all build artifacts
clean:
    rm -f {{outdir}}/* {{assetsdir}}/*

# Clean only auxiliary LaTeX files (keep PDFs)
clean-aux:
    @find {{outdir}} -maxdepth 1 -type f ! -name '*.pdf' -delete 2>/dev/null || true

# Full rebuild
rebuild: clean default clean-aux

# List all recipes
list:
    @just --list
