\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{purdue-poster}[A Purdue LaTeX Poster Template]

\LoadClass{beamer}

\RequirePackage{calc}
\RequirePackage{environ}
\RequirePackage{svg}
\RequirePackage{tikz}
\usetikzlibrary{positioning}

\RequirePackage{purdue}

% Disable navigation symbols 
\setbeamertemplate{navigation symbols}{}

\newcommand{\titlelogo}{}
\setbeamercolor{headline}{fg=white,bg=black}
\setbeamertemplate{headline}{  
  \leavevmode
  \begin{beamercolorbox}[wd=\paperwidth]{headline}
    \begin{columns}[T]
      \begin{column}{.025\paperwidth}
      \end{column}
      \begin{column}{.8\paperwidth}
        \vskip4ex
        \raggedleft
        {\usebeamerfont{title}\usebeamercolor[fg]{title}\inserttitle\par}
        \vskip4ex
        {\usebeamerfont{author}\usebeamercolor[fg]{author}\insertauthor\par\insertinstitute\par}
      \end{column}
      \begin{column}{.05\paperwidth}
      \end{column}
      \begin{column}{.1\paperwidth}
        \vskip4ex
        \begin{center}
            \titlelogo
        \end{center}
        \vskip1.5cm
      \end{column}
      \begin{column}{.025\paperwidth}
      \end{column}
    \end{columns}
  \end{beamercolorbox}
}