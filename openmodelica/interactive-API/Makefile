TEST = ../../rtest -v

TESTFILES = \
ArraySlicing.mos \
Bug2871.mos \
Bug2943.mos \
Bug2882.mos \
Bug3269_deleteFile.mos \
Bug3282.mos \
ConvertUnits.mos \
choicesAllMatching.mos \
DefaultComponentName.mos \
DeleteConnection.mos \
DialogAnnotation.mos \
FlagParsing.mos \
ForStatement1.mos \
ForStatement2.mos \
ForStatement3.mos \
ForStatement4.mos \
ForStatement5fail.mos \
ForStatement6.mos \
ForStatement7.mos \
ForStatement8.mos \
getDialogAnnotation.mos \
IfStatementIllegal.mos \
IfStatement.mos\
interactive_api_annotations.mos \
interactive_api_attributes.mos \
interactive_api_calls.mos \
interactive_api_classes.mos \
interactive_api_loadsave.mos \
interactive_api_param.mos \
interactive_api_simulations.mos \
interactive_test.mos \
ListAnnotation.mos \
ListExpressions.mos \
ListMultilineComment.mos \
loadFileInteractiveQualified.mos \
matrices.mos \
Modelica.Media.Examples.getComponents.mos \
ProtectedHandlingBug2917.mos \
refactorGraphAnn1.mos \
refactorGraphAnn2.mos \
regex.mos \
Rename.mos \
RunScript.mos \
saveTotalModel.mos \
setComponentComment.mos \
setComponentModifierValue.mos \
showDoc.mos \
simplify.mos \
stringSplit.mos \
strings.mos  \
variables.mos \

# test that currently fail. Move up when fixed.
# Run make testfailing
FAILINGTESTFILES=differentiate.mos

# Dependency files that are not .mo .mos or Makefile
# Add them here or they will be cleaned.
DEPENDENCIES = \
*.mo \
*.mos \
Makefile


CLEAN = `ls | grep -w -v -f deps.tmp`

.PHONY : test clean getdeps failingtest

test:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES)

# Cleans all files that are not listed as dependencies
clean :
	@echo $(DEPENDENCIES) | sed 's/ /\\|/g' > deps.tmp
	@rm -f $(CLEAN)

# Run this if you want to list out the files (dependencies).
# do it after cleaning and updating the folder
# then you can get a list of file names (which must be dependencies
# since you got them from repository + your own new files)
# then add them to the DEPENDENCIES. You can find the
# list in deps.txt
getdeps:
	@echo $(DEPENDENCIES) | sed 's/ /\\|/g' > deps.tmp
	@echo $(CLEAN) | sed -r 's/deps.txt|deps.tmp//g' | sed 's/ / \\\n/g' > deps.txt
	@echo Dependency list saved in deps.txt.
	@echo Copy the list from deps.txt and add it to the Makefile @DEPENDENCIES

failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
