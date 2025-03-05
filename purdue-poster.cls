\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{purdue-poster}[A Purdue LaTeX Poster Template]

\LoadClassWithOptions{beamer}

\RequirePackage{calc}
\RequirePackage{environ}
\RequirePackage{svg}
\RequirePackage{tikz}
\usetikzlibrary{positioning}

\RequirePackage{purdue}

\RequirePackage{beamerposter}

% Disable navigation symbols 
\setbeamertemplate{navigation symbols}{}

\newcommand{\titlelogo}{}
\setbeamercolor{headline}{fg=white,bg=black}
\setbeamercolor{headline sep}{bg=purdue-field}

% \setbeamercolor{background canvas}{bg=purdue-steam}
\setbeamertemplate{background canvas}{
    \begin{tikzpicture}[remember picture,overlay,shift=(current page.north west)]
    \begin{scope}[x={(current page.north east)},y={(current page.south west)}]
        \clip (0,0) rectangle (1,1);
        \fill[purdue-cool-gray] (0,0) rectangle (1,1);
        \fill[purdue-railway-gray] (0.01,0.01) rectangle (0.99,0.99);
    \end{scope}
    \end{tikzpicture}
}

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
        {\usebeamerfont{author}\usebeamercolor[fg]{author}\insertauthor\par
        \usebeamerfont{date}\usebeamercolor[fg]{date}\insertinstitute\par}
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
  \begin{beamercolorbox}[colsep=.01\paperwidth]{headline sep}
  \end{beamercolorbox}
}
