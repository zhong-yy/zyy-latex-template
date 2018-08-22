\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{coursework}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 作者: 钟乙源
% 中南大学, 地球科学与信息物理学院
%
% Author: Yiyuan Zhong
% Central South University, Geoscience building 226
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*\coursework@tokens@studentName{}
\newcommand*\coursework@tokens@studentID{}
\newcommand*\coursework@tokens@teacherName{}
\newcommand*\coursework@tokens@major{}
\newcommand*\studentName[1]{%
	\renewcommand{\coursework@tokens@studentName}{#1}}
\newcommand*\studentID[1]{%
	\renewcommand{\coursework@tokens@studentID}{#1}}
\newcommand*\teacherName[1]{%
	\renewcommand{\coursework@tokens@teacherName}{#1}}
\newcommand*\major[1]{%
	\renewcommand{\coursework@tokens@major}{#1}}


%%%%%%%%%%%%%%%%%%Declaration of Options%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Declaration of Options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%% Executing of Options
\ProcessOptions\relax
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Loading Class
\LoadClass[a4paper,12pt]{article}

%%%%%%%%%%%%%%%%%%%%%titlepage%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{\par
	\begingroup
	\newpage
	\global\@topnum\z@ % Prevents figures from going at top of page.
	\ge@maketitle      %
	\endgroup
%	\global\let\maketitle\relax
%	\global\let\@maketitle\relax
%	\global\let\@title\@empty
}
\RequirePackage{tabu}
\RequirePackage{fontspec}
\RequirePackage{titletoc}
\RequirePackage{lastpage}
\def\ge@maketitle{%
	\newpage
%	\noindent
	\thispagestyle{empty}
	\setCJKfamilyfont{xw}{STXinwei}
	\newcommand*{\xinwei}{\CJKfamily{xw}}
	\vspace*{8mm}
	\begin{center}
		\includegraphics[width=0.72\textwidth]{fig/csuLOGO.jpg}
	\end{center}
	%{\zihao{-4}\linespread{2.0}\selectfont ~\par}
	\vspace*{1.5cm}
	\heiti
	\begin{center}
		{\fontsize{42pt}{42pt}\xinwei{\linespread{2.0}\selectfont \@title}}\par
		\zihao{1}
		\vspace{25mm}
	\end{center}
	\linespread{2.0}
	\begin{center}
		\zihao{-2}
		\begin{tabular}[b]{>{\songti}c >{\kaishu}c}
			% after \\: \hline or \cline{col1-col2} \cline{col3-col4} ...
			学生姓名：               & \coursework@tokens@studentName \\\cline{2-2}
			
			专\qquad 业：      & \coursework@tokens@major \\\cline{2-2}
			
			学\qquad 号 ：    & \coursework@tokens@studentID \\\cline{2-2}
			
			任课教师：                & \coursework@tokens@teacherName\\\cline{2-2}
		\end{tabular}\\
		\vspace{25mm}
		\heiti \zihao{2}
		\zihao{-2}
		\today
	\end{center}
	\kaishu
	%%%%%%%%%%%%%%%%%%%%%%%目录%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\newpage
	\pagenumbering{Roman}
	%\titlecontents{chapter}[0pt]{}
	%{\contentspush{\thecontentslabel\quad}}
	%{}{\titlerule*[5pt]{.}\contentspage}
	\titlecontents{section}[0em]{\songti}
	{\contentspush{\thecontentslabel\quad}}
	{}{\titlerule*[5pt]{.}\contentspage}
	
	\titlecontents{subsection}[2em]{}
	{\contentspush{\thecontentslabel\quad}}
	{}{\titlerule*[5pt]{.}\contentspage}
	\tableofcontents
	
	\clearpage
	\pagenumbering{arabic}
	\fancyfoot[C]{\zihao{-5} 第\thepage 页\quad 共\pageref*{LastPage} 页}	
}


% 保护脆落命令
\RequirePackage{cprotect}



\RequirePackage{booktabs}

\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%页面布局%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}
\geometry{top=25mm,bottom=25mm,left=25mm,right=25mm,headheight=23pt}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[zihao=-4,space,heading,scheme=chinese]{ctex}

\RequirePackage{natbib}%%参考文献相关
\linespread{1.5}
%%%%%%%%%%%%%%%%%%%各级标题格式设置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ctexset{
	section={
		format=\centering\zihao{4}\heiti,
		%        name={,.},
		name={\S},
		%indent=\parindent,
		beforeskip=1.5ex,
		afterskip=1ex,
	}
}

\ctexset{
	subsection={
		format=\zihao{-4}\heiti,
		%indent=\parindent,
		beforeskip=1ex,
		afterskip=0.5ex,
	}
}

\RequirePackage[dvipsnames]{xcolor}

%%%%%%%%%%%%%%%%%%%%%%%%%设置页眉%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{}
\fancyhead[L]{\includegraphics[width=3cm]{fig/csuLOGO.jpg}}
\fancyhead[R]{\kaishu \rightmark}
\renewcommand{\headrule}{\color{lightgray}\hrule width\headwidth height0.9pt}
\renewcommand{\headrulewidth}{3pt}

%%%%%%%%%%%%%交叉引用%%%%%%%%%%%%%%%%%%%
\RequirePackage[breaklinks=true]{hyperref}
%\usepackage{breakurl}
%[ocgcolorlinks]
\hypersetup{
	colorlinks=true,
	%menucolor=\color{violet},
	citecolor=red,
	%urlcolor=blue,
	linkcolor=OrangeRed,
	%  breaklinks=true,
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%图表标题%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}% 插入图片
\RequirePackage{caption}
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{minusfour}{\zihao{-4}}
\DeclareCaptionFont{figurefont}{\heiti\zihao{-4}}
\captionsetup[figure]{%
	format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
	labelsep=quad, % 分隔符是一个空格
	%font={song,minusfour}, % 图的字体, 宋体小四
	font=figurefont,%黑体五号
	position=bottom, % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
%	belowskip=0.5ex,
}
\captionsetup{skip=0pt,belowskip=0pt}
\captionsetup[table]{%
	format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
	labelsep=quad, % 分隔符是一个空格
	%font={song,minusfour}, % 表的字体, 宋体小四
	font=figurefont,%黑体五号
	position=top, % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
	belowskip=0pt,
}
%\renewcommand{\thefigure}{\thesection.\arabic{figure}}
%\renewcommand{\thetable}{\thesection.\arabic{table}}

\RequirePackage{float}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%公式%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
\RequirePackage{mathptmx}
\RequirePackage{esint}

%\numberwithin{equation}{section}
\makeatletter
\@addtoreset{equation}{section}
\makeatother
\renewcommand{\theequation}{\thesection-\arabic{equation}}


