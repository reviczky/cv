# dependencies
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

find_package (XZ REQUIRED)
if (NOT XZ_FOUND)
    message (FATAL_ERROR "This project depends on xz-utils (www.tukaani.org/xz).\nInstall xz-utils or set the PATH variable to point to the executables.")
endif (NOT XZ_FOUND)

# building project
ADD_CUSTOM_COMMAND(
    OUTPUT		${CMAKE_BINARY_DIR}/src/cv.pdf
    DEPENDS		${CMAKE_BINARY_DIR}/src/cv.xml
    COMMAND		${TEXML_COMPILER} -e utf8 -c
    ARGS		${CMAKE_SOURCE_DIR}/src/cv.xml
    ARGS		${CMAKE_SOURCE_DIR}/src/cv.tex
    COMMAND		${CONTEXT_COMPILER} --engine=${CONTEXT_ENGINE} --silent
    ARGS		${CMAKE_SOURCE_DIR}/src/cv.tex
    COMMENT		"Generating PDF file"
)

ADD_CUSTOM_TARGET(ConTeXt ALL echo
    DEPENDS		${CMAKE_BINARY_DIR}/src/cv.pdf
)
