# The module defines the following variables:
#   LUATEX_EXECUTABLE - path to luatex command line executables
#   LUATEX_FOUND - true if the command line executables were found

find_program (LUATEX_EXECUTABLE luatex
    /usr/bin
)
mark_as_advanced (LUATEX_EXECUTABLE)

# Handle the QUIETLY and REQUIRED arguments and set LUATEX_FOUND to TRUE if 
# all listed variables are TRUE
include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (LUATEX DEFAULT_MSG LUATEX_EXECUTABLE)
