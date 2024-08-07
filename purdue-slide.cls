\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{purdue-slide}[A Purdue LaTeX Slide Template]

\newif\ifsimpleslides
\DeclareOption{simpleslides}{
    \simpleslidestrue
}
\ProcessOptions\relax

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
\newcommand{\slidelogo}{~}
\newcommand{\slidefoot}{~}

\setbeamertemplate{footline}{
    \hspace*{.12\paperwidth}
    \parbox{.3\paperwidth}{\centering \slidelogo}
    \parbox{.3\paperwidth}{\centering \slidefoot}
    \parbox{.12\paperwidth}{\centering \insertdate}
    \hspace{.01\paperwidth}
    \parbox{.02\paperwidth}{\centering \insertframenumber}
    \vspace*{.06\paperheight}
}
\ifsimpleslides
    \setbeamertemplate{footline}
    {
        \hspace*{.12\paperwidth}
        \parbox{.58\paperwidth}{\centering \slidefoot}
        \hspace{.02\paperwidth}
        \hspace{.02\paperwidth}
        \parbox{.10\paperwidth}{\centering \insertframenumber}
        \hfill
        \vspace*{.06\paperheight}
    }
\fi

% Customize title page style
\defbeamertemplate*{title page}{customized}[1][]
{
    \usebeamerfont{title}\usebeamercolor[fg]{title}
    \inserttitle\par
    \bigskip
    \usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}
    {\raggedleft\insertsubtitle\par}
    \vfill
    \begin{center}
        \usebeamerfont{author}\usebeamercolor[fg]{author}
        \insertauthor\par
        \smallskip
        \usebeamerfont{date}\usebeamercolor[fg]{date}
        \insertinstitute\par
        \smallskip
        \insertdate\par
    \end{center}
}

\newcommand{\titlelogo}{~}
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
            \parbox{.3\paperwidth}{\centering \titlelogo}
            \parbox{.3\paperwidth}{\centering \slidefoot}
            \parbox{.12\paperwidth}{\centering \insertdate}
            \hspace{.01\paperwidth}
            \parbox{.02\paperwidth}{\centering \insertframenumber}
            \vspace*{.06\paperheight}
        }
        \ifsimpleslides
            \setbeamertemplate{footline}
            {
                \hspace*{.12\paperwidth}
                \parbox{.58\paperwidth}{\centering \slidefoot}
                \hspace{.02\paperwidth}
                \hspace{.02\paperwidth}
                \parbox{.10\paperwidth}{\centering \insertframenumber}
                \hfill
                \vspace*{.06\paperheight}
            }
        \fi
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

% Add text commands
\DeclareTextFontCommand{\textemph}{\bfseries\color{purdue-aged}}
\DeclareTextFontCommand{\textemphdark}{\bfseries\color{purdue-dust}}
