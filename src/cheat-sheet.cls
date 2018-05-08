% modified version of the class https://github.com/timjb/uni-spicker
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cheat-sheet}[2018/06/01 LaTeX class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[a4paper,10pt,fleqn]{report}

\usepackage[utf8]{inputenc}
\usepackage[english]{babel}

\usepackage[landscape]{geometry}
\geometry{top=1cm,left=0.8cm,right=0.6cm,bottom=1.8cm}

\setcounter{secnumdepth}{0}
\pagestyle{empty}
\setlength{\parindent}{0pt}
% \setlength{\parskip}{0pt plus 10ex}

\makeatletter
\renewcommand{\section}{\@startsection{section}{1}{0mm}%
                                {-1ex plus -.5ex minus 2ex}%
                                {2.5ex plus .2ex}%x
                                {\normalfont\large\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{0mm}%
                                {-1explus -.5ex minus -.2ex}%
                                {0.5ex plus .2ex}%
                                {\normalfont\normalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{0mm}%
                                {-1ex plus -.5ex minus -.2ex}%
                                {1ex plus .2ex}%
                                {\normalfont\small\bfseries}}
\makeatother

\usepackage{enumitem}
\setitemize[0]{leftmargin=10pt,itemindent=0pt,itemsep=0pt}
\setenumerate[0]{leftmargin=10pt,itemindent=0pt,itemsep=0pt}

\usepackage{color,xcolor,graphicx,overpic}

\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{linkcolor}{rgb}{0.5,0.5,0.5}

\newcommand{\miniitem}[2]{%
  \begin{minipage}{#1} {\item #2} \end{minipage}}
\newcommand{\inlineitem}[1]{\textbullet \enspace #1}

\usepackage{ragged2e}

\usepackage{multicol}
\AtBeginDocument{
  \raggedright
  \footnotesize
  \begin{multicols}{3}
  \setlength{\premulticols}{1pt}
  \setlength{\postmulticols}{1pt}
  \setlength{\multicolsep}{1pt}
  \setlength{\columnsep}{2pt}
}
\AtEndDocument{
  \end{multicols}
}
\usepackage{url}

\usepackage{gitinfo2}
\usepackage{fancyhdr}
\usepackage[us,12hr]{datetime} % `us' makes \today behave as usual in TeX/LaTeX
\fancypagestyle{plain}{
\fancyhf{}
\rhead{}
\rfoot{\color{gray}Homotopy Type Theory Cheatsheets \gitFirstTagDescribe.
Available on http://github.com/jonaprieto/hott-cheatsheets.git. Compiled at \currenttime - \gitAuthorDate}
\lfoot{}
\renewcommand{\headrulewidth}{0pt}}
\pagestyle{plain}
