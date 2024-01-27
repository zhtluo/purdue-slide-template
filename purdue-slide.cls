\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{purdue-slide}[A Purdue LaTeX Slide Template]

% For 4:3 slides: \LoadClass{beamer}
\LoadClass[aspectratio=169]{beamer}

\RequirePackage{calc}
\RequirePackage{environ}
\RequirePackage{svg}
\RequirePackage{tikz}
\usetikzlibrary{positioning}

\RequirePackage{purdue}

% Disable navigation symbols 
\setbeamertemplate{navigation symbols}{}

% Draw background
\setbeamertemplate{background canvas}{
    \begin{tikzpicture}[remember picture,overlay,shift=(current page.north west)]
    \begin{scope}[x={(current page.north east)},y={(current page.south west)}]
        \draw[purdue-gold,line width=.5pt] (0.1,0) -- (0.1,0.95);
        \draw[purdue-gold,line width=.5pt] (0.9,1) -- (0.9,0.25);
        \draw[purdue-gold,line width=.5pt] (0.72,1) -- (0.72,0.84);
        \fill[black] (0.15,0) rectangle (0.95,0.13);
    \end{scope}
    \end{tikzpicture}
}

% Customize Margin
\setbeamersize{text margin left=.18\paperwidth,text margin right=.12\paperwidth} 

% Customize title
\setbeamercolor{frametitle}{fg=purdue-gold}
\newlength{\titlevspace}
\setlength{\titlevspace}{\dimexpr.13\paperheight - 20pt\relax}
\setbeamertemplate{frametitle}{\vspace*{\titlevspace}
    \fontsize{18}{20}\fontseries{bc}\fontshape{it}\selectfont\insertframetitle}

% Customize footnote
\newcommand{\slidelogo}{}
\newcommand{\slidefoot}{}
\setbeamertemplate{footline}
{
    \hspace*{.12\paperwidth}
    \makebox[.3\paperwidth][c]{\slidelogo}
    \makebox[.3\paperwidth][c]{\slidefoot}
    \makebox[.12\paperwidth][c]{\insertdate}
    \hspace{.01\paperwidth}
    \makebox[.02\paperwidth][c]{\insertframenumber}
    \vspace*{.06\paperheight}
}

% Customize title page style
\defbeamertemplate*{title page}{customized}[1][]
{
    \usebeamerfont{title}\usebeamercolor[fg]{title}
    \inserttitle\par
    \bigskip
    \usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}
    \hfill\insertsubtitle\par
    \bigskip
    \usebeamerfont{author}\usebeamercolor[fg]{author}
    \insertauthor\par
    \insertinstitute\par
    \insertdate\par
}

\newcommand{\titlelogo}{}
\NewEnviron{titleframe}[1]{
    {
        \setbeamertemplate{background canvas}{
            \begin{tikzpicture}[remember picture,overlay,shift=(current page.north west)]
            \begin{scope}[x={(current page.north east)},y={(current page.south west)}]
                \fill[black] (0,0) rectangle (1,1);
                \draw[purdue-gold,line width=.5pt] (0.1,0) -- (0.1,0.95);
                \draw[purdue-gold,line width=.5pt] (0.9,1) -- (0.9,0.25);
                \draw[purdue-gold,line width=.5pt] (0.72,1) -- (0.72,0.84);
            \end{scope}
            \end{tikzpicture}
        }
        \setbeamercolor{footline}{fg=white}
        \setbeamertemplate{footline}{
            \hspace*{.12\paperwidth}
            \makebox[.3\paperwidth][c]{\titlelogo}
            \makebox[.3\paperwidth][c]{\slidefoot}
            \makebox[.12\paperwidth][c]{\insertdate}
            \hspace{.01\paperwidth}
            \makebox[.02\paperwidth][c]{\insertframenumber}
            \vspace*{.06\paperheight}
        }
        \setbeamertemplate{frametitle}{\vspace*{.25\paperheight}
            \fontsize{30}{36}\fontseries{bc}\fontshape{it}\selectfont\insertframetitle}
        \setbeamercolor{normal text}{fg=white}
        \setbeamercolor{item}{fg=white}
        \begin{frame}{#1}
            \usebeamercolor[fg]{normal text}
            \BODY
        \end{frame}
    }
}

% Customize other page styles:
\NewEnviron{notitleframe}{
    {
        \setbeamertemplate{background canvas}{
            \begin{tikzpicture}[remember picture,overlay,shift=(current page.north west)]
            \begin{scope}[x={(current page.north east)},y={(current page.south west)}]
                \draw[purdue-gold,line width=.5pt] (0.1,0) -- (0.1,0.95);
                \draw[purdue-gold,line width=.5pt] (0.9,1) -- (0.9,0.25);
                \draw[purdue-gold,line width=.5pt] (0.72,1) -- (0.72,0.84);
            \end{scope}
            \end{tikzpicture}
        }
        \begin{frame}
            \usebeamercolor[fg]{normal text}
            \BODY
        \end{frame}
    }
}
