% Adapted from https://www.overleaf.com/latex/templates/friggeri-cv-template/hmnchbfmjgqh
% and https://github.com/mdauthentic/se-resume
\ProvidesClass{mycv}[]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

%----------------------------------------------------------------------------------------
% Colors
%----------------------------------------------------------------------------------------

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{blue}{HTML}{66D9EE}
\definecolor{red}{HTML}{FA2772}
\definecolor{orange}{HTML}{FE9720}
\definecolor{green}{HTML}{A7E22E}
\definecolor{purple}{HTML}{9358FE}
\definecolor{aquamarine}{HTML}{36AF90}

\definecolor{date}{HTML}{A4A4A4}

\ifdefined\@cv@print
  \colorlet{blue}{gray}
  \colorlet{red}{gray}
  \colorlet{orange}{gray}
  \colorlet{green}{gray}
  \colorlet{purple}{gray}
  \colorlet{aquamarine}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%----------------------------------------------------------------------------------------
% Fonts
%----------------------------------------------------------------------------------------

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

% \newfontfamily\bodyfont{Roboto-Regular}[Path=fonts/]
\newfontfamily\thinfont{Roboto-Thin}[Path=fonts/Roboto/]
\newfontfamily\bffont{RobotoCondensed-Bold}[Path=fonts/RobotoCondensed/]
\newfontfamily\bfitfont{RobotoCondensed-BoldItalic}[Path=fonts/RobotoCondensed/]
\newfontfamily\itfont{Roboto-LightItalic}[Path=fonts/Roboto/]

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Path = fonts/Roboto/]{Roboto-Light}
% Default color. Doing it this way makes \color overrides work, whereas setting Color= in \setmainfont requires using \addfontfeatures
\color{textcolor}

%----------------------------------------------------------------------------------------
% Structure
%----------------------------------------------------------------------------------------
% TODO What does this do?
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
      \color{%
        \ifcase\value{colorCounter}%
          blue\or%
          red\or%
          orange\or%
          green\or%
          purple\or%
          aquamarine\else%
          headercolor\fi%
      } #1#2#3%
    }%
  \stepcounter{colorCounter}%
}

\pagestyle{empty}

%----------------------------------------------------------------------------------------
% Header
%----------------------------------------------------------------------------------------
\newcommand*{\name}[1]{\def\@fullname{#1}}
\newcommand*{\subtitle}[1]{\def\@position{#1}}

\def\linkedinicon{\faLinkedin}
\newcommand*{\setlinkedin}[1]{\def\@linkedintext{#1}}
\def\linkedinlink{https://linkedin.com/in/\@linkedintext}

\def\phoneicon{\faPhone}
\newcommand*{\setphone}[1]{\def\@phone{#1}}
\def\phonetext{\@phone}

\def\addressicon{\faMap}
\newcommand*{\setaddress}[1]{\def\@address{#1}}
\def\addresstext{\@address}

\def\emailicon{\faEnvelope}
\newcommand*{\setemail}[1]{\def\@email{#1}}
\def\emaillink{mailto:\@email}
\def\emailtext{\@email}

\def\githubicon{\faGithub}
\newcommand*{\setgithub}[1]{\def\@github{#1}}
\def\githublink{https://github.com/\@github}
\def\githubtext{/\@github}

% Defines to make listing easier
\def\address{\addressicon\hspace{3pt}{\addresstext}}
\def\linkedin{\linkedinicon\hspace{3pt}\href{\linkedinlink}{\@linkedintext}}
\def\phone{\phoneicon\hspace{3pt}{\phonetext}}
\def\email{\emailicon\hspace{3pt}\href{\emaillink}{\emailtext}}
\def\github{\githubicon\hspace{3pt}\href{\githublink}{\githubtext}}
\def\website{\websiteicon\hspace{3pt}\href{\websitelink}{\websitetext}}

\RequirePackage{tabularx}
\newcommand{\header}[4]{
  \begin{tabularx}{\textwidth}{Xr}
    {
      \begin{tabular}[c]{l}
        % \fontsize{25}{35}\selectfont{\color{black}{{\textbf{\@fullname}}}} \\
        % {\fontsize{25}{35}\headingfont\selectfont\color{black}{\textbf{\@fullname}}} \\
        {\fontsize{35}{42}\bffont\selectfont\color{black}{\textbf{\@fullname}}}
        % \\
        % {\Large\textit{\@position}}
      \end{tabular}
    } & {
        \begin{tabular}[c]{l@{\hspace{1.5em}}l}
          {\small#1} & {\small#2} \\
          {\small#3} & {\small#4}
        \end{tabular}
      }
  \end{tabularx}
  \vspace{\parskip}
}

%----------------------------------------------------------------------------------------
% Spacing
%----------------------------------------------------------------------------------------

\RequirePackage[margin=1cm,nohead,nofoot]{geometry}
% TODO: What does this do?
\setlength{\tabcolsep}{0pt}
\setlength{\parskip}{1mm}
\RequirePackage{enumitem}
\setlist[itemize]{noitemsep}

%----------------------------------------------------------------------------------------
% Other tweaks
%----------------------------------------------------------------------------------------

\RequirePackage{hyperref}
\hypersetup{
  pdftitle=Resume \textbar{} Selim Belhaouane,
  pdfauthor=Selim Belhaouane,
  pdfsubject=Resume,
  allbordercolors=0.1 0.05 0.67,
  % allbordercolors=cyan,
  pdfborderstyle={/S/U/W 1}
  % pdfborder=0 0 0.5,
}

%----------------------------------------------------------------------------------------
% Body
%----------------------------------------------------------------------------------------

% Usage: \section{<name>}
\renewcommand{\section}[1]{
  \par\vspace{3\parskip}
  {%
    \LARGE\bffont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\newenvironment{objective}{ \begin{adjustwidth}{7.5mm}{7.5mm} \itfont }{ \end{adjustwidth} }

\newenvironment{sectionindent}{ \begin{adjustwidth}{2.0mm}{} }{ \end{adjustwidth} }

% Usage: \entryhead{<company>}{<city, country>}
\newcommand{\entryhead}[2]{
  % {\headingfont \color{headercolor} \bfseries #1} \hfill {\color{lightgray}#2} \par
  {\bffont \color{headercolor} #1} \hfill {\bffont #2} \par
}

% Usage: \position{<position>}{<start_date - end_date>}
\newcommand{\position}[2]{
  \vspace{-1\parskip}
  % {\bfitfont #1} \hfill {\itfont #2} \par
  {\bfitfont #1} \hfill {\itfont #2} \par
  \vspace{-1\parskip}
}

\RequirePackage{tikz}
% Create a tag
\newcommand{\techtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=darkgray!70,rounded corners=0.5ex,inner xsep=1ex,inner ysep =0.55ex,text height=1.3ex,text depth=.25ex]{#1};
}
% Usage: \tagline{<tag1>, <tag2>, ...}
\newcommand{\tagline}[1]{\hspace{0.4cm}{\foreach \n in {#1}{{\footnotesize\techtag{\n}}}} \par \vspace{2\parskip}}

% \newcommand{\entryhead}[4]{
%   \vspace{-5pt}\item[]
%     \begin{tabularx}{0.97\textwidth}{X@{\hspace{60pt}}r}
%       \textbf{\color{primary}#1} & {\firabook\color{accent}\small#2} \\
%       \textit{\color{accent}\small#3} & \textit{\color{accent}\small#4} \\
%     \end{tabularx}\vspace{-3pt}
% }
