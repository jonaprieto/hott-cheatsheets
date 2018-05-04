\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cheat-sheet}[2018/06/01 LaTeX class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,10pt]{article}

\usepackage[utf8]{inputenc}
\usepackage[english]{babel}

\usepackage[landscape]{geometry}
\geometry{top=1.5cm,left=1cm,right=1cm,bottom=1cm}

\setcounter{secnumdepth}{0}
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt plus 10ex}

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
\definecolor{Emph}{rgb}{0.2,0.2,0.8}

\renewcommand{\emph}[1]{\textcolor{Emph}{\bf{#1}}}
\newcommand{\Emph}[1]{\textcolor{Emph}{#1}}
\newcommand{\TODO}[1]{\textcolor{orange}{TODO: #1}}

\definecolor{gray}{rgb}{0.5,0.5,0.5}

\makeatletter
\def\url@foostyle{%
  \@ifundefined{selectfont}{\def\UrlFont{\sf}}{\def\UrlFont{\small\ttfamily}}}
\makeatother

%
% % Name einer Eigenschaft rechts ausgerichtet in Klammern
\newcommand{\pright}[1]{\hfill ({#1}) \,}

% % Listeneintrag mit variabler Breite
% % siehe http://tex.stackexchange.com/questions/30526/two-column-list-different-column-widths
\newcommand{\miniitem}[2]{%
  \begin{minipage}{#1} {\item #2} \end{minipage}}
%
% % List-Item im Fließtext
\newcommand{\inlineitem}[1]{\textbullet \enspace #1}

\usepackage{ragged2e}

\usepackage{multicol}
\AtBeginDocument{
  % Entscheide:
  %\RaggedRight % Flattersatz mit Silbentrennung
  \raggedright % Flattersatz ohne Silbentrennung
  \footnotesize
  \begin{multicols}{3}
  % multicol parameters
  % These lengths are set only within the two main columns
  %\setlength{\columnseprule}{0.25pt}
  \setlength{\premulticols}{1pt}
  \setlength{\postmulticols}{1pt}
  \setlength{\multicolsep}{1pt}
  \setlength{\columnsep}{2pt}
}
\AtEndDocument{
  \end{multicols}
}

\usepackage{gitinfo2}
\usepackage{fancyhdr}
\usepackage[us,12hr]{datetime} % `us' makes \today behave as usual in TeX/LaTeX
\fancypagestyle{plain}{
\fancyhf{}
\rhead{Compiled at \currenttime. Revision\gitRel:\gitAbbrevHash{} (\gitBranch) - \gitAuthorDate}
\rfoot{}
\lfoot{}
\renewcommand{\headrulewidth}{0pt}}
\pagestyle{plain}
