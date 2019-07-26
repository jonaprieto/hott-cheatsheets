import re

from pathlib import Path

import os
import sys

tex = [i for i in list(Path(".").glob('hott-*.tex'))]

includeblocks = ["defn", "rmk", "eg", "thm", "cor", "lem"]
for i in tex[:1]:
  if i.is_file():
    lines = [line.rstrip('\n') for line in open(i, 'r')]
    with open("auto-" + str(i), 'w') as outf:

      print('file: ' + str(i))
      print("% This file is generated automatically. ", file=outf)

      line = ""
      I = 0
      while I < len(lines) and not "renewcommand{\\thechapter}" in line:
        line = lines[I]
        print(line, file=outf)
        I = I + 1

      while I < len(lines):
        line = lines[I]
        s = re.search('.*begin{([a-z]+)}.*', line, re.IGNORECASE)
        if not s or (s and not s.group(1) in includeblocks):
          if "end{document}" in line \
             or "\\section" in line \
             or "\\subsection" in line \
             or "\\subsubsection" in line \
             or line.startswith("%"):
            print(line, file=outf)
          else:
            print("% " + line, file=outf)
          I = I + 1
        else:
          block = s.group(1)
          print(line, file=outf)
          I = I + 1
          while I < len(lines) and not re.search('.*end{'+block +'}.*', line, re.IGNORECASE):
            line = lines[I]
            I = I + 1
            print(line, file=outf)

