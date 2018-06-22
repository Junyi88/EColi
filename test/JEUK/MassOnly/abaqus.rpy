# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 6.14-1 replay file
# Internal Version: 2014_06_04-20.37.49 134264
# Run by jl1908 on Fri Apr 20 09:31:34 2018
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
o1 = session.openOdb(name='/home/jl1908/Downloads/HPC/Dump/CMSX4_6.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: /home/jl1908/Downloads/HPC/Dump/CMSX4_6.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     2
#: Number of Meshes:             2
#: Number of Element Sets:       7
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(session.views['Bottom'])
session.viewports['Viewport: 1'].view.setProjection(projection=PARALLEL)
session.viewports['Viewport: 1'].odbDisplay.setValues(viewCut=ON)
session.viewports['Viewport: 1'].odbDisplay.setValues(viewCut=OFF)
session.viewports['Viewport: 1'].odbDisplay.setValues(viewCut=ON)
session.viewports['Viewport: 1'].odbDisplay.setValues(viewCut=OFF)
session.viewports['Viewport: 1'].odbDisplay.setValues(viewCut=ON)
session.viewports['Viewport: 1'].odbDisplay.setValues(viewCutNames=('Y-Plane', 
    ), viewCut=ON)
session.viewports['Viewport: 1'].odbDisplay.viewCuts['Y-Plane'].setValues(
    motion=ROTATE)
session.viewports['Viewport: 1'].odbDisplay.viewCuts['Y-Plane'].setValues(
    angle=180)
session.viewports['Viewport: 1'].view.setValues(nearPlane=16.935, 
    farPlane=24.8073, width=10.8896, height=6.65066, cameraPosition=(2.78529, 
    -20.8712, 0.0134443), cameraTarget=(2.78529, 0, 0.0134443))
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    DEFORMED, ))
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    maxAutoCompute=OFF, maxValue=74674.1, minAutoCompute=OFF, minValue=95.7919)
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    maxValue=14674.1)
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    maxValue=24674.1)
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    maxValue=34674.1)
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    outsideLimitsMode=SPECTRUM)
session.viewports['Viewport: 1'].view.setValues(nearPlane=17.0584, 
    farPlane=24.6839, width=9.45351, height=5.77361, cameraPosition=(2.6035, 
    -20.8712, 0.0576703), cameraTarget=(2.6035, 0, 0.0576703))
session.viewports['Viewport: 1'].odbDisplay.commonOptions.setValues(
    visibleEdges=FREE)
session.viewports['Viewport: 1'].odbDisplay.commonOptions.setValues(
    visibleEdges=NONE)
session.viewports['Viewport: 1'].odbDisplay.viewCuts['Y-Plane'].setValues(
    motion=TRANSLATE)
session.viewports['Viewport: 1'].odbDisplay.viewCuts['Y-Plane'].setValues(
    position=-0.12)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV121', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.contourOptions.setValues(
    maxAutoCompute=ON, minAutoCompute=ON)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=147)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=147)
session.viewports['Viewport: 1'].view.setValues(nearPlane=17.0906, 
    farPlane=24.6517, width=9.07915, height=5.54498, cameraPosition=(2.57896, 
    -20.8712, 0.110551), cameraTarget=(2.57896, 0, 0.110551))
o1 = session.openOdb(name='/home/jl1908/Downloads/HPC/Dump/QuaterFullTie.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: /home/jl1908/Downloads/HPC/Dump/QuaterFullTie.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          9
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
o1 = session.openOdb(name='/home/jl1908/Downloads/HPC/Dump/QuaterFullTie.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
session.viewports['Viewport: 1'].view.setValues(width=17.4711, height=10.6702, 
    cameraPosition=(16.9646, 17.0526, 13.3479), cameraTarget=(2.44292, 2.53087, 
    -1.17379))
o1 = session.openOdb(name='/home/jl1908/Downloads/HPC/Dump/B02_Cali2.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: /home/jl1908/Downloads/HPC/Dump/B02_Cali2.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       1058
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(session.views['Front'])
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV26', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV1', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV2', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV3', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV4', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV5', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV6', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV57', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV59', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV58', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV60', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV89', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV88', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV87', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV32', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV42', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV56', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV57', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV56', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV54', outputPosition=INTEGRATION_POINT, )
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=56)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=37)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=20)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=15)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=12)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=15)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=19)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=23)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=24)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV57', outputPosition=INTEGRATION_POINT, )
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=0)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=1)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV56', outputPosition=INTEGRATION_POINT, )
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=52)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=73)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV58', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV57', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV60', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV61', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV70', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV67', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV1', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV7', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV56', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV55', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV54', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV89', outputPosition=INTEGRATION_POINT, )
session.odbs['/home/jl1908/Downloads/HPC/Dump/CMSX4_6.odb'].close()
session.odbs['/home/jl1908/Downloads/HPC/Dump/QuaterFullTie.odb'].close()
odb = session.odbs['/home/jl1908/Downloads/HPC/Dump/B02_Cali2.odb']
xy0 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Spatial displacement: U1 at Node 48324 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy1 = abs(xy0)
xy_result = session.XYData(name='XYData-1', objectToCopy=xy1, 
    sourceDescription='abs(Spatial displacement: U1 at Node 48324 in NSET A_RIGHT)')
c1 = session.Curve(xyData=xy_result)
xyp = session.XYPlot('XYPlot-1')
chartName = xyp.charts.keys()[0]
chart = xyp.charts[chartName]
chart.setValues(curvesToPlot=(c1, ), )
session.viewports['Viewport: 1'].setValues(displayedObject=xyp)
odb = session.odbs['/home/jl1908/Downloads/HPC/Dump/B02_Cali2.odb']
xy0 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48324 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy1 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48325 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy2 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48326 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy3 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48327 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy4 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48328 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy5 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48329 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy6 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48330 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy7 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48331 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy8 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48332 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy9 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48333 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy10 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48334 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy11 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48335 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy12 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48336 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy13 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48337 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy14 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48338 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy15 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48339 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy16 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48340 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy17 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48341 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy18 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48342 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy19 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48343 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy20 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48344 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy21 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48345 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy22 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48346 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy23 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48347 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy24 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48348 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy25 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48349 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy26 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48350 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy27 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48351 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy28 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48352 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy29 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48353 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy30 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48354 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy31 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48355 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy32 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48356 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy33 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48357 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy34 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48358 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy35 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48359 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy36 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48360 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy37 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48361 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy38 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48362 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy39 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48363 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy40 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48364 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy41 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48365 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy42 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48366 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy43 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48367 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy44 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48368 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy45 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48369 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy46 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48370 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy47 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48371 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy48 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48372 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy49 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48373 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy50 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48374 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy51 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48375 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy52 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48376 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy53 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48377 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy54 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48378 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy55 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48379 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy56 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48380 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy57 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48381 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy58 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48382 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy59 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48383 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy60 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48384 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy61 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48385 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy62 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48386 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy63 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48387 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy64 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48388 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy65 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48389 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy66 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48390 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy67 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48391 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy68 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48392 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy69 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48393 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy70 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48394 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy71 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48395 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy72 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48396 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy73 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48397 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy74 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48398 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy75 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48399 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy76 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48400 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy77 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48401 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy78 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48402 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy79 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48403 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy80 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48404 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy81 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48405 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy82 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48406 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy83 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48407 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy84 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48408 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy85 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48409 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy86 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48410 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy87 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48411 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy88 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48412 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy89 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48413 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy90 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48414 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy91 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48415 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy92 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48416 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy93 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48417 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy94 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48418 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy95 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48419 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy96 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48420 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy97 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48421 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy98 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48422 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy99 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48423 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy100 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48424 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy101 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48425 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy102 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48426 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy103 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48427 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy104 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48428 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy105 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48429 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy106 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48430 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy107 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48431 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy108 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48432 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy109 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48433 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy110 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48434 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy111 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48435 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy112 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48436 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy113 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48437 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy114 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48438 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy115 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48439 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy116 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48440 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy117 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48441 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy118 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48442 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy119 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48443 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy120 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48444 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy121 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48445 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy122 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48446 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy123 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48447 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy124 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48448 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy125 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48449 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy126 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48450 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy127 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48451 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy128 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48452 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy129 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48453 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy130 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48454 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy131 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48455 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy132 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48456 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy133 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48457 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy134 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48458 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy135 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48459 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy136 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48460 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy137 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48461 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy138 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48462 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy139 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48463 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy140 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48464 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy141 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48465 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy142 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48466 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy143 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48467 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy144 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48468 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy145 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48469 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy146 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48470 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy147 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48471 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy148 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48472 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy149 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48473 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy150 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48474 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy151 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48475 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy152 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48476 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy153 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48477 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy154 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48478 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy155 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48479 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy156 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48480 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy157 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48481 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy158 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48482 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy159 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48483 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy160 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48484 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy161 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48485 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy162 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48486 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy163 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48487 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy164 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48488 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy165 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48489 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy166 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48490 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy167 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48491 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy168 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48492 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy169 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48493 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy170 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48494 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy171 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48495 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy172 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48496 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy173 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48497 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy174 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48498 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy175 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48499 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy176 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48500 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy177 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48501 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy178 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48502 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy179 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48503 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy180 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48504 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy181 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48505 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy182 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48506 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy183 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48507 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy184 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48508 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy185 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48509 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy186 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48510 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy187 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48511 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy188 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48512 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy189 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48513 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy190 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 48514 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy191 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96838 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy192 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96839 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy193 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96840 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy194 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96841 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy195 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96842 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy196 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96843 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy197 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96844 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy198 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96845 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy199 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96846 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy200 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96847 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy201 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96848 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy202 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96849 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy203 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96850 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy204 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96851 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy205 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96852 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy206 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96853 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy207 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96854 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy208 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96855 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy209 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96856 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy210 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96857 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy211 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96858 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy212 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96859 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy213 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96860 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy214 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96861 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy215 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96862 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy216 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96863 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy217 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96864 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy218 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96865 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy219 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96866 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy220 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96867 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy221 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96868 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy222 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96869 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy223 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96870 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy224 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96871 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy225 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96872 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy226 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96873 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy227 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96874 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy228 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96875 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy229 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96876 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy230 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96877 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy231 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96878 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy232 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96879 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy233 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96880 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy234 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96881 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy235 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96882 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy236 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96883 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy237 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96884 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy238 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96885 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy239 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96886 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy240 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96887 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy241 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96888 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy242 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96889 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy243 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96890 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy244 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96891 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy245 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96892 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy246 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96893 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy247 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96894 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy248 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96895 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy249 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96896 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy250 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96897 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy251 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96898 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy252 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96899 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy253 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96900 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy254 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96901 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy255 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96902 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy256 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96903 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy257 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96904 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy258 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96905 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy259 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96906 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy260 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96907 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy261 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96908 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy262 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96909 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy263 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96910 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy264 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96911 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy265 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96912 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy266 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96913 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy267 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96914 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy268 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96915 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy269 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96916 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy270 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96917 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy271 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96918 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy272 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96919 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy273 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96920 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy274 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96921 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy275 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96922 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy276 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96923 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy277 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96924 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy278 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96925 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy279 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96926 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy280 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96927 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy281 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96928 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy282 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96929 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy283 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96930 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy284 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96931 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy285 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96932 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy286 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96933 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy287 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96934 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy288 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96935 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy289 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96936 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy290 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96937 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy291 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96938 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy292 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96939 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy293 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96940 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy294 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96941 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy295 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96942 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy296 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96943 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy297 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96944 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy298 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96945 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy299 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96946 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy300 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96947 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy301 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96948 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy302 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96949 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy303 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96950 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy304 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96951 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy305 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96952 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy306 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96953 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy307 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96954 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy308 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96955 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy309 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96956 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy310 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96957 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy311 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96958 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy312 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96959 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy313 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96960 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy314 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96961 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy315 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96962 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy316 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96963 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy317 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96964 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy318 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96965 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy319 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96966 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy320 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96967 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy321 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96968 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy322 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96969 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy323 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96970 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy324 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96971 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy325 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96972 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy326 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96973 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy327 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96974 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy328 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96975 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy329 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96976 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy330 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96977 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy331 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96978 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy332 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96979 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy333 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96980 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy334 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96981 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy335 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96982 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy336 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96983 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy337 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96984 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy338 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96985 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy339 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96986 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy340 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96987 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy341 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96988 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy342 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96989 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy343 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96990 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy344 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96991 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy345 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96992 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy346 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96993 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy347 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96994 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy348 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96995 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy349 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96996 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy350 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96997 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy351 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96998 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy352 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 96999 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy353 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97000 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy354 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97001 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy355 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97002 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy356 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97003 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy357 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97004 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy358 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97005 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy359 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97006 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy360 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97007 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy361 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97008 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy362 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97009 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy363 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97010 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy364 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97011 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy365 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97012 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy366 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97013 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy367 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97014 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy368 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97015 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy369 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97016 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy370 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97017 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy371 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97018 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy372 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97019 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy373 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97020 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy374 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97021 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy375 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97022 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy376 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97023 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy377 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97024 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy378 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97025 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy379 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97026 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy380 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97027 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy381 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 97028 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy382 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145352 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy383 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145353 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy384 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145354 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy385 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145355 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy386 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145356 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy387 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145357 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy388 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145358 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy389 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145359 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy390 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145360 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy391 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145361 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy392 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145362 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy393 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145363 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy394 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145364 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy395 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145365 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy396 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145366 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy397 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145367 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy398 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145368 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy399 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145369 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy400 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145370 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy401 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145371 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy402 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145372 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy403 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145373 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy404 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145374 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy405 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145375 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy406 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145376 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy407 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145377 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy408 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145378 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy409 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145379 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy410 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145380 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy411 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145381 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy412 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145382 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy413 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145383 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy414 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145384 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy415 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145385 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy416 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145386 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy417 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145387 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy418 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145388 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy419 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145389 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy420 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145390 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy421 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145391 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy422 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145392 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy423 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145393 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy424 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145394 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy425 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145395 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy426 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145396 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy427 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145397 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy428 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145398 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy429 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145399 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy430 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145400 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy431 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145401 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy432 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145402 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy433 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145403 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy434 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145404 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy435 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145405 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy436 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145406 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy437 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145407 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy438 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145408 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy439 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145409 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy440 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145410 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy441 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145411 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy442 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145412 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy443 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145413 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy444 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145414 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy445 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145415 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy446 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145416 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy447 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145417 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy448 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145418 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy449 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145419 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy450 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145420 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy451 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145421 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy452 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145422 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy453 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145423 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy454 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145424 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy455 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145425 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy456 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145426 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy457 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145427 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy458 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145428 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy459 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145429 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy460 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145430 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy461 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145431 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy462 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145432 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy463 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145433 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy464 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145434 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy465 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145435 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy466 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145436 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy467 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145437 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy468 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145438 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy469 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145439 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy470 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145440 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy471 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145441 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy472 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145442 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy473 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145443 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy474 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145444 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy475 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145445 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy476 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145446 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy477 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145447 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy478 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145448 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy479 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145449 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy480 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145450 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy481 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145451 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy482 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145452 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy483 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145453 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy484 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145454 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy485 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145455 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy486 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145456 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy487 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145457 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy488 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145458 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy489 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145459 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy490 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145460 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy491 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145461 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy492 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145462 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy493 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145463 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy494 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145464 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy495 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145465 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy496 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145466 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy497 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145467 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy498 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145468 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy499 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145469 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy500 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145470 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy501 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145471 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy502 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145472 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy503 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145473 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy504 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145474 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy505 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145475 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy506 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145476 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy507 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145477 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy508 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145478 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy509 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145479 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy510 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145480 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy511 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145481 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy512 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145482 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy513 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145483 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy514 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145484 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy515 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145485 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy516 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145486 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy517 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145487 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy518 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145488 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy519 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145489 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy520 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145490 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy521 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145491 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy522 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145492 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy523 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145493 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy524 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145494 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy525 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145495 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy526 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145496 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy527 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145497 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy528 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145498 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy529 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145499 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy530 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145500 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy531 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145501 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy532 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145502 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy533 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145503 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy534 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145504 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy535 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145505 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy536 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145506 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy537 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145507 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy538 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145508 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy539 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145509 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy540 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145510 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy541 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145511 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy542 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145512 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy543 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145513 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy544 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145514 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy545 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145515 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy546 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145516 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy547 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145517 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy548 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145518 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy549 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145519 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy550 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145520 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy551 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145521 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy552 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145522 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy553 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145523 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy554 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145524 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy555 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145525 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy556 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145526 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy557 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145527 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy558 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145528 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy559 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145529 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy560 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145530 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy561 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145531 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy562 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145532 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy563 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145533 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy564 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145534 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy565 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145535 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy566 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145536 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy567 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145537 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy568 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145538 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy569 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145539 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy570 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145540 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy571 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145541 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy572 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 145542 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy573 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193866 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy574 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193867 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy575 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193868 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy576 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193869 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy577 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193870 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy578 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193871 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy579 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193872 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy580 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193873 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy581 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193874 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy582 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193875 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy583 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193876 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy584 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193877 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy585 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193878 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy586 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193879 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy587 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193880 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy588 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193881 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy589 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193882 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy590 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193883 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy591 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193884 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy592 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193885 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy593 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193886 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy594 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193887 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy595 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193888 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy596 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193889 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy597 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193890 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy598 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193891 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy599 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193892 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy600 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193893 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy601 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193894 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy602 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193895 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy603 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193896 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy604 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193897 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy605 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193898 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy606 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193899 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy607 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193900 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy608 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193901 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy609 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193902 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy610 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193903 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy611 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193904 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy612 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193905 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy613 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193906 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy614 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193907 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy615 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193908 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy616 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193909 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy617 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193910 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy618 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193911 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy619 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193912 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy620 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193913 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy621 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193914 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy622 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193915 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy623 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193916 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy624 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193917 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy625 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193918 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy626 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193919 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy627 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193920 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy628 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193921 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy629 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193922 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy630 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193923 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy631 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193924 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy632 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193925 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy633 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193926 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy634 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193927 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy635 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193928 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy636 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193929 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy637 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193930 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy638 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193931 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy639 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193932 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy640 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193933 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy641 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193934 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy642 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193935 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy643 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193936 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy644 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193937 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy645 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193938 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy646 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193939 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy647 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193940 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy648 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193941 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy649 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193942 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy650 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193943 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy651 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193944 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy652 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193945 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy653 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193946 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy654 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193947 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy655 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193948 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy656 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193949 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy657 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193950 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy658 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193951 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy659 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193952 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy660 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193953 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy661 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193954 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy662 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193955 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy663 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193956 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy664 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193957 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy665 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193958 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy666 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193959 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy667 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193960 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy668 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193961 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy669 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193962 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy670 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193963 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy671 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193964 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy672 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193965 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy673 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193966 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy674 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193967 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy675 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193968 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy676 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193969 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy677 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193970 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy678 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193971 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy679 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193972 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy680 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193973 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy681 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193974 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy682 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193975 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy683 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193976 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy684 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193977 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy685 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193978 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy686 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193979 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy687 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193980 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy688 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193981 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy689 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193982 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy690 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193983 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy691 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193984 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy692 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193985 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy693 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193986 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy694 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193987 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy695 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193988 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy696 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193989 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy697 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193990 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy698 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193991 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy699 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193992 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy700 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193993 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy701 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193994 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy702 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193995 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy703 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193996 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy704 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193997 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy705 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193998 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy706 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 193999 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy707 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194000 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy708 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194001 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy709 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194002 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy710 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194003 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy711 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194004 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy712 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194005 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy713 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194006 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy714 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194007 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy715 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194008 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy716 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194009 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy717 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194010 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy718 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194011 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy719 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194012 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy720 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194013 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy721 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194014 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy722 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194015 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy723 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194016 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy724 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194017 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy725 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194018 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy726 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194019 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy727 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194020 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy728 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194021 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy729 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194022 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy730 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194023 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy731 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194024 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy732 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194025 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy733 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194026 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy734 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194027 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy735 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194028 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy736 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194029 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy737 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194030 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy738 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194031 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy739 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194032 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy740 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194033 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy741 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194034 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy742 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194035 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy743 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194036 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy744 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194037 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy745 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194038 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy746 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194039 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy747 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194040 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy748 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194041 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy749 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194042 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy750 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194043 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy751 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194044 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy752 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194045 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy753 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194046 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy754 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194047 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy755 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194048 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy756 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194049 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy757 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194050 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy758 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194051 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy759 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194052 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy760 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194053 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy761 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194054 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy762 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194055 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy763 = xyPlot.XYDataFromHistory(odb=odb, 
    outputVariableName='Reaction force: RF1 at Node 194056 in NSET A_RIGHT', 
    steps=('Step-1', ), suppressQuery=True)
xy764 = sum((xy0, xy1, xy2, xy3, xy4, xy5, xy6, xy7, xy8, xy9, xy10, xy11, 
    xy12, xy13, xy14, xy15, xy16, xy17, xy18, xy19, xy20, xy21, xy22, xy23, 
    xy24, xy25, xy26, xy27, xy28, xy29, xy30, xy31, xy32, xy33, xy34, xy35, 
    xy36, xy37, xy38, xy39, xy40, xy41, xy42, xy43, xy44, xy45, xy46, xy47, 
    xy48, xy49, xy50, xy51, xy52, xy53, xy54, xy55, xy56, xy57, xy58, xy59, 
    xy60, xy61, xy62, xy63, xy64, xy65, xy66, xy67, xy68, xy69, xy70, xy71, 
    xy72, xy73, xy74, xy75, xy76, xy77, xy78, xy79, xy80, xy81, xy82, xy83, 
    xy84, xy85, xy86, xy87, xy88, xy89, xy90, xy91, xy92, xy93, xy94, xy95, 
    xy96, xy97, xy98, xy99, xy100, xy101, xy102, xy103, xy104, xy105, xy106, 
    xy107, xy108, xy109, xy110, xy111, xy112, xy113, xy114, xy115, xy116, 
    xy117, xy118, xy119, xy120, xy121, xy122, xy123, xy124, xy125, xy126, 
    xy127, xy128, xy129, xy130, xy131, xy132, xy133, xy134, xy135, xy136, 
    xy137, xy138, xy139, xy140, xy141, xy142, xy143, xy144, xy145, xy146, 
    xy147, xy148, xy149, xy150, xy151, xy152, xy153, xy154, xy155, xy156, 
    xy157, xy158, xy159, xy160, xy161, xy162, xy163, xy164, xy165, xy166, 
    xy167, xy168, xy169, xy170, xy171, xy172, xy173, xy174, xy175, xy176, 
    xy177, xy178, xy179, xy180, xy181, xy182, xy183, xy184, xy185, xy186, 
    xy187, xy188, xy189, xy190, xy191, xy192, xy193, xy194, xy195, xy196, 
    xy197, xy198, xy199, xy200, xy201, xy202, xy203, xy204, xy205, xy206, 
    xy207, xy208, xy209, xy210, xy211, xy212, xy213, xy214, xy215, xy216, 
    xy217, xy218, xy219, xy220, xy221, xy222, xy223, xy224, xy225, xy226, 
    xy227, xy228, xy229, xy230, xy231, xy232, xy233, xy234, xy235, xy236, 
    xy237, xy238, xy239, xy240, xy241, xy242, xy243, xy244, xy245, xy246, 
    xy247, xy248, xy249, xy250, xy251, xy252, xy253, xy254, xy255, xy256, 
    xy257, xy258, xy259, xy260, xy261, xy262, xy263, xy264, xy265, xy266, 
    xy267, xy268, xy269, xy270, xy271, xy272, xy273, xy274, xy275, xy276, 
    xy277, xy278, xy279, xy280, xy281, xy282, xy283, xy284, xy285, xy286, 
    xy287, xy288, xy289, xy290, xy291, xy292, xy293, xy294, xy295, xy296, 
    xy297, xy298, xy299, xy300, xy301, xy302, xy303, xy304, xy305, xy306, 
    xy307, xy308, xy309, xy310, xy311, xy312, xy313, xy314, xy315, xy316, 
    xy317, xy318, xy319, xy320, xy321, xy322, xy323, xy324, xy325, xy326, 
    xy327, xy328, xy329, xy330, xy331, xy332, xy333, xy334, xy335, xy336, 
    xy337, xy338, xy339, xy340, xy341, xy342, xy343, xy344, xy345, xy346, 
    xy347, xy348, xy349, xy350, xy351, xy352, xy353, xy354, xy355, xy356, 
    xy357, xy358, xy359, xy360, xy361, xy362, xy363, xy364, xy365, xy366, 
    xy367, xy368, xy369, xy370, xy371, xy372, xy373, xy374, xy375, xy376, 
    xy377, xy378, xy379, xy380, xy381, xy382, xy383, xy384, xy385, xy386, 
    xy387, xy388, xy389, xy390, xy391, xy392, xy393, xy394, xy395, xy396, 
    xy397, xy398, xy399, xy400, xy401, xy402, xy403, xy404, xy405, xy406, 
    xy407, xy408, xy409, xy410, xy411, xy412, xy413, xy414, xy415, xy416, 
    xy417, xy418, xy419, xy420, xy421, xy422, xy423, xy424, xy425, xy426, 
    xy427, xy428, xy429, xy430, xy431, xy432, xy433, xy434, xy435, xy436, 
    xy437, xy438, xy439, xy440, xy441, xy442, xy443, xy444, xy445, xy446, 
    xy447, xy448, xy449, xy450, xy451, xy452, xy453, xy454, xy455, xy456, 
    xy457, xy458, xy459, xy460, xy461, xy462, xy463, xy464, xy465, xy466, 
    xy467, xy468, xy469, xy470, xy471, xy472, xy473, xy474, xy475, xy476, 
    xy477, xy478, xy479, xy480, xy481, xy482, xy483, xy484, xy485, xy486, 
    xy487, xy488, xy489, xy490, xy491, xy492, xy493, xy494, xy495, xy496, 
    xy497, xy498, xy499, xy500, xy501, xy502, xy503, xy504, xy505, xy506, 
    xy507, xy508, xy509, xy510, xy511, xy512, xy513, xy514, xy515, xy516, 
    xy517, xy518, xy519, xy520, xy521, xy522, xy523, xy524, xy525, xy526, 
    xy527, xy528, xy529, xy530, xy531, xy532, xy533, xy534, xy535, xy536, 
    xy537, xy538, xy539, xy540, xy541, xy542, xy543, xy544, xy545, xy546, 
    xy547, xy548, xy549, xy550, xy551, xy552, xy553, xy554, xy555, xy556, 
    xy557, xy558, xy559, xy560, xy561, xy562, xy563, xy564, xy565, xy566, 
    xy567, xy568, xy569, xy570, xy571, xy572, xy573, xy574, xy575, xy576, 
    xy577, xy578, xy579, xy580, xy581, xy582, xy583, xy584, xy585, xy586, 
    xy587, xy588, xy589, xy590, xy591, xy592, xy593, xy594, xy595, xy596, 
    xy597, xy598, xy599, xy600, xy601, xy602, xy603, xy604, xy605, xy606, 
    xy607, xy608, xy609, xy610, xy611, xy612, xy613, xy614, xy615, xy616, 
    xy617, xy618, xy619, xy620, xy621, xy622, xy623, xy624, xy625, xy626, 
    xy627, xy628, xy629, xy630, xy631, xy632, xy633, xy634, xy635, xy636, 
    xy637, xy638, xy639, xy640, xy641, xy642, xy643, xy644, xy645, xy646, 
    xy647, xy648, xy649, xy650, xy651, xy652, xy653, xy654, xy655, xy656, 
    xy657, xy658, xy659, xy660, xy661, xy662, xy663, xy664, xy665, xy666, 
    xy667, xy668, xy669, xy670, xy671, xy672, xy673, xy674, xy675, xy676, 
    xy677, xy678, xy679, xy680, xy681, xy682, xy683, xy684, xy685, xy686, 
    xy687, xy688, xy689, xy690, xy691, xy692, xy693, xy694, xy695, xy696, 
    xy697, xy698, xy699, xy700, xy701, xy702, xy703, xy704, xy705, xy706, 
    xy707, xy708, xy709, xy710, xy711, xy712, xy713, xy714, xy715, xy716, 
    xy717, xy718, xy719, xy720, xy721, xy722, xy723, xy724, xy725, xy726, 
    xy727, xy728, xy729, xy730, xy731, xy732, xy733, xy734, xy735, xy736, 
    xy737, xy738, xy739, xy740, xy741, xy742, xy743, xy744, xy745, xy746, 
    xy747, xy748, xy749, xy750, xy751, xy752, xy753, xy754, xy755, xy756, 
    xy757, xy758, xy759, xy760, xy761, xy762, xy763, ), )
xy_result = session.XYData(name='XYData-2', objectToCopy=xy764, 
    sourceDescription='sum((Reaction force: RF1 at Node 48324 in NSET A_RIGHT, Reaction force: RF1 at Node 48325 in NSET A_RIGHT, Reaction force: RF1 at Node 48326 in NSET A_RIGHT, Reaction force: RF1 at Node 48327 in NSET A_RIGHT, Reaction force: RF1 at Node 48328 in NSET A_RIGHT, Reaction force: RF1 at Node 48329 in NSET A_RIGHT, Reaction force: RF1 at Node 48330 in NSET A_RIGHT, Reaction force: RF1 at Node 48331 in NSET A_RIGHT, Reaction force: RF1 at Node 48332 in NSET A_RIGHT, Reaction force: RF1 at Node 48333 in NSET A_RIGHT, Reaction force: RF1 at Node 48334 in NSET A_RIGHT, Reaction force: RF1 at Node 48335 in NSET A_RIGHT, Reaction force: RF1 at Node 48336 in NSET A_RIGHT, Reaction force: RF1 at Node 48337 in NSET A_RIGHT, Reaction force: RF1 at Node 48338 in NSET A_RIGHT, Reaction force: RF1 at Node 48339 in NSET A_RIGHT, Reaction force: RF1 at Node 48340 in NSET A_RIGHT, Reaction force: RF1 at Node 48341 in NSET A_RIGHT, Reaction force: RF1 at Node 48342 in NSET A_RIGHT, Reaction force: RF1 at Node 48343 in NSET A_RIGHT, Reaction force: RF1 at Node 48344 in NSET A_RIGHT, Reaction force: RF1 at Node 48345 in NSET A_RIGHT, Reaction force: RF1 at Node 48346 in NSET A_RIGHT, Reaction force: RF1 at Node 48347 in NSET A_RIGHT, Reaction force: RF1 at Node 48348 in NSET A_RIGHT, Reaction force: RF1 at Node 48349 in NSET A_RIGHT, Reaction force: RF1 at Node 48350 in NSET A_RIGHT, Reaction force: RF1 at Node 48351 in NSET A_RIGHT, Reaction force: RF1 at Node 48352 in NSET A_RIGHT, Reaction force: RF1 at Node 48353 in NSET A_RIGHT, Reaction force: RF1 at Node 48354 in NSET A_RIGHT, Reaction force: RF1 at Node 48355 in NSET A_RIGHT, Reaction force: RF1 at Node 48356 in NSET A_RIGHT, Reaction force: RF1 at Node 48357 in NSET A_RIGHT, Reaction force: RF1 at Node 48358 in NSET A_RIGHT, Reaction force: RF1 at Node 48359 in NSET A_RIGHT, Reaction force: RF1 at Node 48360 in NSET A_RIGHT, Reaction force: RF1 at Node 48361 in NSET A_RIGHT, Reaction force: RF1 at Node 48362 in NSET A_RIGHT, Reaction force: RF1 at Node 48363 in NSET A_RIGHT, Reaction force: RF1 at Node 48364 in NSET A_RIGHT, Reaction force: RF1 at Node 48365 in NSET A_RIGHT, Reaction force: RF1 at Node 48366 in NSET A_RIGHT, Reaction force: RF1 at Node 48367 in NSET A_RIGHT, Reaction force: RF1 at Node 48368 in NSET A_RIGHT, Reaction force: RF1 at Node 48369 in NSET A_RIGHT, Reaction force: RF1 at Node 48370 in NSET A_RIGHT, Reaction force: RF1 at Node 48371 in NSET A_RIGHT, Reaction force: RF1 at Node 48372 in NSET A_RIGHT, Reaction force: RF1 at Node 48373 in NSET A_RIGHT, Reaction force: RF1 at Node 48374 in NSET A_RIGHT, Reaction force: RF1 at Node 48375 in NSET A_RIGHT, Reaction force: RF1 at Node 48376 in NSET A_RIGHT, Reaction force: RF1 at Node 48377 in NSET A_RIGHT, Reaction force: RF1 at Node 48378 in NSET A_RIGHT, Reaction force: RF1 at Node 48379 in NSET A_RIGHT, Reaction force: RF1 at Node 48380 in NSET A_RIGHT, Reaction force: RF1 at Node 48381 in NSET A_RIGHT, Reaction force: RF1 at Node 48382 in NSET A_RIGHT, Reaction force: RF1 at Node 48383 in NSET A_RIGHT, Reaction force: RF1 at Node 48384 in NSET A_RIGHT, Reaction force: RF1 at Node 48385 in NSET A_RIGHT, Reaction force: RF1 at Node 48386 in NSET A_RIGHT, Reaction force: RF1 at Node 48387 in NSET A_RIGHT, Reaction force: RF1 at Node 48388 in NSET A_RIGHT, Reaction force: RF1 at Node 48389 in NSET A_RIGHT, Reaction force: RF1 at Node 48390 in NSET A_RIGHT, Reaction force: RF1 at Node 48391 in NSET A_RIGHT, Reaction force: RF1 at Node 48392 in NSET A_RIGHT, Reaction force: RF1 at Node 48393 in NSET A_RIGHT, Reaction force: RF1 at Node 48394 in NSET A_RIGHT, Reaction force: RF1 at Node 48395 in NSET A_RIGHT, Reaction force: RF1 at Node 48396 in NSET A_RIGHT, Reaction force: RF1 at Node 48397 in NSET A_RIGHT, Reaction force: RF1 at Node 48398 in NSET A_RIGHT, Reaction force: RF1 at Node 48399 in NSET A_RIGHT, Reaction force: RF1 at Node 48400 in NSET A_RIGHT, Reaction force: RF1 at Node 48401 in NSET A_RIGHT, Reaction force: RF1 at Node 48402 in NSET A_RIGHT, Reaction force: RF1 at Node 48403 in NSET A_RIGHT, Reaction force: RF1 at Node 48404 in NSET A_RIGHT, Reaction force: RF1 at Node 48405 in NSET A_RIGHT, Reaction force: RF1 at Node 48406 in NSET A_RIGHT, Reaction force: RF1 at Node 48407 in NSET A_RIGHT, Reaction force: RF1 at Node 48408 in NSET A_RIGHT, Reaction force: RF1 at Node 48409 in NSET A_RIGHT, Reaction force: RF1 at Node 48410 in NSET A_RIGHT, Reaction force: RF1 at Node 48411 in NSET A_RIGHT, Reaction force: RF1 at Node 48412 in NSET A_RIGHT, Reaction force: RF1 at Node 48413 in NSET A_RIGHT, Reaction force: RF1 at Node 48414 in NSET A_RIGHT, Reaction force: RF1 at Node 48415 in NSET A_RIGHT, Reaction force: RF1 at Node 48416 in NSET A_RIGHT, Reaction force: RF1 at Node 48417 in NSET A_RIGHT, Reaction force: RF1 at Node 48418 in NSET A_RIGHT, Reaction force: RF1 at Node 48419 in NSET A_RIGHT, Reaction force: RF1 at Node 48420 in NSET A_RIGHT, Reaction force: RF1 at Node 48421 in NSET A_RIGHT, Reaction force: RF1 at Node 48422 in NSET A_RIGHT, Reaction force: RF1 at Node 48423 in NSET A_RIGHT, Reaction force: RF1 at Node 48424 in NSET A_RIGHT, Reaction force: RF1 at Node 48425 in NSET A_RIGHT, Reaction force: RF1 at Node 48426 in NSET A_RIGHT, Reaction force: RF1 at Node 48427 in NSET A_RIGHT, Reaction force: RF1 at Node 48428 in NSET A_RIGHT, Reaction force: RF1 at Node 48429 in NSET A_RIGHT, Reaction force: RF1 at Node 48430 in NSET A_RIGHT, Reaction force: RF1 at Node 48431 in NSET A_RIGHT, Reaction force: RF1 at Node 48432 in NSET A_RIGHT, Reaction force: RF1 at Node 48433 in NSET A_RIGHT, Reaction force: RF1 at Node 48434 in NSET A_RIGHT, Reaction force: RF1 at Node 48435 in NSET A_RIGHT, Reaction force: RF1 at Node 48436 in NSET A_RIGHT, Reaction force: RF1 at Node 48437 in NSET A_RIGHT, Reaction force: RF1 at Node 48438 in NSET A_RIGHT, Reaction force: RF1 at Node 48439 in NSET A_RIGHT, Reaction force: RF1 at Node 48440 in NSET A_RIGHT, Reaction force: RF1 at Node 48441 in NSET A_RIGHT, Reaction force: RF1 at Node 48442 in NSET A_RIGHT, Reaction force: RF1 at Node 48443 in NSET A_RIGHT, Reaction force: RF1 at Node 48444 in NSET A_RIGHT, Reaction force: RF1 at Node 48445 in NSET A_RIGHT, Reaction force: RF1 at Node 48446 in NSET A_RIGHT, Reaction force: RF1 at Node 48447 in NSET A_RIGHT, Reaction force: RF1 at Node 48448 in NSET A_RIGHT, Reaction force: RF1 at Node 48449 in NSET A_RIGHT, Reaction force: RF1 at Node 48450 in NSET A_RIGHT, Reaction force: RF1 at Node 48451 in NSET A_RIGHT, Reaction force: RF1 at Node 48452 in NSET A_RIGHT, Reaction force: RF1 at Node 48453 in NSET A_RIGHT, Reaction force: RF1 at Node 48454 in NSET A_RIGHT, Reaction force: RF1 at Node 48455 in NSET A_RIGHT, Reaction force: RF1 at Node 48456 in NSET A_RIGHT, Reaction force: RF1 at Node 48457 in NSET A_RIGHT, Reaction force: RF1 at Node 48458 in NSET A_RIGHT, Reaction force: RF1 at Node 48459 in NSET A_RIGHT, Reaction force: RF1 at Node 48460 in NSET A_RIGHT, Reaction force: RF1 at Node 48461 in NSET A_RIGHT, Reaction force: RF1 at Node 48462 in NSET A_RIGHT, Reaction force: RF1 at Node 48463 in NSET A_RIGHT, Reaction force: RF1 at Node 48464 in NSET A_RIGHT, Reaction force: RF1 at Node 48465 in NSET A_RIGHT, Reaction force: RF1 at Node 48466 in NSET A_RIGHT, Reaction force: RF1 at Node 48467 in NSET A_RIGHT, Reaction force: RF1 at Node 48468 in NSET A_RIGHT, Reaction force: RF1 at Node 48469 in NSET A_RIGHT, Reaction force: RF1 at Node 48470 in NSET A_RIGHT, Reaction force: RF1 at Node 48471 in NSET A_RIGHT, Reaction force: RF1 at Node 48472 in NSET A_RIGHT, Reaction force: RF1 at Node 48473 in NSET A_RIGHT, Reaction force: RF1 at Node 48474 in NSET A_RIGHT, Reaction force: RF1 at Node 48475 in NSET A_RIGHT, Reaction force: RF1 at Node 48476 in NSET A_RIGHT, Reaction force: RF1 at Node 48477 in NSET A_RIGHT, Reaction force: RF1 at Node 48478 in NSET A_RIGHT, Reaction force: RF1 at Node 48479 in NSET A_RIGHT, Reaction force: RF1 at Node 48480 in NSET A_RIGHT, Reaction force: RF1 at Node 48481 in NSET A_RIGHT, Reaction force: RF1 at Node 48482 in NSET A_RIGHT, Reaction force: RF1 at Node 48483 in NSET A_RIGHT, Reaction force: RF1 at Node 48484 in NSET A_RIGHT, Reaction force: RF1 at Node 48485 in NSET A_RIGHT, Reaction force: RF1 at Node 48486 in NSET A_RIGHT, Reaction force: RF1 at Node 48487 in NSET A_RIGHT, Reaction force: RF1 at Node 48488 in NSET A_RIGHT, Reaction force: RF1 at Node 48489 in NSET A_RIGHT, Reaction force: RF1 at Node 48490 in NSET A_RIGHT, Reaction force: RF1 at Node 48491 in NSET A_RIGHT, Reaction force: RF1 at Node 48492 in NSET A_RIGHT, Reaction force: RF1 at Node 48493 in NSET A_RIGHT, Reaction force: RF1 at Node 48494 in NSET A_RIGHT, Reaction force: RF1 at Node 48495 in NSET A_RIGHT, Reaction force: RF1 at Node 48496 in NSET A_RIGHT, Reaction force: RF1 at Node 48497 in NSET A_RIGHT, Reaction force: RF1 at Node 48498 in NSET A_RIGHT, Reaction force: RF1 at Node 48499 in NSET A_RIGHT, Reaction force: RF1 at Node 48500 in NSET A_RIGHT, Reaction force: RF1 at Node 48501 in NSET A_RIGHT, Reaction force: RF1 at Node 48502 in NSET A_RIGHT, Reaction force: RF1 at Node 48503 in NSET A_RIGHT, Reaction force: RF1 at Node 48504 in NSET A_RIGHT, Reaction force: RF1 at Node 48505 in NSET A_RIGHT, Reaction force: RF1 at Node 48506 in NSET A_RIGHT, Reaction force: RF1 at Node 48507 in NSET A_RIGHT, Reaction force: RF1 at Node 48508 in NSET A_RIGHT, Reaction force: RF1 at Node 48509 in NSET A_RIGHT, Reaction force: RF1 at Node 48510 in NSET A_RIGHT, Reaction force: RF1 at Node 48511 in NSET A_RIGHT, Reaction force: RF1 at Node 48512 in NSET A_RIGHT, Reaction force: RF1 at Node 48513 in NSET A_RIGHT, Reaction force: RF1 at Node 48514 in NSET A_RIGHT, Reaction force: RF1 at Node 96838 in NSET A_RIGHT, Reaction force: RF1 at Node 96839 in NSET A_RIGHT, Reaction force: RF1 at Node 96840 in NSET A_RIGHT, Reaction force: RF1 at Node 96841 in NSET A_RIGHT, Reaction force: RF1 at Node 96842 in NSET A_RIGHT, Reaction force: RF1 at Node 96843 in NSET A_RIGHT, Reaction force: RF1 at Node 96844 in NSET A_RIGHT, Reaction force: RF1 at Node 96845 in NSET A_RIGHT, Reaction force: RF1 at Node 96846 in NSET A_RIGHT, Reaction force: RF1 at Node 96847 in NSET A_RIGHT, Reaction force: RF1 at Node 96848 in NSET A_RIGHT, Reaction force: RF1 at Node 96849 in NSET A_RIGHT, Reaction force: RF1 at Node 96850 in NSET A_RIGHT, Reaction force: RF1 at Node 96851 in NSET A_RIGHT, Reaction force: RF1 at Node 96852 in NSET A_RIGHT, Reaction force: RF1 at Node 96853 in NSET A_RIGHT, Reaction force: RF1 at Node 96854 in NSET A_RIGHT, Reaction force: RF1 at Node 96855 in NSET A_RIGHT, Reaction force: RF1 at Node 96856 in NSET A_RIGHT, Reaction force: RF1 at Node 96857 in NSET A_RIGHT, Reaction force: RF1 at Node 96858 in NSET A_RIGHT, Reaction force: RF1 at Node 96859 in NSET A_RIGHT, Reaction force: RF1 at Node 96860 in NSET A_RIGHT, Reaction force: RF1 at Node 96861 in NSET A_RIGHT, Reaction force: RF1 at Node 96862 in NSET A_RIGHT, Reaction force: RF1 at Node 96863 in NSET A_RIGHT, Reaction force: RF1 at Node 96864 in NSET A_RIGHT, Reaction force: RF1 at Node 96865 in NSET A_RIGHT, Reaction force: RF1 at Node 96866 in NSET A_RIGHT, Reaction force: RF1 at Node 96867 in NSET A_RIGHT, Reaction force: RF1 at Node 96868 in NSET A_RIGHT, Reaction force: RF1 at Node 96869 in NSET A_RIGHT, Reaction force: RF1 at Node 96870 in NSET A_RIGHT, Reaction force: RF1 at Node 96871 in NSET A_RIGHT, Reaction force: RF1 at Node 96872 in NSET A_RIGHT, Reaction force: RF1 at Node 96873 in NSET A_RIGHT, Reaction force: RF1 at Node 96874 in NSET A_RIGHT, Reaction force: RF1 at Node 96875 in NSET A_RIGHT, Reaction force: RF1 at Node 96876 in NSET A_RIGHT, Reaction force: RF1 at Node 96877 in NSET A_RIGHT, Reaction force: RF1 at Node 96878 in NSET A_RIGHT, Reaction force: RF1 at Node 96879 in NSET A_RIGHT, Reaction force: RF1 at Node 96880 in NSET A_RIGHT, Reaction force: RF1 at Node 96881 in NSET A_RIGHT, Reaction force: RF1 at Node 96882 in NSET A_RIGHT, Reaction force: RF1 at Node 96883 in NSET A_RIGHT, Reaction force: RF1 at Node 96884 in NSET A_RIGHT, Reaction force: RF1 at Node 96885 in NSET A_RIGHT, Reaction force: RF1 at Node 96886 in NSET A_RIGHT, Reaction force: RF1 at Node 96887 in NSET A_RIGHT, Reaction force: RF1 at Node 96888 in NSET A_RIGHT, Reaction force: RF1 at Node 96889 in NSET A_RIGHT, Reaction force: RF1 at Node 96890 in NSET A_RIGHT, Reaction force: RF1 at Node 96891 in NSET A_RIGHT, Reaction force: RF1 at Node 96892 in NSET A_RIGHT, Reaction force: RF1 at Node 96893 in NSET A_RIGHT, Reaction force: RF1 at Node 96894 in NSET A_RIGHT, Reaction force: RF1 at Node 96895 in NSET A_RIGHT, Reaction force: RF1 at Node 96896 in NSET A_RIGHT, Reaction force: RF1 at Node 96897 in NSET A_RIGHT, Reaction force: RF1 at Node 96898 in NSET A_RIGHT, Reaction force: RF1 at Node 96899 in NSET A_RIGHT, Reaction force: RF1 at Node 96900 in NSET A_RIGHT, Reaction force: RF1 at Node 96901 in NSET A_RIGHT, Reaction force: RF1 at Node 96902 in NSET A_RIGHT, Reaction force: RF1 at Node 96903 in NSET A_RIGHT, Reaction force: RF1 at Node 96904 in NSET A_RIGHT, Reaction force: RF1 at Node 96905 in NSET A_RIGHT, Reaction force: RF1 at Node 96906 in NSET A_RIGHT, Reaction force: RF1 at Node 96907 in NSET A_RIGHT, Reaction force: RF1 at Node 96908 in NSET A_RIGHT, Reaction force: RF1 at Node 96909 in NSET A_RIGHT, Reaction force: RF1 at Node 96910 in NSET A_RIGHT, Reaction force: RF1 at Node 96911 in NSET A_RIGHT, Reaction force: RF1 at Node 96912 in NSET A_RIGHT, Reaction force: RF1 at Node 96913 in NSET A_RIGHT, Reaction force: RF1 at Node 96914 in NSET A_RIGHT, Reaction force: RF1 at Node 96915 in NSET A_RIGHT, Reaction force: RF1 at Node 96916 in NSET A_RIGHT, Reaction force: RF1 at Node 96917 in NSET A_RIGHT, Reaction force: RF1 at Node 96918 in NSET A_RIGHT, Reaction force: RF1 at Node 96919 in NSET A_RIGHT, Reaction force: RF1 at Node 96920 in NSET A_RIGHT, Reaction force: RF1 at Node 96921 in NSET A_RIGHT, Reaction force: RF1 at Node 96922 in NSET A_RIGHT, Reaction force: RF1 at Node 96923 in NSET A_RIGHT, Reaction force: RF1 at Node 96924 in NSET A_RIGHT, Reaction force: RF1 at Node 96925 in NSET A_RIGHT, Reaction force: RF1 at Node 96926 in NSET A_RIGHT, Reaction force: RF1 at Node 96927 in NSET A_RIGHT, Reaction force: RF1 at Node 96928 in NSET A_RIGHT, Reaction force: RF1 at Node 96929 in NSET A_RIGHT, Reaction force: RF1 at Node 96930 in NSET A_RIGHT, Reaction force: RF1 at Node 96931 in NSET A_RIGHT, Reaction force: RF1 at Node 96932 in NSET A_RIGHT, Reaction force: RF1 at Node 96933 in NSET A_RIGHT, Reaction force: RF1 at Node 96934 in NSET A_RIGHT, Reaction force: RF1 at Node 96935 in NSET A_RIGHT, Reaction force: RF1 at Node 96936 in NSET A_RIGHT, Reaction force: RF1 at Node 96937 in NSET A_RIGHT, Reaction force: RF1 at Node 96938 in NSET A_RIGHT, Reaction force: RF1 at Node 96939 in NSET A_RIGHT, Reaction force: RF1 at Node 96940 in NSET A_RIGHT, Reaction force: RF1 at Node 96941 in NSET A_RIGHT, Reaction force: RF1 at Node 96942 in NSET A_RIGHT, Reaction force: RF1 at Node 96943 in NSET A_RIGHT, Reaction force: RF1 at Node 96944 in NSET A_RIGHT, Reaction force: RF1 at Node 96945 in NSET A_RIGHT, Reaction force: RF1 at Node 96946 in NSET A_RIGHT, Reaction force: RF1 at Node 96947 in NSET A_RIGHT, Reaction force: RF1 at Node 96948 in NSET A_RIGHT, Reaction force: RF1 at Node 96949 in NSET A_RIGHT, Reaction force: RF1 at Node 96950 in NSET A_RIGHT, Reaction force: RF1 at Node 96951 in NSET A_RIGHT, Reaction force: RF1 at Node 96952 in NSET A_RIGHT, Reaction force: RF1 at Node 96953 in NSET A_RIGHT, Reaction force: RF1 at Node 96954 in NSET A_RIGHT, Reaction force: RF1 at Node 96955 in NSET A_RIGHT, Reaction force: RF1 at Node 96956 in NSET A_RIGHT, Reaction force: RF1 at Node 96957 in NSET A_RIGHT, Reaction force: RF1 at Node 96958 in NSET A_RIGHT, Reaction force: RF1 at Node 96959 in NSET A_RIGHT, Reaction force: RF1 at Node 96960 in NSET A_RIGHT, Reaction force: RF1 at Node 96961 in NSET A_RIGHT, Reaction force: RF1 at Node 96962 in NSET A_RIGHT, Reaction force: RF1 at Node 96963 in NSET A_RIGHT, Reaction force: RF1 at Node 96964 in NSET A_RIGHT, Reaction force: RF1 at Node 96965 in NSET A_RIGHT, Reaction force: RF1 at Node 96966 in NSET A_RIGHT, Reaction force: RF1 at Node 96967 in NSET A_RIGHT, Reaction force: RF1 at Node 96968 in NSET A_RIGHT, Reaction force: RF1 at Node 96969 in NSET A_RIGHT, Reaction force: RF1 at Node 96970 in NSET A_RIGHT, Reaction force: RF1 at Node 96971 in NSET A_RIGHT, Reaction force: RF1 at Node 96972 in NSET A_RIGHT, Reaction force: RF1 at Node 96973 in NSET A_RIGHT, Reaction force: RF1 at Node 96974 in NSET A_RIGHT, Reaction force: RF1 at Node 96975 in NSET A_RIGHT, Reaction force: RF1 at Node 96976 in NSET A_RIGHT, Reaction force: RF1 at Node 96977 in NSET A_RIGHT, Reaction force: RF1 at Node 96978 in NSET A_RIGHT, Reaction force: RF1 at Node 96979 in NSET A_RIGHT, Reaction force: RF1 at Node 96980 in NSET A_RIGHT, Reaction force: RF1 at Node 96981 in NSET A_RIGHT, Reaction force: RF1 at Node 96982 in NSET A_RIGHT, Reaction force: RF1 at Node 96983 in NSET A_RIGHT, Reaction force: RF1 at Node 96984 in NSET A_RIGHT, Reaction force: RF1 at Node 96985 in NSET A_RIGHT, Reaction force: RF1 at Node 96986 in NSET A_RIGHT, Reaction force: RF1 at Node 96987 in NSET A_RIGHT, Reaction force: RF1 at Node 96988 in NSET A_RIGHT, Reaction force: RF1 at Node 96989 in NSET A_RIGHT, Reaction force: RF1 at Node 96990 in NSET A_RIGHT, Reaction force: RF1 at Node 96991 in NSET A_RIGHT, Reaction force: RF1 at Node 96992 in NSET A_RIGHT, Reaction force: RF1 at Node 96993 in NSET A_RIGHT, Reaction force: RF1 at Node 96994 in NSET A_RIGHT, Reaction force: RF1 at Node 96995 in NSET A_RIGHT, Reaction force: RF1 at Node 96996 in NSET A_RIGHT, Reaction force: RF1 at Node 96997 in NSET A_RIGHT, Reaction force: RF1 at Node 96998 in NSET A_RIGHT, Reaction force: RF1 at Node 96999 in NSET A_RIGHT, Reaction force: RF1 at Node 97000 in NSET A_RIGHT, Reaction force: RF1 at Node 97001 in NSET A_RIGHT, Reaction force: RF1 at Node 97002 in NSET A_RIGHT, Reaction force: RF1 at Node 97003 in NSET A_RIGHT, Reaction force: RF1 at Node 97004 in NSET A_RIGHT, Reaction force: RF1 at Node 97005 in NSET A_RIGHT, Reaction force: RF1 at Node 97006 in NSET A_RIGHT, Reaction force: RF1 at Node 97007 in NSET A_RIGHT, Reaction force: RF1 at Node 97008 in NSET A_RIGHT, Reaction force: RF1 at Node 97009 in NSET A_RIGHT, Reaction force: RF1 at Node 97010 in NSET A_RIGHT, Reaction force: RF1 at Node 97011 in NSET A_RIGHT, Reaction force: RF1 at Node 97012 in NSET A_RIGHT, Reaction force: RF1 at Node 97013 in NSET A_RIGHT, Reaction force: RF1 at Node 97014 in NSET A_RIGHT, Reaction force: RF1 at Node 97015 in NSET A_RIGHT, Reaction force: RF1 at Node 97016 in NSET A_RIGHT, Reaction force: RF1 at Node 97017 in NSET A_RIGHT, Reaction force: RF1 at Node 97018 in NSET A_RIGHT, Reaction force: RF1 at Node 97019 in NSET A_RIGHT, Reaction force: RF1 at Node 97020 in NSET A_RIGHT, Reaction force: RF1 at Node 97021 in NSET A_RIGHT, Reaction force: RF1 at Node 97022 in NSET A_RIGHT, Reaction force: RF1 at Node 97023 in NSET A_RIGHT, Reaction force: RF1 at Node 97024 in NSET A_RIGHT, Reaction force: RF1 at Node 97025 in NSET A_RIGHT, Reaction force: RF1 at Node 97026 in NSET A_RIGHT, Reaction force: RF1 at Node 97027 in NSET A_RIGHT, Reaction force: RF1 at Node 97028 in NSET A_RIGHT, Reaction force: RF1 at Node 145352 in NSET A_RIGHT, Reaction force: RF1 at Node 145353 in NSET A_RIGHT, Reaction force: RF1 at Node 145354 in NSET A_RIGHT, Reaction force: RF1 at Node 145355 in NSET A_RIGHT, Reaction force: RF1 at Node 145356 in NSET A_RIGHT, Reaction force: RF1 at Node 145357 in NSET A_RIGHT, Reaction force: RF1 at Node 145358 in NSET A_RIGHT, Reaction force: RF1 at Node 145359 in NSET A_RIGHT, Reaction force: RF1 at Node 145360 in NSET A_RIGHT, Reaction force: RF1 at Node 145361 in NSET A_RIGHT, Reaction force: RF1 at Node 145362 in NSET A_RIGHT, Reaction force: RF1 at Node 145363 in NSET A_RIGHT, Reaction force: RF1 at Node 145364 in NSET A_RIGHT, Reaction force: RF1 at Node 145365 in NSET A_RIGHT, Reaction force: RF1 at Node 145366 in NSET A_RIGHT, Reaction force: RF1 at Node 145367 in NSET A_RIGHT, Reaction force: RF1 at Node 145368 in NSET A_RIGHT, Reaction force: RF1 at Node 145369 in NSET A_RIGHT, Reaction force: RF1 at Node 145370 in NSET A_RIGHT, Reaction force: RF1 at Node 145371 in NSET A_RIGHT, Reaction force: RF1 at Node 145372 in NSET A_RIGHT, Reaction force: RF1 at Node 145373 in NSET A_RIGHT, Reaction force: RF1 at Node 145374 in NSET A_RIGHT, Reaction force: RF1 at Node 145375 in NSET A_RIGHT, Reaction force: RF1 at Node 145376 in NSET A_RIGHT, Reaction force: RF1 at Node 145377 in NSET A_RIGHT, Reaction force: RF1 at Node 145378 in NSET A_RIGHT, Reaction force: RF1 at Node 145379 in NSET A_RIGHT, Reaction force: RF1 at Node 145380 in NSET A_RIGHT, Reaction force: RF1 at Node 145381 in NSET A_RIGHT, Reaction force: RF1 at Node 145382 in NSET A_RIGHT, Reaction force: RF1 at Node 145383 in NSET A_RIGHT, Reaction force: RF1 at Node 145384 in NSET A_RIGHT, Reaction force: RF1 at Node 145385 in NSET A_RIGHT, Reaction force: RF1 at Node 145386 in NSET A_RIGHT, Reaction force: RF1 at Node 145387 in NSET A_RIGHT, Reaction force: RF1 at Node 145388 in NSET A_RIGHT, Reaction force: RF1 at Node 145389 in NSET A_RIGHT, Reaction force: RF1 at Node 145390 in NSET A_RIGHT, Reaction force: RF1 at Node 145391 in NSET A_RIGHT, Reaction force: RF1 at Node 145392 in NSET A_RIGHT, Reaction force: RF1 at Node 145393 in NSET A_RIGHT, Reaction force: RF1 at Node 145394 in NSET A_RIGHT, Reaction force: RF1 at Node 145395 in NSET A_RIGHT, Reaction force: RF1 at Node 145396 in NSET A_RIGHT, Reaction force: RF1 at Node 145397 in NSET A_RIGHT, Reaction force: RF1 at Node 145398 in NSET A_RIGHT, Reaction force: RF1 at Node 145399 in NSET A_RIGHT, Reaction force: RF1 at Node 145400 in NSET A_RIGHT, Reaction force: RF1 at Node 145401 in NSET A_RIGHT, Reaction force: RF1 at Node 145402 in NSET A_RIGHT, Reaction force: RF1 at Node 145403 in NSET A_RIGHT, Reaction force: RF1 at Node 145404 in NSET A_RIGHT, Reaction force: RF1 at Node 145405 in NSET A_RIGHT, Reaction force: RF1 at Node 145406 in NSET A_RIGHT, Reaction force: RF1 at Node 145407 in NSET A_RIGHT, Reaction force: RF1 at Node 145408 in NSET A_RIGHT, Reaction force: RF1 at Node 145409 in NSET A_RIGHT, Reaction force: RF1 at Node 145410 in NSET A_RIGHT, Reaction force: RF1 at Node 145411 in NSET A_RIGHT, Reaction force: RF1 at Node 145412 in NSET A_RIGHT, Reaction force: RF1 at Node 145413 in NSET A_RIGHT, Reaction force: RF1 at Node 145414 in NSET A_RIGHT, Reaction force: RF1 at Node 145415 in NSET A_RIGHT, Reaction force: RF1 at Node 145416 in NSET A_RIGHT, Reaction force: RF1 at Node 145417 in NSET A_RIGHT, Reaction force: RF1 at Node 145418 in NSET A_RIGHT, Reaction force: RF1 at Node 145419 in NSET A_RIGHT, Reaction force: RF1 at Node 145420 in NSET A_RIGHT, Reaction force: RF1 at Node 145421 in NSET A_RIGHT, Reaction force: RF1 at Node 145422 in NSET A_RIGHT, Reaction force: RF1 at Node 145423 in NSET A_RIGHT, Reaction force: RF1 at Node 145424 in NSET A_RIGHT, Reaction force: RF1 at Node 145425 in NSET A_RIGHT, Reaction force: RF1 at Node 145426 in NSET A_RIGHT, Reaction force: RF1 at Node 145427 in NSET A_RIGHT, Reaction force: RF1 at Node 145428 in NSET A_RIGHT, Reaction force: RF1 at Node 145429 in NSET A_RIGHT, Reaction force: RF1 at Node 145430 in NSET A_RIGHT, Reaction force: RF1 at Node 145431 in NSET A_RIGHT, Reaction force: RF1 at Node 145432 in NSET A_RIGHT, Reaction force: RF1 at Node 145433 in NSET A_RIGHT, Reaction force: RF1 at Node 145434 in NSET A_RIGHT, Reaction force: RF1 at Node 145435 in NSET A_RIGHT, Reaction force: RF1 at Node 145436 in NSET A_RIGHT, Reaction force: RF1 at Node 145437 in NSET A_RIGHT, Reaction force: RF1 at Node 145438 in NSET A_RIGHT, Reaction force: RF1 at Node 145439 in NSET A_RIGHT, Reaction force: RF1 at Node 145440 in NSET A_RIGHT, Reaction force: RF1 at Node 145441 in NSET A_RIGHT, Reaction force: RF1 at Node 145442 in NSET A_RIGHT, Reaction force: RF1 at Node 145443 in NSET A_RIGHT, Reaction force: RF1 at Node 145444 in NSET A_RIGHT, Reaction force: RF1 at Node 145445 in NSET A_RIGHT, Reaction force: RF1 at Node 145446 in NSET A_RIGHT, Reaction force: RF1 at Node 145447 in NSET A_RIGHT, Reaction force: RF1 at Node 145448 in NSET A_RIGHT, Reaction force: RF1 at Node 145449 in NSET A_RIGHT, Reaction force: RF1 at Node 145450 in NSET A_RIGHT, Reaction force: RF1 at Node 145451 in NSET A_RIGHT, Reaction force: RF1 at Node 145452 in NSET A_RIGHT, Reaction force: RF1 at Node 145453 in NSET A_RIGHT, Reaction force: RF1 at Node 145454 in NSET A_RIGHT, Reaction force: RF1 at Node 145455 in NSET A_RIGHT, Reaction force: RF1 at Node 145456 in NSET A_RIGHT, Reaction force: RF1 at Node 145457 in NSET A_RIGHT, Reaction force: RF1 at Node 145458 in NSET A_RIGHT, Reaction force: RF1 at Node 145459 in NSET A_RIGHT, Reaction force: RF1 at Node 145460 in NSET A_RIGHT, Reaction force: RF1 at Node 145461 in NSET A_RIGHT, Reaction force: RF1 at Node 145462 in NSET A_RIGHT, Reaction force: RF1 at Node 145463 in NSET A_RIGHT, Reaction force: RF1 at Node 145464 in NSET A_RIGHT, Reaction force: RF1 at Node 145465 in NSET A_RIGHT, Reaction force: RF1 at Node 145466 in NSET A_RIGHT, Reaction force: RF1 at Node 145467 in NSET A_RIGHT, Reaction force: RF1 at Node 145468 in NSET A_RIGHT, Reaction force: RF1 at Node 145469 in NSET A_RIGHT, Reaction force: RF1 at Node 145470 in NSET A_RIGHT, Reaction force: RF1 at Node 145471 in NSET A_RIGHT, Reaction force: RF1 at Node 145472 in NSET A_RIGHT, Reaction force: RF1 at Node 145473 in NSET A_RIGHT, Reaction force: RF1 at Node 145474 in NSET A_RIGHT, Reaction force: RF1 at Node 145475 in NSET A_RIGHT, Reaction force: RF1 at Node 145476 in NSET A_RIGHT, Reaction force: RF1 at Node 145477 in NSET A_RIGHT, Reaction force: RF1 at Node 145478 in NSET A_RIGHT, Reaction force: RF1 at Node 145479 in NSET A_RIGHT, Reaction force: RF1 at Node 145480 in NSET A_RIGHT, Reaction force: RF1 at Node 145481 in NSET A_RIGHT, Reaction force: RF1 at Node 145482 in NSET A_RIGHT, Reaction force: RF1 at Node 145483 in NSET A_RIGHT, Reaction force: RF1 at Node 145484 in NSET A_RIGHT, Reaction force: RF1 at Node 145485 in NSET A_RIGHT, Reaction force: RF1 at Node 145486 in NSET A_RIGHT, Reaction force: RF1 at Node 145487 in NSET A_RIGHT, Reaction force: RF1 at Node 145488 in NSET A_RIGHT, Reaction force: RF1 at Node 145489 in NSET A_RIGHT, Reaction force: RF1 at Node 145490 in NSET A_RIGHT, Reaction force: RF1 at Node 145491 in NSET A_RIGHT, Reaction force: RF1 at Node 145492 in NSET A_RIGHT, Reaction force: RF1 at Node 145493 in NSET A_RIGHT, Reaction force: RF1 at Node 145494 in NSET A_RIGHT, Reaction force: RF1 at Node 145495 in NSET A_RIGHT, Reaction force: RF1 at Node 145496 in NSET A_RIGHT, Reaction force: RF1 at Node 145497 in NSET A_RIGHT, Reaction force: RF1 at Node 145498 in NSET A_RIGHT, Reaction force: RF1 at Node 145499 in NSET A_RIGHT, Reaction force: RF1 at Node 145500 in NSET A_RIGHT, Reaction force: RF1 at Node 145501 in NSET A_RIGHT, Reaction force: RF1 at Node 145502 in NSET A_RIGHT, Reaction force: RF1 at Node 145503 in NSET A_RIGHT, Reaction force: RF1 at Node 145504 in NSET A_RIGHT, Reaction force: RF1 at Node 145505 in NSET A_RIGHT, Reaction force: RF1 at Node 145506 in NSET A_RIGHT, Reaction force: RF1 at Node 145507 in NSET A_RIGHT, Reaction force: RF1 at Node 145508 in NSET A_RIGHT, Reaction force: RF1 at Node 145509 in NSET A_RIGHT, Reaction force: RF1 at Node 145510 in NSET A_RIGHT, Reaction force: RF1 at Node 145511 in NSET A_RIGHT, Reaction force: RF1 at Node 145512 in NSET A_RIGHT, Reaction force: RF1 at Node 145513 in NSET A_RIGHT, Reaction force: RF1 at Node 145514 in NSET A_RIGHT, Reaction force: RF1 at Node 145515 in NSET A_RIGHT, Reaction force: RF1 at Node 145516 in NSET A_RIGHT, Reaction force: RF1 at Node 145517 in NSET A_RIGHT, Reaction force: RF1 at Node 145518 in NSET A_RIGHT, Reaction force: RF1 at Node 145519 in NSET A_RIGHT, Reaction force: RF1 at Node 145520 in NSET A_RIGHT, Reaction force: RF1 at Node 145521 in NSET A_RIGHT, Reaction force: RF1 at Node 145522 in NSET A_RIGHT, Reaction force: RF1 at Node 145523 in NSET A_RIGHT, Reaction force: RF1 at Node 145524 in NSET A_RIGHT, Reaction force: RF1 at Node 145525 in NSET A_RIGHT, Reaction force: RF1 at Node 145526 in NSET A_RIGHT, Reaction force: RF1 at Node 145527 in NSET A_RIGHT, Reaction force: RF1 at Node 145528 in NSET A_RIGHT, Reaction force: RF1 at Node 145529 in NSET A_RIGHT, Reaction force: RF1 at Node 145530 in NSET A_RIGHT, Reaction force: RF1 at Node 145531 in NSET A_RIGHT, Reaction force: RF1 at Node 145532 in NSET A_RIGHT, Reaction force: RF1 at Node 145533 in NSET A_RIGHT, Reaction force: RF1 at Node 145534 in NSET A_RIGHT, Reaction force: RF1 at Node 145535 in NSET A_RIGHT, Reaction force: RF1 at Node 145536 in NSET A_RIGHT, Reaction force: RF1 at Node 145537 in NSET A_RIGHT, Reaction force: RF1 at Node 145538 in NSET A_RIGHT, Reaction force: RF1 at Node 145539 in NSET A_RIGHT, Reaction force: RF1 at Node 145540 in NSET A_RIGHT, Reaction force: RF1 at Node 145541 in NSET A_RIGHT, Reaction force: RF1 at Node 145542 in NSET A_RIGHT, Reaction force: RF1 at Node 193866 in NSET A_RIGHT, Reaction force: RF1 at Node 193867 in NSET A_RIGHT, Reaction force: RF1 at Node 193868 in NSET A_RIGHT, Reaction force: RF1 at Node 193869 in NSET A_RIGHT, Reaction force: RF1 at Node 193870 in NSET A_RIGHT, Reaction force: RF1 at Node 193871 in NSET A_RIGHT, Reaction force: RF1 at Node 193872 in NSET A_RIGHT, Reaction force: RF1 at Node 193873 in NSET A_RIGHT, Reaction force: RF1 at Node 193874 in NSET A_RIGHT, Reaction force: RF1 at Node 193875 in NSET A_RIGHT, Reaction force: RF1 at Node 193876 in NSET A_RIGHT, Reaction force: RF1 at Node 193877 in NSET A_RIGHT, Reaction force: RF1 at Node 193878 in NSET A_RIGHT, Reaction force: RF1 at Node 193879 in NSET A_RIGHT, Reaction force: RF1 at Node 193880 in NSET A_RIGHT, Reaction force: RF1 at Node 193881 in NSET A_RIGHT, Reaction force: RF1 at Node 193882 in NSET A_RIGHT, Reaction force: RF1 at Node 193883 in NSET A_RIGHT, Reaction force: RF1 at Node 193884 in NSET A_RIGHT, Reaction force: RF1 at Node 193885 in NSET A_RIGHT, Reaction force: RF1 at Node 193886 in NSET A_RIGHT, Reaction force: RF1 at Node 193887 in NSET A_RIGHT, Reaction force: RF1 at Node 193888 in NSET A_RIGHT, Reaction force: RF1 at Node 193889 in NSET A_RIGHT, Reaction force: RF1 at Node 193890 in NSET A_RIGHT, Reaction force: RF1 at Node 193891 in NSET A_RIGHT, Reaction force: RF1 at Node 193892 in NSET A_RIGHT, Reaction force: RF1 at Node 193893 in NSET A_RIGHT, Reaction force: RF1 at Node 193894 in NSET A_RIGHT, Reaction force: RF1 at Node 193895 in NSET A_RIGHT, Reaction force: RF1 at Node 193896 in NSET A_RIGHT, Reaction force: RF1 at Node 193897 in NSET A_RIGHT, Reaction force: RF1 at Node 193898 in NSET A_RIGHT, Reaction force: RF1 at Node 193899 in NSET A_RIGHT, Reaction force: RF1 at Node 193900 in NSET A_RIGHT, Reaction force: RF1 at Node 193901 in NSET A_RIGHT, Reaction force: RF1 at Node 193902 in NSET A_RIGHT, Reaction force: RF1 at Node 193903 in NSET A_RIGHT, Reaction force: RF1 at Node 193904 in NSET A_RIGHT, Reaction force: RF1 at Node 193905 in NSET A_RIGHT, Reaction force: RF1 at Node 193906 in NSET A_RIGHT, Reaction force: RF1 at Node 193907 in NSET A_RIGHT, Reaction force: RF1 at Node 193908 in NSET A_RIGHT, Reaction force: RF1 at Node 193909 in NSET A_RIGHT, Reaction force: RF1 at Node 193910 in NSET A_RIGHT, Reaction force: RF1 at Node 193911 in NSET A_RIGHT, Reaction force: RF1 at Node 193912 in NSET A_RIGHT, Reaction force: RF1 at Node 193913 in NSET A_RIGHT, Reaction force: RF1 at Node 193914 in NSET A_RIGHT, Reaction force: RF1 at Node 193915 in NSET A_RIGHT, Reaction force: RF1 at Node 193916 in NSET A_RIGHT, Reaction force: RF1 at Node 193917 in NSET A_RIGHT, Reaction force: RF1 at Node 193918 in NSET A_RIGHT, Reaction force: RF1 at Node 193919 in NSET A_RIGHT, Reaction force: RF1 at Node 193920 in NSET A_RIGHT, Reaction force: RF1 at Node 193921 in NSET A_RIGHT, Reaction force: RF1 at Node 193922 in NSET A_RIGHT, Reaction force: RF1 at Node 193923 in NSET A_RIGHT, Reaction force: RF1 at Node 193924 in NSET A_RIGHT, Reaction force: RF1 at Node 193925 in NSET A_RIGHT, Reaction force: RF1 at Node 193926 in NSET A_RIGHT, Reaction force: RF1 at Node 193927 in NSET A_RIGHT, Reaction force: RF1 at Node 193928 in NSET A_RIGHT, Reaction force: RF1 at Node 193929 in NSET A_RIGHT, Reaction force: RF1 at Node 193930 in NSET A_RIGHT, Reaction force: RF1 at Node 193931 in NSET A_RIGHT, Reaction force: RF1 at Node 193932 in NSET A_RIGHT, Reaction force: RF1 at Node 193933 in NSET A_RIGHT, Reaction force: RF1 at Node 193934 in NSET A_RIGHT, Reaction force: RF1 at Node 193935 in NSET A_RIGHT, Reaction force: RF1 at Node 193936 in NSET A_RIGHT, Reaction force: RF1 at Node 193937 in NSET A_RIGHT, Reaction force: RF1 at Node 193938 in NSET A_RIGHT, Reaction force: RF1 at Node 193939 in NSET A_RIGHT, Reaction force: RF1 at Node 193940 in NSET A_RIGHT, Reaction force: RF1 at Node 193941 in NSET A_RIGHT, Reaction force: RF1 at Node 193942 in NSET A_RIGHT, Reaction force: RF1 at Node 193943 in NSET A_RIGHT, Reaction force: RF1 at Node 193944 in NSET A_RIGHT, Reaction force: RF1 at Node 193945 in NSET A_RIGHT, Reaction force: RF1 at Node 193946 in NSET A_RIGHT, Reaction force: RF1 at Node 193947 in NSET A_RIGHT, Reaction force: RF1 at Node 193948 in NSET A_RIGHT, Reaction force: RF1 at Node 193949 in NSET A_RIGHT, Reaction force: RF1 at Node 193950 in NSET A_RIGHT, Reaction force: RF1 at Node 193951 in NSET A_RIGHT, Reaction force: RF1 at Node 193952 in NSET A_RIGHT, Reaction force: RF1 at Node 193953 in NSET A_RIGHT, Reaction force: RF1 at Node 193954 in NSET A_RIGHT, Reaction force: RF1 at Node 193955 in NSET A_RIGHT, Reaction force: RF1 at Node 193956 in NSET A_RIGHT, Reaction force: RF1 at Node 193957 in NSET A_RIGHT, Reaction force: RF1 at Node 193958 in NSET A_RIGHT, Reaction force: RF1 at Node 193959 in NSET A_RIGHT, Reaction force: RF1 at Node 193960 in NSET A_RIGHT, Reaction force: RF1 at Node 193961 in NSET A_RIGHT, Reaction force: RF1 at Node 193962 in NSET A_RIGHT, Reaction force: RF1 at Node 193963 in NSET A_RIGHT, Reaction force: RF1 at Node 193964 in NSET A_RIGHT, Reaction force: RF1 at Node 193965 in NSET A_RIGHT, Reaction force: RF1 at Node 193966 in NSET A_RIGHT, Reaction force: RF1 at Node 193967 in NSET A_RIGHT, Reaction force: RF1 at Node 193968 in NSET A_RIGHT, Reaction force: RF1 at Node 193969 in NSET A_RIGHT, Reaction force: RF1 at Node 193970 in NSET A_RIGHT, Reaction force: RF1 at Node 193971 in NSET A_RIGHT, Reaction force: RF1 at Node 193972 in NSET A_RIGHT, Reaction force: RF1 at Node 193973 in NSET A_RIGHT, Reaction force: RF1 at Node 193974 in NSET A_RIGHT, Reaction force: RF1 at Node 193975 in NSET A_RIGHT, Reaction force: RF1 at Node 193976 in NSET A_RIGHT, Reaction force: RF1 at Node 193977 in NSET A_RIGHT, Reaction force: RF1 at Node 193978 in NSET A_RIGHT, Reaction force: RF1 at Node 193979 in NSET A_RIGHT, Reaction force: RF1 at Node 193980 in NSET A_RIGHT, Reaction force: RF1 at Node 193981 in NSET A_RIGHT, Reaction force: RF1 at Node 193982 in NSET A_RIGHT, Reaction force: RF1 at Node 193983 in NSET A_RIGHT, Reaction force: RF1 at Node 193984 in NSET A_RIGHT, Reaction force: RF1 at Node 193985 in NSET A_RIGHT, Reaction force: RF1 at Node 193986 in NSET A_RIGHT, Reaction force: RF1 at Node 193987 in NSET A_RIGHT, Reaction force: RF1 at Node 193988 in NSET A_RIGHT, Reaction force: RF1 at Node 193989 in NSET A_RIGHT, Reaction force: RF1 at Node 193990 in NSET A_RIGHT, Reaction force: RF1 at Node 193991 in NSET A_RIGHT, Reaction force: RF1 at Node 193992 in NSET A_RIGHT, Reaction force: RF1 at Node 193993 in NSET A_RIGHT, Reaction force: RF1 at Node 193994 in NSET A_RIGHT, Reaction force: RF1 at Node 193995 in NSET A_RIGHT, Reaction force: RF1 at Node 193996 in NSET A_RIGHT, Reaction force: RF1 at Node 193997 in NSET A_RIGHT, Reaction force: RF1 at Node 193998 in NSET A_RIGHT, Reaction force: RF1 at Node 193999 in NSET A_RIGHT, Reaction force: RF1 at Node 194000 in NSET A_RIGHT, Reaction force: RF1 at Node 194001 in NSET A_RIGHT, Reaction force: RF1 at Node 194002 in NSET A_RIGHT, Reaction force: RF1 at Node 194003 in NSET A_RIGHT, Reaction force: RF1 at Node 194004 in NSET A_RIGHT, Reaction force: RF1 at Node 194005 in NSET A_RIGHT, Reaction force: RF1 at Node 194006 in NSET A_RIGHT, Reaction force: RF1 at Node 194007 in NSET A_RIGHT, Reaction force: RF1 at Node 194008 in NSET A_RIGHT, Reaction force: RF1 at Node 194009 in NSET A_RIGHT, Reaction force: RF1 at Node 194010 in NSET A_RIGHT, Reaction force: RF1 at Node 194011 in NSET A_RIGHT, Reaction force: RF1 at Node 194012 in NSET A_RIGHT, Reaction force: RF1 at Node 194013 in NSET A_RIGHT, Reaction force: RF1 at Node 194014 in NSET A_RIGHT, Reaction force: RF1 at Node 194015 in NSET A_RIGHT, Reaction force: RF1 at Node 194016 in NSET A_RIGHT, Reaction force: RF1 at Node 194017 in NSET A_RIGHT, Reaction force: RF1 at Node 194018 in NSET A_RIGHT, Reaction force: RF1 at Node 194019 in NSET A_RIGHT, Reaction force: RF1 at Node 194020 in NSET A_RIGHT, Reaction force: RF1 at Node 194021 in NSET A_RIGHT, Reaction force: RF1 at Node 194022 in NSET A_RIGHT, Reaction force: RF1 at Node 194023 in NSET A_RIGHT, Reaction force: RF1 at Node 194024 in NSET A_RIGHT, Reaction force: RF1 at Node 194025 in NSET A_RIGHT, Reaction force: RF1 at Node 194026 in NSET A_RIGHT, Reaction force: RF1 at Node 194027 in NSET A_RIGHT, Reaction force: RF1 at Node 194028 in NSET A_RIGHT, Reaction force: RF1 at Node 194029 in NSET A_RIGHT, Reaction force: RF1 at Node 194030 in NSET A_RIGHT, Reaction force: RF1 at Node 194031 in NSET A_RIGHT, Reaction force: RF1 at Node 194032 in NSET A_RIGHT, Reaction force: RF1 at Node 194033 in NSET A_RIGHT, Reaction force: RF1 at Node 194034 in NSET A_RIGHT, Reaction force: RF1 at Node 194035 in NSET A_RIGHT, Reaction force: RF1 at Node 194036 in NSET A_RIGHT, Reaction force: RF1 at Node 194037 in NSET A_RIGHT, Reaction force: RF1 at Node 194038 in NSET A_RIGHT, Reaction force: RF1 at Node 194039 in NSET A_RIGHT, Reaction force: RF1 at Node 194040 in NSET A_RIGHT, Reaction force: RF1 at Node 194041 in NSET A_RIGHT, Reaction force: RF1 at Node 194042 in NSET A_RIGHT, Reaction force: RF1 at Node 194043 in NSET A_RIGHT, Reaction force: RF1 at Node 194044 in NSET A_RIGHT, Reaction force: RF1 at Node 194045 in NSET A_RIGHT, Reaction force: RF1 at Node 194046 in NSET A_RIGHT, Reaction force: RF1 at Node 194047 in NSET A_RIGHT, Reaction force: RF1 at Node 194048 in NSET A_RIGHT, Reaction force: RF1 at Node 194049 in NSET A_RIGHT, Reaction force: RF1 at Node 194050 in NSET A_RIGHT, Reaction force: RF1 at Node 194051 in NSET A_RIGHT, Reaction force: RF1 at Node 194052 in NSET A_RIGHT, Reaction force: RF1 at Node 194053 in NSET A_RIGHT, Reaction force: RF1 at Node 194054 in NSET A_RIGHT, Reaction force: RF1 at Node 194055 in NSET A_RIGHT, Reaction force: RF1 at Node 194056 in NSET A_RIGHT, ),)')
c1 = session.Curve(xyData=xy_result)
xyp = session.xyPlots['XYPlot-1']
chartName = xyp.charts.keys()[0]
chart = xyp.charts[chartName]
chart.setValues(curvesToPlot=(c1, ), )
