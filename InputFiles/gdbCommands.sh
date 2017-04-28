gdb --args ~/projects/EColi/EColi-dbg -i ~/projects/EColi/InputFiles/SingleElementElastic.i
set logging file GDBlog.log
set logging on
set print array on

#===================
b MooseApp::run
# b MooseApp::setupOptions()
b MooseApp::runInputFile
b ActionWarehouse::executeAllActions
b MooseApp::executeExecutioner
b ActionWarehouse::executeActionsWithAction
b Executioner::Executioner
b Transient::Transient
