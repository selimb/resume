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
\newfontfamily\bodyfont{Roboto-Regular}[Path=fonts/]
\newfontfamily\bodyfontit{Roboto-LightItalic}[Path=fonts/]
\newfontfamily\thinfont{Roboto-Thin}[Path=fonts/]
\newfontfamily\headingfont{RobotoCondensed-Bold}[Path=fonts/]

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor, Path = fonts/]{Roboto-Light}
% \setmainfont[Mapping=tex-text, Color=textcolor]{Roboto-Light}

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

% \renewcommand{\section}[1]{
%   {\par\vspace{\parskip}
%       {%
%         \LARGE\headingfont\color{headercolor}%
%         \@sectioncolor #1%
%       }
%       \par\vspace{\parskip}}
% }

% \renewcommand{\subsection}[2]{
%   \par\vspace{.5\parskip}%
%   \Large\headingfont\color{headercolor} #2%
%   \par\vspace{.25\parskip}%
% }

% TODO
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
        {\fontsize{36}{44}\headingfont\selectfont\color{black}{\textbf{\@fullname}}} \\
        {\textit{\@position}}
      \end{tabular}
    } & {
        \begin{tabular}[c]{l@{\hspace{1.5em}}l}
          {\small#1} & {\small#2} \\
          {\small#3} & {\small#4}
        \end{tabular}
      }
  \end{tabularx}
}

%----------------------------------------------------------------------------------------
% List environment
%----------------------------------------------------------------------------------------

% TODO: What does this do?
\setlength{\tabcolsep}{0pt}
% \newenvironment{entrylist}{%
%   \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
%     }{%
%   \end{tabular*}
% }
% \renewcommand{\bfseries}{\headingfont\color{headercolor}}
% \newcommand{\entry}[4]{%
%   #1&\parbox[t]{12.8cm}{%
%     \textbf{#2}%
%     \hfill%
%     {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
%     #4\vspace{\parsep}%
%   }\\}

%----------------------------------------------------------------------------------------
% Other tweaks
%----------------------------------------------------------------------------------------

\RequirePackage[left=1.5cm,top=1.5cm,right=1.5cm,bottom=1.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\hypersetup{
  pdftitle=Resume \textbar{} Selim Belhaouane,
  pdfauthor=Selim Belhaouane,
  pdfsubject=Resume%
}