# Microsoft Developer Studio Generated NMAKE File, Based on testsuite.dsp
!IF "$(CFG)" == ""
CFG=testsuite - Win32 OnTheEdgeDebug
!MESSAGE No configuration specified. Defaulting to testsuite - Win32 OnTheEdgeDebug.
!ENDIF 

!IF "$(CFG)" != "testsuite - Win32 Release" && "$(CFG)" != "testsuite - Win32 Debug" && "$(CFG)" != "testsuite - Win32 OnTheEdgeDebug" && "$(CFG)" != "testsuite - Win32 OnTheEdgeRelease"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "testsuite.mak" CFG="testsuite - Win32 OnTheEdgeDebug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "testsuite - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "testsuite - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "testsuite - Win32 OnTheEdgeDebug" (based on "Win32 (x86) Console Application")
!MESSAGE "testsuite - Win32 OnTheEdgeRelease" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "testsuite - Win32 Release"

OUTDIR=.\build\Release
INTDIR=.\build\Release
# Begin Custom Macros
OutDir=.\build\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\testsuite.exe"

!ELSE 

ALL : "QuantLib - Win32 Release" "$(OUTDIR)\testsuite.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"QuantLib - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\barrieroption.obj"
	-@erase "$(INTDIR)\calendars.obj"
	-@erase "$(INTDIR)\capfloor.obj"
	-@erase "$(INTDIR)\compoundforward.obj"
	-@erase "$(INTDIR)\covariance.obj"
	-@erase "$(INTDIR)\dates.obj"
	-@erase "$(INTDIR)\daycounters.obj"
	-@erase "$(INTDIR)\distributions.obj"
	-@erase "$(INTDIR)\europeanoption.obj"
	-@erase "$(INTDIR)\instruments.obj"
	-@erase "$(INTDIR)\integrals.obj"
	-@erase "$(INTDIR)\lowdiscrepancysequences.obj"
	-@erase "$(INTDIR)\marketelements.obj"
	-@erase "$(INTDIR)\matrices.obj"
	-@erase "$(INTDIR)\mersennetwister.obj"
	-@erase "$(INTDIR)\old_pricers.obj"
	-@erase "$(INTDIR)\operators.obj"
	-@erase "$(INTDIR)\piecewiseflatforward.obj"
	-@erase "$(INTDIR)\qltestlistener.obj"
	-@erase "$(INTDIR)\quantlibtestsuite.obj"
	-@erase "$(INTDIR)\riskstats.obj"
	-@erase "$(INTDIR)\solvers.obj"
	-@erase "$(INTDIR)\stats.obj"
	-@erase "$(INTDIR)\swap.obj"
	-@erase "$(INTDIR)\swaption.obj"
	-@erase "$(INTDIR)\termstructures.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\testsuite.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MT /W3 /GR /GX /O2 /Ob2 /I "$(QL_DIR)" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "NOMINMAX" /Fp"$(INTDIR)\testsuite.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\testsuite.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=cppunit.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\testsuite.pdb" /machine:I386 /out:"$(OUTDIR)\testsuite.exe" /libpath:"$(QL_DIR)\lib\Win32\VisualStudio\\" 
LINK32_OBJS= \
	"$(INTDIR)\calendars.obj" \
	"$(INTDIR)\capfloor.obj" \
	"$(INTDIR)\compoundforward.obj" \
	"$(INTDIR)\covariance.obj" \
	"$(INTDIR)\dates.obj" \
	"$(INTDIR)\daycounters.obj" \
	"$(INTDIR)\distributions.obj" \
	"$(INTDIR)\europeanoption.obj" \
	"$(INTDIR)\instruments.obj" \
	"$(INTDIR)\integrals.obj" \
	"$(INTDIR)\lowdiscrepancysequences.obj" \
	"$(INTDIR)\marketelements.obj" \
	"$(INTDIR)\matrices.obj" \
	"$(INTDIR)\mersennetwister.obj" \
	"$(INTDIR)\old_pricers.obj" \
	"$(INTDIR)\operators.obj" \
	"$(INTDIR)\piecewiseflatforward.obj" \
	"$(INTDIR)\qltestlistener.obj" \
	"$(INTDIR)\quantlibtestsuite.obj" \
	"$(INTDIR)\riskstats.obj" \
	"$(INTDIR)\solvers.obj" \
	"$(INTDIR)\stats.obj" \
	"$(INTDIR)\swap.obj" \
	"$(INTDIR)\swaption.obj" \
	"$(INTDIR)\termstructures.obj" \
	"$(INTDIR)\barrieroption.obj" \
	"..\lib\Win32\VisualStudio\QuantLib.lib"

"$(OUTDIR)\testsuite.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "testsuite - Win32 Debug"

OUTDIR=.\build\Debug
INTDIR=.\build\Debug
# Begin Custom Macros
OutDir=.\build\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\testsuite.exe"

!ELSE 

ALL : "QuantLib - Win32 Debug" "$(OUTDIR)\testsuite.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"QuantLib - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\barrieroption.obj"
	-@erase "$(INTDIR)\calendars.obj"
	-@erase "$(INTDIR)\capfloor.obj"
	-@erase "$(INTDIR)\compoundforward.obj"
	-@erase "$(INTDIR)\covariance.obj"
	-@erase "$(INTDIR)\dates.obj"
	-@erase "$(INTDIR)\daycounters.obj"
	-@erase "$(INTDIR)\distributions.obj"
	-@erase "$(INTDIR)\europeanoption.obj"
	-@erase "$(INTDIR)\instruments.obj"
	-@erase "$(INTDIR)\integrals.obj"
	-@erase "$(INTDIR)\lowdiscrepancysequences.obj"
	-@erase "$(INTDIR)\marketelements.obj"
	-@erase "$(INTDIR)\matrices.obj"
	-@erase "$(INTDIR)\mersennetwister.obj"
	-@erase "$(INTDIR)\old_pricers.obj"
	-@erase "$(INTDIR)\operators.obj"
	-@erase "$(INTDIR)\piecewiseflatforward.obj"
	-@erase "$(INTDIR)\qltestlistener.obj"
	-@erase "$(INTDIR)\quantlibtestsuite.obj"
	-@erase "$(INTDIR)\riskstats.obj"
	-@erase "$(INTDIR)\solvers.obj"
	-@erase "$(INTDIR)\stats.obj"
	-@erase "$(INTDIR)\swap.obj"
	-@erase "$(INTDIR)\swaption.obj"
	-@erase "$(INTDIR)\termstructures.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\testsuite.exe"
	-@erase "$(OUTDIR)\testsuite.ilk"
	-@erase "$(OUTDIR)\testsuite.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /GR /GX /ZI /Od /I "$(QL_DIR)" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "NOMINMAX" /Fp"$(INTDIR)\testsuite.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\testsuite.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=cppunitd.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\testsuite.pdb" /debug /machine:I386 /out:"$(OUTDIR)\testsuite.exe" /pdbtype:sept /libpath:"$(QL_DIR)\lib\Win32\VisualStudio\\" 
LINK32_OBJS= \
	"$(INTDIR)\calendars.obj" \
	"$(INTDIR)\capfloor.obj" \
	"$(INTDIR)\compoundforward.obj" \
	"$(INTDIR)\covariance.obj" \
	"$(INTDIR)\dates.obj" \
	"$(INTDIR)\daycounters.obj" \
	"$(INTDIR)\distributions.obj" \
	"$(INTDIR)\europeanoption.obj" \
	"$(INTDIR)\instruments.obj" \
	"$(INTDIR)\integrals.obj" \
	"$(INTDIR)\lowdiscrepancysequences.obj" \
	"$(INTDIR)\marketelements.obj" \
	"$(INTDIR)\matrices.obj" \
	"$(INTDIR)\mersennetwister.obj" \
	"$(INTDIR)\old_pricers.obj" \
	"$(INTDIR)\operators.obj" \
	"$(INTDIR)\piecewiseflatforward.obj" \
	"$(INTDIR)\qltestlistener.obj" \
	"$(INTDIR)\quantlibtestsuite.obj" \
	"$(INTDIR)\riskstats.obj" \
	"$(INTDIR)\solvers.obj" \
	"$(INTDIR)\stats.obj" \
	"$(INTDIR)\swap.obj" \
	"$(INTDIR)\swaption.obj" \
	"$(INTDIR)\termstructures.obj" \
	"$(INTDIR)\barrieroption.obj" \
	"..\lib\Win32\VisualStudio\QuantLib_d.lib"

"$(OUTDIR)\testsuite.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "testsuite - Win32 OnTheEdgeDebug"

OUTDIR=.\build\OnTheEdgeDebug
INTDIR=.\build\OnTheEdgeDebug
# Begin Custom Macros
OutDir=.\build\OnTheEdgeDebug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\testsuite.exe"

!ELSE 

ALL : "QuantLib - Win32 OnTheEdgeDebug" "$(OUTDIR)\testsuite.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"QuantLib - Win32 OnTheEdgeDebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\barrieroption.obj"
	-@erase "$(INTDIR)\calendars.obj"
	-@erase "$(INTDIR)\capfloor.obj"
	-@erase "$(INTDIR)\compoundforward.obj"
	-@erase "$(INTDIR)\covariance.obj"
	-@erase "$(INTDIR)\dates.obj"
	-@erase "$(INTDIR)\daycounters.obj"
	-@erase "$(INTDIR)\distributions.obj"
	-@erase "$(INTDIR)\europeanoption.obj"
	-@erase "$(INTDIR)\instruments.obj"
	-@erase "$(INTDIR)\integrals.obj"
	-@erase "$(INTDIR)\lowdiscrepancysequences.obj"
	-@erase "$(INTDIR)\marketelements.obj"
	-@erase "$(INTDIR)\matrices.obj"
	-@erase "$(INTDIR)\mersennetwister.obj"
	-@erase "$(INTDIR)\old_pricers.obj"
	-@erase "$(INTDIR)\operators.obj"
	-@erase "$(INTDIR)\piecewiseflatforward.obj"
	-@erase "$(INTDIR)\qltestlistener.obj"
	-@erase "$(INTDIR)\quantlibtestsuite.obj"
	-@erase "$(INTDIR)\riskstats.obj"
	-@erase "$(INTDIR)\solvers.obj"
	-@erase "$(INTDIR)\stats.obj"
	-@erase "$(INTDIR)\swap.obj"
	-@erase "$(INTDIR)\swaption.obj"
	-@erase "$(INTDIR)\termstructures.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\testsuite.exe"
	-@erase "$(OUTDIR)\testsuite.ilk"
	-@erase "$(OUTDIR)\testsuite.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /GR /GX /ZI /Od /I "..\\" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "NOMINMAX" /Fp"$(INTDIR)\testsuite.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\testsuite.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=cppunitd.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\testsuite.pdb" /debug /machine:I386 /out:"$(OUTDIR)\testsuite.exe" /pdbtype:sept /libpath:"..\lib\Win32\VisualStudio\\" 
LINK32_OBJS= \
	"$(INTDIR)\calendars.obj" \
	"$(INTDIR)\capfloor.obj" \
	"$(INTDIR)\compoundforward.obj" \
	"$(INTDIR)\covariance.obj" \
	"$(INTDIR)\dates.obj" \
	"$(INTDIR)\daycounters.obj" \
	"$(INTDIR)\distributions.obj" \
	"$(INTDIR)\europeanoption.obj" \
	"$(INTDIR)\instruments.obj" \
	"$(INTDIR)\integrals.obj" \
	"$(INTDIR)\lowdiscrepancysequences.obj" \
	"$(INTDIR)\marketelements.obj" \
	"$(INTDIR)\matrices.obj" \
	"$(INTDIR)\mersennetwister.obj" \
	"$(INTDIR)\old_pricers.obj" \
	"$(INTDIR)\operators.obj" \
	"$(INTDIR)\piecewiseflatforward.obj" \
	"$(INTDIR)\qltestlistener.obj" \
	"$(INTDIR)\quantlibtestsuite.obj" \
	"$(INTDIR)\riskstats.obj" \
	"$(INTDIR)\solvers.obj" \
	"$(INTDIR)\stats.obj" \
	"$(INTDIR)\swap.obj" \
	"$(INTDIR)\swaption.obj" \
	"$(INTDIR)\termstructures.obj" \
	"$(INTDIR)\barrieroption.obj" \
	"..\lib\Win32\VisualStudio\QuantLib_d.lib"

"$(OUTDIR)\testsuite.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "testsuite - Win32 OnTheEdgeRelease"

OUTDIR=.\build\OnTheEdgeRelease
INTDIR=.\build\OnTheEdgeRelease
# Begin Custom Macros
OutDir=.\build\OnTheEdgeRelease
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\testsuite.exe"

!ELSE 

ALL : "QuantLib - Win32 OnTheEdgeRelease" "$(OUTDIR)\testsuite.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"QuantLib - Win32 OnTheEdgeReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\barrieroption.obj"
	-@erase "$(INTDIR)\calendars.obj"
	-@erase "$(INTDIR)\capfloor.obj"
	-@erase "$(INTDIR)\compoundforward.obj"
	-@erase "$(INTDIR)\covariance.obj"
	-@erase "$(INTDIR)\dates.obj"
	-@erase "$(INTDIR)\daycounters.obj"
	-@erase "$(INTDIR)\distributions.obj"
	-@erase "$(INTDIR)\europeanoption.obj"
	-@erase "$(INTDIR)\instruments.obj"
	-@erase "$(INTDIR)\integrals.obj"
	-@erase "$(INTDIR)\lowdiscrepancysequences.obj"
	-@erase "$(INTDIR)\marketelements.obj"
	-@erase "$(INTDIR)\matrices.obj"
	-@erase "$(INTDIR)\mersennetwister.obj"
	-@erase "$(INTDIR)\old_pricers.obj"
	-@erase "$(INTDIR)\operators.obj"
	-@erase "$(INTDIR)\piecewiseflatforward.obj"
	-@erase "$(INTDIR)\qltestlistener.obj"
	-@erase "$(INTDIR)\quantlibtestsuite.obj"
	-@erase "$(INTDIR)\riskstats.obj"
	-@erase "$(INTDIR)\solvers.obj"
	-@erase "$(INTDIR)\stats.obj"
	-@erase "$(INTDIR)\swap.obj"
	-@erase "$(INTDIR)\swaption.obj"
	-@erase "$(INTDIR)\termstructures.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\testsuite.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MT /W3 /GR /GX /O2 /Ob2 /I "..\\" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "NOMINMAX" /Fp"$(INTDIR)\testsuite.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\testsuite.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=cppunit.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /profile /machine:I386 /out:"$(OUTDIR)\testsuite.exe" /libpath:"..\lib\Win32\VisualStudio\\" 
LINK32_OBJS= \
	"$(INTDIR)\calendars.obj" \
	"$(INTDIR)\capfloor.obj" \
	"$(INTDIR)\compoundforward.obj" \
	"$(INTDIR)\covariance.obj" \
	"$(INTDIR)\dates.obj" \
	"$(INTDIR)\daycounters.obj" \
	"$(INTDIR)\distributions.obj" \
	"$(INTDIR)\europeanoption.obj" \
	"$(INTDIR)\instruments.obj" \
	"$(INTDIR)\integrals.obj" \
	"$(INTDIR)\lowdiscrepancysequences.obj" \
	"$(INTDIR)\marketelements.obj" \
	"$(INTDIR)\matrices.obj" \
	"$(INTDIR)\mersennetwister.obj" \
	"$(INTDIR)\old_pricers.obj" \
	"$(INTDIR)\operators.obj" \
	"$(INTDIR)\piecewiseflatforward.obj" \
	"$(INTDIR)\qltestlistener.obj" \
	"$(INTDIR)\quantlibtestsuite.obj" \
	"$(INTDIR)\riskstats.obj" \
	"$(INTDIR)\solvers.obj" \
	"$(INTDIR)\stats.obj" \
	"$(INTDIR)\swap.obj" \
	"$(INTDIR)\swaption.obj" \
	"$(INTDIR)\termstructures.obj" \
	"$(INTDIR)\barrieroption.obj" \
	"..\lib\Win32\VisualStudio\QuantLib.lib"

"$(OUTDIR)\testsuite.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("testsuite.dep")
!INCLUDE "testsuite.dep"
!ELSE 
!MESSAGE Warning: cannot find "testsuite.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "testsuite - Win32 Release" || "$(CFG)" == "testsuite - Win32 Debug" || "$(CFG)" == "testsuite - Win32 OnTheEdgeDebug" || "$(CFG)" == "testsuite - Win32 OnTheEdgeRelease"
SOURCE=.\barrieroption.cpp

"$(INTDIR)\barrieroption.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\calendars.cpp

"$(INTDIR)\calendars.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\capfloor.cpp

"$(INTDIR)\capfloor.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\compoundforward.cpp

"$(INTDIR)\compoundforward.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\covariance.cpp

"$(INTDIR)\covariance.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\dates.cpp

"$(INTDIR)\dates.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\daycounters.cpp

"$(INTDIR)\daycounters.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\distributions.cpp

"$(INTDIR)\distributions.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\europeanoption.cpp

"$(INTDIR)\europeanoption.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\instruments.cpp

"$(INTDIR)\instruments.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\integrals.cpp

"$(INTDIR)\integrals.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\lowdiscrepancysequences.cpp

"$(INTDIR)\lowdiscrepancysequences.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\marketelements.cpp

"$(INTDIR)\marketelements.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\matrices.cpp

"$(INTDIR)\matrices.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\mersennetwister.cpp

"$(INTDIR)\mersennetwister.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\old_pricers.cpp

"$(INTDIR)\old_pricers.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\operators.cpp

"$(INTDIR)\operators.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\piecewiseflatforward.cpp

"$(INTDIR)\piecewiseflatforward.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\qltestlistener.cpp

"$(INTDIR)\qltestlistener.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\quantlibtestsuite.cpp

"$(INTDIR)\quantlibtestsuite.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\riskstats.cpp

"$(INTDIR)\riskstats.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\solvers.cpp

"$(INTDIR)\solvers.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\stats.cpp

"$(INTDIR)\stats.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\swap.cpp

"$(INTDIR)\swap.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\swaption.cpp

"$(INTDIR)\swaption.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\termstructures.cpp

"$(INTDIR)\termstructures.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "testsuite - Win32 Release"

"QuantLib - Win32 Release" : 
   cd "\Projects\QuantLib"
   $(MAKE) /$(MAKEFLAGS) /F .\QuantLib.mak CFG="QuantLib - Win32 Release" 
   cd ".\test-suite"

"QuantLib - Win32 ReleaseCLEAN" : 
   cd "\Projects\QuantLib"
   $(MAKE) /$(MAKEFLAGS) /F .\QuantLib.mak CFG="QuantLib - Win32 Release" RECURSE=1 CLEAN 
   cd ".\test-suite"

!ELSEIF  "$(CFG)" == "testsuite - Win32 Debug"

"QuantLib - Win32 Debug" : 
   cd "\Projects\QuantLib"
   $(MAKE) /$(MAKEFLAGS) /F .\QuantLib.mak CFG="QuantLib - Win32 Debug" 
   cd ".\test-suite"

"QuantLib - Win32 DebugCLEAN" : 
   cd "\Projects\QuantLib"
   $(MAKE) /$(MAKEFLAGS) /F .\QuantLib.mak CFG="QuantLib - Win32 Debug" RECURSE=1 CLEAN 
   cd ".\test-suite"

!ELSEIF  "$(CFG)" == "testsuite - Win32 OnTheEdgeDebug"

"QuantLib - Win32 OnTheEdgeDebug" : 
   cd "\Projects\QuantLib"
   $(MAKE) /$(MAKEFLAGS) /F .\QuantLib.mak CFG="QuantLib - Win32 OnTheEdgeDebug" 
   cd ".\test-suite"

"QuantLib - Win32 OnTheEdgeDebugCLEAN" : 
   cd "\Projects\QuantLib"
   $(MAKE) /$(MAKEFLAGS) /F .\QuantLib.mak CFG="QuantLib - Win32 OnTheEdgeDebug" RECURSE=1 CLEAN 
   cd ".\test-suite"

!ELSEIF  "$(CFG)" == "testsuite - Win32 OnTheEdgeRelease"

"QuantLib - Win32 OnTheEdgeRelease" : 
   cd "\Projects\QuantLib"
   $(MAKE) /$(MAKEFLAGS) /F .\QuantLib.mak CFG="QuantLib - Win32 OnTheEdgeRelease" 
   cd ".\test-suite"

"QuantLib - Win32 OnTheEdgeReleaseCLEAN" : 
   cd "\Projects\QuantLib"
   $(MAKE) /$(MAKEFLAGS) /F .\QuantLib.mak CFG="QuantLib - Win32 OnTheEdgeRelease" RECURSE=1 CLEAN 
   cd ".\test-suite"

!ENDIF 


!ENDIF 

