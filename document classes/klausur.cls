
%----------Kenndaten
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{klausur}

%----------Deklaration von Optionen
\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{ab}}

%----------Ausf"uren von Optionen

\ProcessOptions\relax

%----------Laden von Paketen
\LoadClassWithOptions{ab}
 \kopfzeile{\schule\,--\,\kurs\,--\,\fach\,--\,\art\,\nr/\nrmax\,--\,\datum\,--\,\lehrer}
\newcommand{\klausurkopf}{
 \begin{tblr}{
   width=\linewidth,           
   colspec={|X[l]|X[l]|X[l]|X[l]|X[l]|X[l]|},
   row{5-7} = {ht=0.8cm}, 
   vlines,
   hlines                          
 }
 Schuljahr: &  \jahr & Klasse/Kurs: & \kurs & Datum: & \datum \\
 Fach:       & \fach & Nummer:    & \nr\,/ \nrmax & Zeit:  & \zeit   \\
 Lehrer:       & \lehrer & BE:  & \be & BE Sprache: & \bes \\
 Thema:      & \SetCell[c=5,r=1]{l} \thema                    \\
 Name:      & \SetCell[c=5,r=1]{l}  \\
 Wortzahl: & & Sprachl. F.:  & & Abzug: (BE) &  \\
 Summe BE: &  & Note:                &  & Mündlich:            & \\
 \end{tblr}
 
 \title{\nr . \art}

}


\newcommand{\kkaufgabenp}[1]{
\medskip\par\textbf{Aufgabe \arabic{aufgabe} (~~~~~~ / #1 BE):}~~\addtocounter{aufgabe}{1}}



\NewTblrTheme{empty}{
	\SetTblrTemplate{contfoot}{empty}
	\SetTblrTemplate{conthead}{empty}
	\SetTblrTemplate{caption}{empty}
	\SetTblrTemplate{note}{empty}
	\SetTblrTemplate{remark}{empty}
	\SetTblrTemplate{head}{empty}
	\SetTblrTemplate{foot}{empty}
}

\NewTblrEnviron{soltable}
\SetTblrInner[soltable]{
	hline{1,Z},
  	width=\linewidth,
  	colspec={X X[0.8cm,c]},
	vlines
	}
\SetTblrOuter[soltable]{
	long,
	theme=empty
	}

\newcounter{kaufgabec}
\setcounter{kaufgabec}{1}

\newcommand{\kaufgabe}[1]{
\medskip\par\textsf{\textbf{Aufgabe \arabic{kaufgabec} (~~~~~~ / #1 BE):}}~~\addtocounter{kaufgabec}{1}\par}

\newcommand{\kloesung}{
\medskip\par\textsf{\textbf{Lösung Aufgabe \arabic{loesc}:}}\addtocounter{loesc}{1}~~\par
}

\newcounter{teilc}
\setcounter{teilc}{1}

\newcounter{teilloesc}
\setcounter{teilloesc}{1}


\newcommand{\teil}[1]{
\setcounter{kaufgabec}{1}
\medskip\par\textsf{\textbf{\large Teil \Alph{teilc} (~~~~~~ / #1 BE):}}~~\addtocounter{teilc}{1}\par


}

\newcommand{\teilloesung}[1]{
\setcounter{loesc}{1}
\medskip\par\textsf{\textbf{\large Lösungen Teil \Alph{teilloesc}}}\addtocounter{teilloesc}{1}\par


}







	
