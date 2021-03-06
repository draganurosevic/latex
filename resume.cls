% resume.cls
% by Ankur Dave <ankurdave@gmail.com>

\ProvidesClass{resume}

% User-configurable commands
% ==========================

% Options defaults

% To set the default options, see the end of the "Declaring options" section

% Change the font size
\DeclareOption{twoside}{
	\PassOptionsToClass{twoside}{article}
}
\ProcessOptions
\LoadClass[10pt]{article}

% Add fields that you want to set in the document
\makeatletter
	\newcommand{\name}[1]{\def \@name {#1}}
	\newcommand{\addressone}[1]{\def \@addressone {#1}}
	\newcommand{\addresstwo}[1]{\def \@addresstwo {#1}}
	\newcommand{\phone}[1]{\def \@phone {#1}}
	\newcommand{\email}[1]{\def \@email {#1}}
	\newcommand{\website}[1]{\def \@website {#1}}
\makeatother

\name{}
\addressone{}
\addresstwo{}
\phone{}
\email{}
\website{}

% Declaring options
% ==================

% Typefaces
\makeatletter
	\newcommand{\@typeface}{}
	
	\DeclareOption{newcent}{
		\renewcommand{\@typeface}{\usepackage{newcent}}
	}
	\DeclareOption{times}{
		\renewcommand{\@typeface}{\usepackage{pslatex}}
	}
	\DeclareOption{charter}{
		\renewcommand{\@typeface}{\usepackage[bitstream-charter]{mathdesign}}
	}
	\DeclareOption{computer-modern}{
		\renewcommand{\@typeface}{}
	}
\makeatother

% Alignment
\makeatletter
	\newcommand{\@alignment}{}
	
	\DeclareOption{justify}{
		\renewcommand{\@alignment}{}
	}
	\DeclareOption{leftalign}{
		\renewcommand{\@alignment}{\RaggedRight}
	}
\makeatother

% Spacing
\makeatletter
	\newcommand{\@spacing}{}
	
	\DeclareOption{singlespace}{
		\renewcommand{\@spacing}{}
	}
	\DeclareOption{doublespace}{
		\renewcommand{\@spacing}{\setstretch{2.0}}
	}
\makeatother

% Set default options (must come last in this section)
\ExecuteOptions{charter,leftalign,singlespace}

% Applying options
% ================

% Run the options
% (must come first in this section)
\ProcessOptions

% Typefaces
\makeatletter
	\@typeface
\makeatother
\renewcommand{\ttdefault}{cmtt}

% Alignment
% (must be before indentation because raggedright clears parindent)
\usepackage{ragged2e}
\makeatletter
	\@alignment
\makeatother

% Spacing
\usepackage{setspace}
\makeatletter
%	\@spacing % Normally, spacing is set only after the title. Uncomment to set it for the title as well
\makeatother

% Other configuration
% ===================

\usepackage{multirow}

% Margins
\usepackage[top=0.5in,bottom=0.5in,left=1in,right=1in]{geometry}

% Indentation
\usepackage{indentfirst}
\setlength{\parindent}{0pt}
\setlength{\parskip}{3pt plus 2pt minus 1pt}

% Figures
\usepackage[pdftex]{graphicx}

% Lists
%\renewenvironment{itemize}{\begin{list}{$\bullet$}{
\usepackage{atbeginend}
\AfterBegin{itemize}{
	\setlength{\topsep}{0pt}
	\setlength{\partopsep}{0pt}
	\setlength{\itemsep}{1pt}
	\setlength{\parsep}{0pt}
	\setlength{\leftmargin}{2em}
	\setlength{\rightmargin}{0pt}
	\setlength{\listparindent}{0em}
	\setlength{\itemindent}{0em}
	\setlength{\labelsep}{0.5em}
}
%}}{\end{list}}

% Templates
% =========

% Sections
\makeatletter
\renewcommand{\section}[1]{
	\@startsection
		{section}
		{1}
		{\z@}
		{0.8em plus 0.2em minus 0.1em} % rubber length -- LaTeX can grow or shrink it if necessary
		{0em}
		{\normalfont\Large\sc\bfseries}
		*
		{#1}
	\hspace*{\fill} % End the section line
	\vspace{2pt}
	\hrule
	\vspace{0.5em}
	\par
}
\makeatother

% Job positions
\makeatletter
	\newcommand{\employer}[1]{\def \@employer {#1}}
	\newcommand{\location}[1]{\def \@location {#1}}
	\newcommand{\jobtitle}[1]{\def \@jobtitle {#1}}
	\newcommand{\dates}[1]{\def \@dates {#1}}
	\employer{}
	\jobtitle{}
	\dates{}

	\newenvironment{position}{
		\textbf{\@employer} \hfill \textit{\@location}\\
		\textit{\@jobtitle} \hfill \@dates
		\par
	}{
		\vspace{0.5em}
	}
\makeatother

% Schools
\makeatletter
	\newcommand{\schoolname}[1]{\def \@schoolname {#1}}
%	\newcommand{\dates}[1]{\def \@dates {#1}} % already defined by position
	\schoolname{}
	\dates{}

	\newenvironment{school}{
		\textbf{\@schoolname} \hfill \@dates
		\par
	}{
		\vspace{0.5em}
	}
\makeatother

% Paragraphs of text that need indentation
\newenvironment{paragraphs}{
	\setlength{\parindent}{12pt}
}{
	\setlength{\parindent}{0pt}
}

% Title
\makeatletter
\def \@maketitle {
	\begin{center}
		{\Large \bf \@name}
		\vspace{0.5em} \hrule height 1pt \vspace{0.5em}
		\begin{tabular}{r l}
			\@addressone & \@addresstwo \\
			\texttt{\@email} & \@phone \\
			\multicolumn{2}{c}{\texttt{\@website}}
		\end{tabular}
	\end{center}
}
\makeatother

