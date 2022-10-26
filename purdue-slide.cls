\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{purdue-slide}[A Purdue LaTeX Slide Template]

% For 4:3 slides: \LoadClass{beamer}
\LoadClass[aspectratio=169]{beamer}
\RequirePackage{calc}
\RequirePackage{environ}
\RequirePackage{svg}
\RequirePackage{tikz}
\usetikzlibrary{positioning}

% Font: https://tug.org/FontCatalogue/texgyreheros/
% TODO: Maybe find a better font sometime later.
\RequirePackage[T1]{fontenc}
\RequirePackage{tgheros}
\RequirePackage{fix-cm}
\renewcommand*\familydefault{\sfdefault}

% Color
\definecolor{purdue-gold}{RGB}{207, 185, 145}
\definecolor{purdue-dust}{RGB}{235, 217, 159}
\definecolor{purdue-field}{RGB}{221, 185, 69}
\definecolor{purdue-rush}{RGB}{218, 170, 0}
\definecolor{purdue-aged}{RGB}{142, 111, 62}
\definecolor{purdue-steam}{RGB}{196, 191, 192}
\definecolor{purdue-railway-gray}{RGB}{157, 151, 149}
\definecolor{purdue-cool-gray}{RGB}{111, 114, 123}
\definecolor{purdue-steel}{RGB}{85, 89, 96}

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
    \includesvg[width=.3\paperwidth,keepaspectratio]{\slidelogo}
    \makebox[.3\paperwidth][c]{\slidefoot}
    \makebox[.12\paperwidth][c]{\insertdate}
    \hspace{.01\paperwidth}
    \makebox[.02\paperwidth][c]{\insertframenumber}
    \vspace*{.06\paperheight}
}

% Customize enumerate/itemize style
\setbeamerfont*{enumerate item}{series=\bfseries}
\setbeamerfont*{enumerate subitem}{series=\bfseries}
\setbeamerfont*{enumerate subsubitem}{series=\bfseries}
\setbeamercolor*{enumerate item}{fg=black}
\setbeamercolor*{enumerate subitem}{fg=black}
\setbeamercolor*{enumerate subsubitem}{fg=black}

\setbeamercolor*{itemize item}{fg=black}
\setbeamercolor*{itemize subitem}{fg=black}
\setbeamercolor*{itemize subsubitem}{fg=black}
\setbeamertemplate{itemize items}[square]

% Customize block style:
\setbeamercolor{block body}{bg=purdue-dust}
\setbeamercolor{block title}{bg=purdue-aged, fg=white}
\setbeamercolor{block body example}{bg=purdue-steam}
\setbeamercolor{block title example}{bg=purdue-steel, fg=white}
\setbeamercolor{block body alerted}{bg=alerted text.fg!10}
\setbeamercolor{block title alerted}{bg=alerted text.fg!20}

% Customize figure tyle:
\setbeamercolor{caption name}{fg=purdue-aged}

% Customize title page style
\setbeamercolor*{title}{fg=purdue-gold}
\setbeamerfont*{title}{size={\fontsize{30}{36}}, series=\fontseries{bc}, shape=\fontshape{it}}
\setbeamercolor*{subtitle}{fg=white}
\setbeamerfont*{subtitle}{size={\fontsize{11}{14}}, series=\fontseries{bm}, shape=\fontshape{it}}
\setbeamercolor*{author}{fg=white}
\setbeamerfont*{author}{size={\fontsize{11}{14}}, series=\fontseries{bm}, shape=\fontshape{n}}
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
            \includesvg[width=.3\paperwidth,keepaspectratio]{\titlelogo}
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
