# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 6.14-1 replay file
# Internal Version: 2014_06_04-20.37.49 134264
# Run by jl1908 on Tue Apr 24 12:24:14 2018
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=634.478759765625, 
    height=266.70556640625)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
from caeModules import *
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=ON)
o1 = session.openOdb(name='/home/jl1908/Downloads/HPC/Dump/CMSX4_9.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: /home/jl1908/Downloads/HPC/Dump/CMSX4_9.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     2
#: Number of Meshes:             2
#: Number of Element Sets:       8
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setProjection(projection=PARALLEL)
session.viewports['Viewport: 1'].view.setValues(session.views['Front'])
session.viewports['Viewport: 1'].odbDisplay.setValues(viewCut=ON)
session.viewports['Viewport: 1'].odbDisplay.setValues(viewCutNames=('Z-Plane', 
    ), viewCut=ON)
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    maxAutoCompute=OFF, maxValue=5000, minValue=1152.47)
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    maxValue=2000)
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    maxValue=5000)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV121', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    maxValue=1000, minValue=-0.983501)
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    maxAutoCompute=ON)
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    maxAutoCompute=OFF, maxValue=0.1)
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    maxValue=0.2)
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    maxValue=1.2)
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    maxValue=0.8)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
#: Warning: The user-specified Contour Max value must be greater than the auto-computed Contour Min value.
#: The user-specified Contour Max value has been reset to the auto-computed Contour Max value.
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=120)
session.viewports['Viewport: 1'].view.setValues(nearPlane=15.7197, 
    farPlane=26.4561, cameraPosition=(5.05981, -16.3186, 13.2038), 
    cameraUpVector=(0.283911, 0.624084, 0.727952), cameraTarget=(3.0435, 
    2.95043e-06, 1.43051e-06))
session.viewports['Viewport: 1'].view.setValues(nearPlane=16.0705, 
    farPlane=26.1053, cameraPosition=(22.8111, -7.22621, -1.31279), 
    cameraUpVector=(0.320088, 0.77719, 0.541775), cameraTarget=(3.04344, 
    -2.90871e-05, 5.28097e-05))
session.viewports['Viewport: 1'].view.setProjection(projection=PARALLEL)
session.viewports['Viewport: 1'].view.setValues(session.views['Front'])
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV109', outputPosition=INTEGRATION_POINT, )
