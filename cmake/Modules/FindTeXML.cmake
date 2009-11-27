# The module defines the following variables:
#   TEXML_EXECUTABLE - path to texml command line executables
#   TEXML_FOUND - true if the command line executables were found
set (TEXML_COMPILER texml)

find_program (TEXML_EXECUTABLE
    NAMES texml
    PATHS /usr/bin
)
mark_as_advanced (TEXML_EXECUTABLE)

# Handle the QUIETLY and REQUIRED arguments and set TEXML_FOUND to TRUE if 
# all listed variables are TRUE
include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (TEXML DEFAULT_MSG TEXML_EXECUTABLE)
