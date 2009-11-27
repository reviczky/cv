# The module defines the following variables:
#   TEXLIVE_EXECUTABLE - path to texlive command line executables
#   TEXLIVE_FOUND - true if the command line executables were found

set (CONTEXT_COMPILER texexec)
set (CONTEXT_ENGINE luatex)

find_program (TEXLIVE_EXECUTABLE texexec
    /usr/bin
)
mark_as_advanced (TEXLIVE_EXECUTABLE)

# Handle the QUIETLY and REQUIRED arguments and set TEXLIVE_FOUND to TRUE if 
# all listed variables are TRUE
include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (TEXLIVE DEFAULT_MSG TEXLIVE_EXECUTABLE)
