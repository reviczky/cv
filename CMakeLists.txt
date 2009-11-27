# CMake version requirement
CMAKE_MINIMUM_REQUIRED (VERSION 2.8)

# Project name
project (cv)

# Required dependencies
set (CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")
find_package (TeXML REQUIRED)
if (NOT TEXML_FOUND)
    message (FATAL_ERROR "This project depends on TeXML (www.getfo.org).\nInstall TeXML or set the PATH variable to point to the executables.")
endif (NOT TEXML_FOUND)

find_package (TeXLive REQUIRED)
if (NOT TEXLIVE_FOUND)
    message (FATAL_ERROR "This project depends on TeXLive (www.tug.org/texlive).\nInstall TeXLive or set the PATH variable to point to the executables.")
endif (NOT TEXLIVE_FOUND)

find_package (LuaTeX REQUIRED)
if (NOT LUATEX_FOUND)
    message (FATAL_ERROR "This project depends on LuaTeX (www.luatex.org).\nInstall LuaTeX or set the PATH variable to point to the executables.")
endif (NOT LUATEX_FOUND)

# Building project
ADD_CUSTOM_COMMAND(
    OUTPUT		${cv_BINARY_DIR}/cv.pdf
    DEPENDS		${cv_BINARY_DIR}/cv.xml
    COMMAND		${TEXML_COMPILER} -e utf8 -c
    ARGS		${cv_SOURCE_DIR}/cv.xml
    ARGS		${cv_SOURCE_DIR}/cv.tex
    COMMAND		${CONTEXT_COMPILER} --engine=${CONTEXT_ENGINE} --silent
    ARGS		${cv_SOURCE_DIR}/cv.tex
    COMMENT		"Generating PDF file"
)

ADD_CUSTOM_TARGET(ConTeXt ALL echo
    DEPENDS		${cv_BINARY_DIR}/cv.pdf
)
