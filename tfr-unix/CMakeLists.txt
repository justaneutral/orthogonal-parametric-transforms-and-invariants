cmake_minimum_required(VERSION 3.15...3.25)

project(fullproc
  VERSION
    1.0
  DESCRIPTION
    "Orthonormal matrix fast transform. The matrix squizes a parametrically defined cyclical shift invariant of a vector to a delta impulse"
  LANGUAGES
    C
    CXX
)
include(CheckLibraryExists)

CHECK_LIBRARY_EXISTS(m sin "" HAVE_LIB_M)                                                                                                
                                                                                                                                         
if (HAVE_LIB_M)                                                                                                                          
    set(EXTRA_LIBS ${EXTRA_LIBS} m)                                                                                                      
endif (HAVE_LIB_M)

add_executable(fullproc FULLPROC.C DEK.C  GENBAF.C  GENBAF.htm  GENYAD.C  OPER.C  orig-c-src  papers  QTOSC.C  TFR.C)

target_link_libraries(fullproc PUBLIC ${EXTRA_LIBS})
