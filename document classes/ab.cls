
%----------Kenndaten
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ab}

%----------Deklaration von Optionen
\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{abnh}}

%----------Ausf"uren von Optionen

\ProcessOptions\relax

%----------Laden von Paketen
\LoadClassWithOptions{abnh}

% Spare Papier ...
\geometry{a4paper, portrait, left=2cm, right=2cm, top=2.5cm, bottom=2.5cm}

%---Konfiguriere Kopfzeile
\newcommand{\kopfzeile}[1]{
\def \@kopfzeile {#1}
}
\kopfzeile{} %Leere Default Kopfzeile

\lohead{\@kopfzeile \hfill \pagemark}
%\setheadsepline{.5pt}
\KOMAoptions{headsepline=true}

\setkomafont{pageheadfoot}{\normalfont\rmfamily}
\cfoot{}
\pagestyle{scrheadings}
%---Ende Kopfzeile