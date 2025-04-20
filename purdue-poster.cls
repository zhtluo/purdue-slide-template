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
\setbeamercolor{headline}{fg=white,bg=}

\newsavebox{\headlinebox}
\newlength{\headlineht}

\setbeamertemplate{headline}{%
    \sbox{\headlinebox}{%
    \begin{beamercolorbox}[wd=\paperwidth]{headline}%
        \vspace{4ex}
        \begin{columns}[onlytextwidth,totalwidth=\paperwidth]
            \begin{column}{.025\linewidth}
            \end{column}
            \begin{column}{.75\linewidth}
                \raggedleft
                {\usebeamerfont{title}\usebeamercolor[fg]{title}\inserttitle\par}
                \vspace{4ex}
                {\usebeamerfont{author}\usebeamercolor[fg]{author}\insertauthor\par
                \usebeamerfont{date}\usebeamercolor[fg]{date}\insertinstitute\par}
            \end{column}
            \begin{column}{.1\linewidth}
            \end{column}
            \begin{column}{.1\linewidth}
                \centering
                \titlelogo
            \end{column}
            \begin{column}{.025\linewidth}
            \end{column}
        \end{columns}
        \vspace{4ex}
    \end{beamercolorbox}%
    }%
    \setlength{\headlineht}{\ht\headlinebox}%
    \addtolength{\headlineht}{\dp\headlinebox}%
    \noindent\begin{tikzpicture}[remember picture,overlay]
    \begin{scope}[
        shift={(current page.north west)},
        x={(1\paperwidth, 0)},
        y={(0, -\headlineht)}
    ]
        \clip (0,0) rectangle (1,1);
        \fill[black] (0,0) rectangle (1,1);
        \fill[purdue-steel] 
        (0.865,0) --
        (0.800,1) --
        (1,1) --
        (1,0) --
        cycle;
    \end{scope}
    \end{tikzpicture}%
    \noindent\usebox{\headlinebox}%
}

\newenvironment<>{abstractblock}[1]{%
\setbeamercolor{block title}{fg=purdue-gold,bg=black}%
\setbeamercolor{block body}{bg=purdue-steam}%
\begin{block}#2{#1}}{\end{block}}

\newenvironment<>{plainblock}[1]{%
\setbeamercolor{block title}{fg=black,bg=white}%
\setbeamercolor{block body}{bg=white}%
\begin{block}#2{#1}}{\end{block}}