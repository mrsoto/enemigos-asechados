#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/src/distance-calculator.o \
	${OBJECTDIR}/src/main.o \
	${OBJECTDIR}/src/point-of-interest.o

# Test Directory
TESTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}/tests

# Test Files
TESTFILES= \
	${TESTDIR}/TestFiles/f1

# Test Object Files
TESTOBJECTFILES= \
	${TESTDIR}/tests/distance-calculator.test.o \
	${TESTDIR}/tests/main.test.o \
	${TESTDIR}/tests/point-of-interest.test.o

# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=-m64 --std=c++17 -pthread
CXXFLAGS=-m64 --std=c++17 -pthread

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/enemigosasechados

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/enemigosasechados: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/enemigosasechados ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/src/distance-calculator.o: src/distance-calculator.cpp
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -Wall -s -DDEBUG -Isrc -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/distance-calculator.o src/distance-calculator.cpp

${OBJECTDIR}/src/main.o: src/main.cpp
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -Wall -s -DDEBUG -Isrc -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/main.o src/main.cpp

${OBJECTDIR}/src/point-of-interest.o: src/point-of-interest.cpp
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -Wall -s -DDEBUG -Isrc -std=c++14 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/point-of-interest.o src/point-of-interest.cpp

# Subprojects
.build-subprojects:

# Build Test Targets
.build-tests-conf: .build-tests-subprojects .build-conf ${TESTFILES}
.build-tests-subprojects:

${TESTDIR}/TestFiles/f1: ${TESTDIR}/tests/distance-calculator.test.o ${TESTDIR}/tests/main.test.o ${TESTDIR}/tests/point-of-interest.test.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc} -o ${TESTDIR}/TestFiles/f1 $^ ${LDLIBSOPTIONS}   


${TESTDIR}/tests/distance-calculator.test.o: tests/distance-calculator.test.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -Wall -s -DDEBUG -Isrc -I. -std=c++14 -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/distance-calculator.test.o tests/distance-calculator.test.cpp


${TESTDIR}/tests/main.test.o: tests/main.test.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -Wall -s -DDEBUG -Isrc -I. -std=c++14 -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/main.test.o tests/main.test.cpp


${TESTDIR}/tests/point-of-interest.test.o: tests/point-of-interest.test.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -Wall -s -DDEBUG -Isrc -I. -std=c++14 -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/point-of-interest.test.o tests/point-of-interest.test.cpp


${OBJECTDIR}/src/distance-calculator_nomain.o: ${OBJECTDIR}/src/distance-calculator.o src/distance-calculator.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	@NMOUTPUT=`${NM} ${OBJECTDIR}/src/distance-calculator.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Wall -s -DDEBUG -Isrc -std=c++14 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/distance-calculator_nomain.o src/distance-calculator.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/src/distance-calculator.o ${OBJECTDIR}/src/distance-calculator_nomain.o;\
	fi

${OBJECTDIR}/src/main_nomain.o: ${OBJECTDIR}/src/main.o src/main.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	@NMOUTPUT=`${NM} ${OBJECTDIR}/src/main.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Wall -s -DDEBUG -Isrc -std=c++14 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/main_nomain.o src/main.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/main_nomain.o;\
	fi

${OBJECTDIR}/src/point-of-interest_nomain.o: ${OBJECTDIR}/src/point-of-interest.o src/point-of-interest.cpp 
	${MKDIR} -p ${OBJECTDIR}/src
	@NMOUTPUT=`${NM} ${OBJECTDIR}/src/point-of-interest.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -O2 -Wall -s -DDEBUG -Isrc -std=c++14 -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/point-of-interest_nomain.o src/point-of-interest.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/src/point-of-interest.o ${OBJECTDIR}/src/point-of-interest_nomain.o;\
	fi

# Run Test Targets
.test-conf:
	@if [ "${TEST}" = "" ]; \
	then  \
	    ${TESTDIR}/TestFiles/f1 || true; \
	else  \
	    ./${TEST} || true; \
	fi

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
