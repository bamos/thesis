%% dkoes 5/10/2006

\LoadClassWithOptions{book}


%% dkoes - Here's a bunch of stuff taken from mjz-titlepage.sty that makes
% a pretty CMU techreport acceptable title page

%% titlepage parameters
%%   required: title, author, date, Year, trnumber, committee
%%   optional: permission, support, disclaimer, keywords

\def\title#1{\gdef\@title{#1}}
\def\author#1{\gdef\@author{#1}}
\def\date#1{\gdef\@date{#1}}
\def\Year#1{\gdef\@Year{#1}}
\def\trnumber#1{\gdef\@trnumber{#1}}
\def\committee#1{\gdef\@committee{#1}}
\def\permission#1{\gdef\@permission{#1}}
\def\support#1{\gdef\@support{#1}}
\def\disclaimer#1{\gdef\@disclaimer{#1}}
\def\keywords#1{\gdef\@keywords{#1}}

\newsavebox{\@copyrightbox}
%\def\@copyrightnotice#1{{\small\sbox{\@copyrightbox}{#1}\ifthenelse{\lengthtest{\wd\@copyrightbox > \linewidth}}{\noindent #1 \par}{\begin{center} #1 \end{center}}}}
\def\@copyrightnotice#1{{\small\sbox{\@copyrightbox}{#1}\ifdim\wd\@copyrightbox>\linewidth \noindent #1 \par\else\begin{center} #1 \end{center}\fi}}

\def\maketitle{
\thispagestyle{empty}

% calculate skip needed to ensure that title appears in the cut-out
\newlength{\@cutoutvskip}
\setlength{\@cutoutvskip}{2.1875 true in}       % position of cut-out
\addtolength{\@cutoutvskip}{-1 true in}         % printer margin
\addtolength{\@cutoutvskip}{-\topmargin}
\addtolength{\@cutoutvskip}{-\headheight}
\addtolength{\@cutoutvskip}{-\headsep}

%% Centered things on the title page must be *physically* centered
%% on the page, so they line up with the cut-out window. So we hardwire
%% the margins for the title page so that left margin = right margin:
%%         left margin = (8.5in - textwidth)/2
% \oddsidemargin=8.5in % Edited by bamos
\oddsidemargin=8.5in
\advance\oddsidemargin by -\textwidth
\oddsidemargin=.5\oddsidemargin
\advance\oddsidemargin by -1in % TeX sux
%
\let\footnoterule\relax
\vglue\@cutoutvskip
\begin{center}
%\begin{minipage}[t]{4.875in}   % must be a minipage due to \thanks
\begin{minipage}[t]{5.2in}      % hackery
\vbox to 2in{
\vfill
\begin{center}
{\Large \strut \@title\par}
\vfill
{\large \begin{tabular}[t]{c}\@author\end{tabular}\par}
\vfill
{\sc \@trnumber\par}
\smallskip
{\large \@date\par}
\end{center}
\vfill}
\end{minipage}
\end{center}

\vskip 3em

\begin{center}
    Computer Science Department \\
    School of Computer Science \\
    Carnegie Mellon University \\
    Pittsburgh, PA 15213
\end{center}
\vskip 3em

\begin{center}
    {\bf Thesis Committee} \\
    \@committee
\end{center}
\vskip 3em

\begin{center}
    \em
    Submitted in partial fulfillment of the requirements \\
    for the degree of Doctor of Philosophy.
\end{center}


\vfill

\@ifundefined{@permission}{\@copyrightnotice{Copyright \copyright\ \@Year\ \@author}}{\@copyrightnotice{Copyright \copyright\ \@Year\ \@author. \@permission}}

\@ifundefined{@support}{}{{\medskip\footnotesize\noindent\@support\par}}

\@ifundefined{@disclaimer}{}{{\medskip\footnotesize\noindent\@disclaimer\par}}

% keywords go at bottom of page ii (the rear of the titlepage)
% if keywords are omitted, this page is blank

\clearpage
\thispagestyle{empty}
\@ifundefined{@keywords}{}{\vspace*{\fill} {\bf Keywords:} \@keywords}
\cleardoublepage
}

\newenvironment{dedication}
  {\cleardoublepage \thispagestyle{empty} \vspace*{\stretch{1}} \begin{center} \em}
  {\end{center} \vspace*{\stretch{3}} \clearpage}


\newenvironment{psuedochapter}[1]
{\cleardoublepage
  \thispagestyle{empty}
  % \vspace*{\stretch{1}} 
  \begin{center} \large {\bf #1} \end{center}
  % \addcontentsline{toc}{chapter}{\numberline{}#1} %--not yet mjz 
  \begin{quotation}}
  {\end{quotation} 
  \vspace*{\stretch{3}}
  \clearpage
}

\newenvironment{abstract}
	{\begin{psuedochapter}{Abstract}}{\end{psuedochapter}}

\newenvironment{acknowledgments}
	{\begin{psuedochapter}{Acknowledgments}}{\end{psuedochapter}}





%% dkoes - what follows is just a result of my personal style preferences
% most things are shamelessly ripped from various conference class files

%                       Utilities
%                       ---------


\newcommand{\centeroncapheight}[1]{%
  {\setbox\@tempboxa = \hbox{#1}%
   \@measurecapheight{\@tempdima}%         % Calculate ht(CAP) - ht(text)
   \advance \@tempdima by -\ht\@tempboxa   %           ------------------
   \divide \@tempdima by 2                 %                   2
   \raise \@tempdima \box\@tempboxa}}

\newbox{\@measbox}

\def \@measurecapheight #1{%                            {\dimen}
  \setbox\@measbox = \hbox{ABCDEFGHIJKLMNOPQRSTUVWXYZ}%
  #1 = \ht\@measbox}

\long\def \@titlefootnote #1#2{%
  \insert\footins{%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
%%%    \protected@edef\@currentlabel{%
%%%       \csname p@footnote\endcsname\@thefnmark}%
    \color@begingroup
      \def \@makefnmark {$^{#1}$}%
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#2\@finalstrut\strutbox}%
    \color@endgroup}}

%                       Lists
%                       -----

\setlength{\topsep}{1pt}
 \setlength{\itemsep}{1pt}
\setlength{\parsep}{3pt}

\renewcommand{\labelitemi}{{\small \centeroncapheight{\textbullet}}}
\renewcommand{\labelitemii}{\centeroncapheight{\rule{2.5pt}{2.5pt}}}
\renewcommand{\labelitemiii}{$-$}
\renewcommand{\labelitemiv}{{\Large \textperiodcentered}}

\renewcommand{\@listi}{%
  \leftmargin = \leftmargini
  \listparindent = 0pt}

\let \@listI = \@listi

\renewcommand{\@listii}{%
  \leftmargin = \leftmarginii
  \topsep = 1pt
  \labelwidth = \leftmarginii
  \advance \labelwidth by -\labelsep
  \listparindent = \parindent}

\renewcommand{\@listiii}{%
  \leftmargin = \leftmarginiii
  \labelwidth = \leftmarginiii
  \advance \labelwidth by -\labelsep
  \listparindent = \parindent}

\renewcommand{\@listiv}{%
  \leftmargin = \leftmarginiv
  \labelwidth = \leftmarginiv
  \advance \labelwidth by -\labelsep
  \listparindent = \parindent}


% A simple style file to provide a draft marking in the background of
% a file
% Thank you to Will Uther who provided the base code that I rolled
% into this package
% ChangeLog
% 1.1: shrunk and shifted the stamp so that it avoid the unprintable
% area at the top of the page
% 1.2 dkoes - made it big and rotated and light
% 1.3 dkoes - made it small, and unrotated since Jonathan Aldrich complained
% 1.4 comar - moved it below the page number to avoid problem with synctex
\RequirePackage{graphicx}
\RequirePackage{eso-pic}
\RequirePackage{color}

%Got this from Will (will@cs.cmu.edu)
%usage: \draftstamp{date}{label}
\newcommand{\draftstamp}[2]{\definecolor{DraftGrey}{gray}{0.7}
  \ClearShipoutPicture\AddToShipoutPicture{
    \begin{minipage}[b][0.11\paperheight][t]{\paperwidth}     
    \centering
    	\vspace{.4in}
            \textcolor{DraftGrey}{\renewcommand{\baselinestretch}{1.0}\normalsize
            \begin{tabular}{c}
                    #1 \\
                    #2
             \end{tabular}            
        }
        
    \end{minipage}
}}

% mainmatter is ignoring openany, fix
\renewcommand\mainmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmattertrue
  \pagenumbering{arabic}}
