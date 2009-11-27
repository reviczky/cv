# The module defines the following variables:
#   XZ_EXECUTABLE - path to xz-utils command line executables
#   XZ_FOUND - true if the command line executables were found
set (XZ_COMPRESSOR xz)

find_program (XZ_EXECUTABLE
    NAMES xz unxz xzcat xzcmp xzdec xzdiff xzegrep xzfgrep xzgrep xzless xzmore
    PATHS /usr/bin
)
mark_as_advanced (XZ_EXECUTABLE)

# Handle the QUIETLY and REQUIRED arguments and set XZ_FOUND to TRUE if 
# all listed variables are TRUE
include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (XZ DEFAULT_MSG XZ_EXECUTABLE)
