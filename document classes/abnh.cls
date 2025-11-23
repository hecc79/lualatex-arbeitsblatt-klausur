
%----------Kenndaten
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abnh}

%----------Deklaration von Optionen
\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{scrartcl}}

%----------Ausf"uren von Optionen

\ProcessOptions\relax

%----------Laden von Paketen
\LoadClassWithOptions{scrartcl}

\RequirePackage[]{fontspec}

\RequirePackage{scrlayer-scrpage}
\RequirePackage[]{geometry}

%Mathematik Pakete
\RequirePackage[fleqn]{amsmath}
\RequirePackage[math-style=upright,colon=literal]{unicode-math}

\RequirePackage{icomma}

\RequirePackage{siunitx}
\sisetup{locale = DE}

\RequirePackage[dvipsnames]{xcolor}

%pgf und tikz
\RequirePackage{tikz}
\RequirePackage{pgf}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18,set layers=standard}
\RequirePackage{pgffor}
\usetikzlibrary{babel}
\usetikzlibrary{arrows}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{patterns}
\usetikzlibrary{3d}
\usetikzlibrary{quotes}
\usetikzlibrary{angles}
\usetikzlibrary{decorations}
\usetikzlibrary{decorations.pathmorphing}
\usetikzlibrary{shapes.misc}
%\usetikzlibrary{datavisualization}
%\usetikzlibrary{datavisualization.formats.functions}
\usetikzlibrary{trees}

%Sonstige Pakete

\RequirePackage{tabularray}

\RequirePackage{multicol} % Abschnittsweises mehrspaltiges Layout
\RequirePackage{environ} % Fortgeschrittenes Definieren eigener Environments

\RequirePackage{hyperref}
\urlstyle{same}

\RequirePackage{tasks}

\RequirePackage{enumitem}% easy control of topsep and leftmargin for lists: Nötig für Einrückungen im Abi Stil
\newlist{abienum}{enumerate}{2}
\setlist[abienum,1]{label=\arabic*., leftmargin=2em,labelsep=1.2em}
\setlist[abienum,2]{label=\arabic{abienumi}.\arabic*, leftmargin=2.5em}

\setlist[enumerate,1]{label=\alph{enumi})}
\setlist[enumerate,2]{label=\arabic{enumii})}
%--end enumitem

\RequirePackage{listings}
\lstset{columns=fullflexible,frame=single,basicstyle=\ttfamily\fontsize{10}{12}\selectfont,mathescape}
%--end listings

\RequirePackage[linewidth=0.5pt,framemethod=tikz]{mdframed} % modernes frame paket

\RequirePackage{url}

\RequirePackage[german,provide=*]{babel}

\RequirePackage{setspace}


%----------Hauptteil



% Spare Papier ...
\geometry{a4paper, portrait, left=2cm, right=2cm, top=2.5cm, bottom=2.5cm}

%Fonts
\setmainfont[Ligatures=TeX]{Stix Two Text}
\setsansfont[Ligatures=TeX]{texgyreheros}
\setmonofont[]{sourcecodepro}
\setmathfont{Stix Two Math}
\setmathfont{TeX Gyre Termes Math}[
   range=bb,
   Scale=MatchUppercase]
   
%\setmathfont[range=\bigstar]{Asana Math}
%\setmathfont[range=\setminus]{Asana Math}
%\setmathfont[range=\int]{texgyrescholamath} % just to get parameters from this font

%---TITEL
\newcommand{\mytitle}{\begin{center}
  {\large \textbf{\textsf{\printtitle}}}
\end{center}
}
\newcommand{\printtitle}{\@title}
%---Ende TITEL

\newcounter{aufgabe}
\setcounter{aufgabe}{1}

\newcounter{loesung}
\setcounter{loesung}{1}

\newcounter{paufgabe}
\setcounter{paufgabe}{1}

\newcounter{waufgabe}
\setcounter{waufgabe}{1}

\newcounter{ploesung}
\setcounter{ploesung}{1}

\newcounter{wloesung}
\setcounter{wloesung}{1}

\newcounter{loesc}
\setcounter{loesc}{1}

\NewEnviron{aufgabe}{
\medskip\par\textbf{Aufgabe \arabic{aufgabe}:}~~ \BODY
\addtocounter{aufgabe}{1}
}



\NewEnviron{paufgabe}{
\par\textsf{\textbf{P \arabic{paufgabe}:}}~~ \BODY
\addtocounter{paufgabe}{1}
}

\NewEnviron{waufgabe}{
\par\textsf{\textbf{W \arabic{waufgabe}:}}~~ \BODY
\addtocounter{waufgabe}{1}
}

\NewEnviron{loesung}{
\par\textbf{Lösung \arabic{loesung}:}~~ \BODY
\addtocounter{loesung}{1}
}

\NewEnviron{ploesung}{
\par\textsf{\textbf{P \arabic{ploesung}:}}~~ \BODY
\addtocounter{ploesung}{1}
}

\NewEnviron{wloesung}{
\par\textsf{\textbf{W \arabic{wloesung}:}}~~ \BODY
\addtocounter{wloesung}{1}
}

\NewEnviron{waufgabes}[1]{
\par\textsf{\textbf{W \arabic{waufgabe} $\directlua{for i=1,tonumber(#1) do tex.print([[\bigstar]]) end }$:}}~~ \BODY
\addtocounter{waufgabe}{1}
}

\newcommand{\aaufgabe}[1]{
\medskip\par\textbf{Aufgabe \arabic{aufgabe}:}~~\addtocounter{aufgabe}{1}}

\newcommand{\solutionfield}[2]{\mbox{
	\begin{tikzpicture}
	\filldraw[draw=black,fill=lightgray!50] (0,0) rectangle (#1,#2);
	\end{tikzpicture}
	}}
\newcommand{\wsolutionfield}[2]{\mbox{
	\begin{tikzpicture}
	\filldraw[draw=black,fill=white] (0,0) rectangle (#1,#2);
	\end{tikzpicture}
	}}
\newcommand{\csolutionfield}[2]{
~\begin{minipage}[c]{#1}
\solutionfield{#1}{#2}
\end{minipage}~
	}
\newcommand{\cwsolutionfield}[2]{
~\begin{minipage}[c]{#1}
\wsolutionfield{#1}{#2}
\end{minipage}~
	}

\newcommand{\pqformel}[3]{{#1}_{1,2}=-\frac{{#2}}{2}\pm \sqrt{\left( \frac{{#2}}{2}\right)^2-{#3}}}

\newcommand{\pint}[4]{\int\limits_{#2}^{#3} \! #1\,\mathrm{d}#4}
\newcommand{\abs}[1]{\left|\, #1 \,\right|}
\newcommand{\pr}[1]{\left( #1 \right)}
\newcommand{\pb}[1]{\left[ #1 \right]}
\newcommand{\set}[1]{\left\{ #1 \right\}}
\newcommand{\wsin}[1]{\sin\left(\ang{#1}\right)}
\newcommand{\wcos}[1]{\cos\left(\ang{#1}\right)}
\newcommand{\wtan}[1]{\tan\left(\ang{#1}\right)}

\newcommand{\aint}[4]{\abs{\,\pint{#1}{#2}{#3}{#4}}}
\newcommand{\dF}[3]{\abs{#1\left( #3 \right) -#1 \left( #2 \right) }}
\newcommand{\V}[3]{
\begin{pmatrix}  #1\\ #2 \\ #3\\  \end{pmatrix}
}
\newcommand{\VV}[4]{
\overrightarrow{#1} = \V{#2}{#3}{#4}
}

\newcommand{\Punkt}[4]{
#1\left(#2 \,\Big|\, #3 \,\Big|\, #4\right)
}

\newcommand{\Pnkt}[3]{
#1\left(#2 \,\Big|\, #3\right)
}

\newcommand{\EbeneP}[9]{
\overrightarrow{x} = \V{#1}{#2}{#3} + r\cdot \V{#4}{#5}{#6} + s\cdot \V{#7}{#8}{#9}
}
\newcommand{\EbenePO}[9]{
\V{#1}{#2}{#3} + r\cdot \V{#4}{#5}{#6} + s\cdot \V{#7}{#8}{#9}
}
\newcommand{\Gerade}[6]{
\overrightarrow{x} = \V{#1}{#2}{#3} + t\cdot \V{#4}{#5}{#6}
}
\newcommand{\GeradeP}[7]{
\overrightarrow{x} = \V{#1}{#2}{#3} + #7\cdot \V{#4}{#5}{#6}
}
\newcommand{\GeradePP}[8]{
\overrightarrow{#8} = \V{#1}{#2}{#3} + #7\cdot \V{#4}{#5}{#6}
}
\newcommand{\GeradeG}[9]{
 \V{#7}{#8}{#9} = \V{#1}{#2}{#3} + t\cdot \V{#4}{#5}{#6}
}
\newcommand{\GeradeO}[6]{
\V{#1}{#2}{#3} + t\cdot \V{#4}{#5}{#6}
}

\newcommand{\GeradeOP}[7]{
\V{#1}{#2}{#3} + #7\cdot \V{#4}{#5}{#6}
}

\newcommand{\vectcos}[2]{\dfrac{#1 \cdot #2}{\left|#1\right|\cdot\left|#2\right|}}

\NewEnviron{mpalign}[1]{
\begin{minipage}[t]{#1}
    \vspace{-2.2\abovedisplayskip}
    \setlength{\mathindent}{0pt}
    \begin{align*}
      \BODY
    \end{align*}
  \end{minipage}
}

\NewEnviron{mpaligned}[1]{
\begin{minipage}[t]{#1}
    \ensuremath{\displaystyle
    \begin{aligned}
    \BODY 
    \end{aligned}}
  \end{minipage}
}


\NewEnviron{mpgather}[1]{
\begin{minipage}[t]{#1}
\vspace{-2.2\abovedisplayskip}
    \setlength{\mathindent}{0pt}
    \begin{gather*}
      \BODY
      \end{gather*}
      \vspace{-0.2cm}
  \end{minipage}
}

\NewEnviron{mpgathernr}[1]{
\begin{minipage}[t]{#1}
\vspace{-1.2\abovedisplayskip}
    \setlength{\mathindent}{0pt}
    \begin{gather}
      \BODY
      \end{gather}
      \vspace{-0.2cm}
  \end{minipage}
}

\NewEnviron{rightgraphic}[2]{

\begin{minipage}[t]{#1\linewidth}
\BODY
\end{minipage}
\hfill
\begin{minipage}[t]{\directlua{tex.print(1-tonumber(#1)-0.05)}\linewidth}
\vspace{-1em}
\vfill
#2
\end{minipage}
}

\NewEnviron{leftgraphic}[2]{

\begin{minipage}[t]{\directlua{tex.print(1-tonumber(#1)-0.05)}\linewidth}
\vspace{-1em}
\vfill
#2
\end{minipage}
\hfill
\begin{minipage}[t]{#1\linewidth}
\BODY
\end{minipage}
}


\newcommand{\karopapier}[2]{\begin{tikzpicture}
	%\draw[gray!40,step=1mm,very thin] (0,0) grid (#1,#2);
	%% .5cm Linien
	\draw[gray,step=5mm,thin] (0,0) grid (#1,#2);
	%% 1.0cm Linien
	%%\draw[step=10mm,thin] (0,0) grid (#1,#2);
	%
	\end{tikzpicture}}
	
  \newcommand{\mmpapier}[2]{\begin{tikzpicture}
  \draw[black,step=1mm, very thin] (0,0) grid (#1,#2);

  \draw[black,step=5mm,thin] (0,0) grid (#1,#2);
  \draw[black, step=10mm,semithick] (0,0) grid (#1,#2);
  
  \end{tikzpicture}}

 \pgfplotsset{
    schule/.style={
      /pgf/number format/use comma,
      axis lines=center,
      axis line style={->,thick},
      %enlarge x limits={abs=1cm,upper}, enlarge y limits=auto,
      xlabel=$x$,
      ylabel=$y$,
      every axis label/.append style={font=\scriptsize},
      tick style={black},
      tick label style={font=\scriptsize},
      grid=both,
      major grid style={gray,thin},
      minor grid style={gray,thin},
      minor tick num=1,
      minor tick length=0pt,
      major tick style={thick,black},
      font=\scriptsize,
      every axis plot/.append style={black,thick,samples=100},
    },
    schule3/.style={
        /pgf/number format/use comma,
        axis lines=center,
        axis line style={line width=0.7pt, -{Stealth[scale=1.2]}},
        tick style={black,line width=0.5pt},
        tick align=center,
        major tick length=4pt,
        xtick distance=1, ytick distance=1, ztick distance=1,
        xticklabel=\empty, yticklabel=\empty, zticklabel=\empty,
        xlabel={$x_1$},
        ylabel={$x_2$},
        zlabel={$x_3$},
        x={(-0.5cm,-0.5cm)}, z={(0,1cm)}, y={(1cm,0)},
        clip=false,
        font=\scriptsize,
        every axis plot/.append style={black,thick,samples=100},
    },
}

\newcommand{\addsub}[1]{%
  \directlua{require("rechnen.lua")
  addsub("\luaescapestring{#1}")
}}

\newcommand{\multiplikation}[4]{%
\directlua{require("rechnen.lua")
multiplikation("\luaescapestring{#1}","\luaescapestring{#2}","\luaescapestring{#3}","\luaescapestring{#4}")
}}

\newcommand{\division}[4]{%
\directlua{require("rechnen.lua")
div("\luaescapestring{#1}","\luaescapestring{#2}","\luaescapestring{#3}","\luaescapestring{#4}")
}}

\newcommand{\term}[3]{%
\directlua{require("rechnen.lua")
term("\luaescapestring{#1}","\luaescapestring{#2}","\luaescapestring{#3}")
}}


\tikzset{cross/.style={cross out, draw=black, minimum size=2*(#1-\pgflinewidth), inner sep=0pt, outer sep=0pt},
%default radius will be 1pt. 
cross/.default={1pt}}