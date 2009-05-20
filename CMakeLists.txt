# CMake version requirement
CMAKE_MINIMUM_REQUIRED (VERSION 2.6)

# project name
PROJECT (cv)

SET (CONTEXT_COMPILER texexec)
SET (CONTEXT_ENGINE luatex)

IF(CONTEXT_COMPILER)
    ADD_CUSTOM_COMMAND(
	OUTPUT		${cv_BINARY_DIR}/TDocument.pdf
	DEPENDS		${cv_BINARY_DIR}/TDocument.tex
	COMMAND		${CONTEXT_COMPILER} --engine=${CONTEXT_ENGINE} --silent
	ARGS		${cv_SOURCE_DIR}/TDocument.tex
	COMMENT		"Generating ConTeXt PDF file"
    )

    ADD_CUSTOM_TARGET(ConTeXt ALL echo
	DEPENDS		${cv_BINARY_DIR}/TDocument.pdf
    )
ENDIF(CONTEXT_COMPILER)
