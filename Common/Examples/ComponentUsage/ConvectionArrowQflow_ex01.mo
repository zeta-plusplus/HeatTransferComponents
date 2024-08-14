within HeatTransferComponents.Common.Examples.ComponentUsage;

model ConvectionArrowQflow_ex01
  extends Modelica.Icons.Example;
  //----------
  parameter Modelica.Units.SI.Temperature TcontourMin (displayUnit = "K")= 273.15 "";
  parameter Modelica.Units.SI.Temperature TcontourMax (displayUnit = "K")= 1000 "";
  parameter Modelica.Units.SI.HeatFlowRate Q_flow_Min = 0.0;
  parameter Modelica.Units.SI.HeatFlowRate Q_flow_Max = 100;
  parameter Real arrowHeatFlowMin = 0.01;
  parameter Real arrowHeatFlowMax = 40;
  //----------
  
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature wallTemperature2(T = 288.15) annotation(
    Placement(transformation(origin = {90, 6}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(transformation(origin = {-38, 6}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
    Placement(transformation(origin = {-22, -20}, extent = {{-9, -6}, {9, 6}})));
  Modelica.Blocks.Math.Gain gain1(k = 1e-6) annotation(
    Placement(transformation(origin = {-38, -10}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  HeatTransferComponents.Common.HeatCapacitorColorT HeatCapacitor(C = (0.444*1000)*10, T(fixed = true, start = 288.15), switchUnitT = HeatTransferComponents.Types.SwitchUnitVisTemperature.K, valMax = TcontourMax, valMin = TcontourMin, sigDigits = 4) annotation(
    Placement(transformation(origin = {12, 16}, extent = {{-10, -10}, {10, 10}})));
  HeatTransferComponents.Common.ConvectionArrowQflow convection1 annotation(
    Placement(transformation(origin = {38, 6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 4) annotation(
    Placement(transformation(origin = {73, -20}, extent = {{-9, -6}, {9, 6}})));
  Modelica.Blocks.Math.Gain gain2(k = 1e-6) annotation(
    Placement(transformation(origin = {59, -10}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor2 annotation(
    Placement(transformation(origin = {59, 6}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature wallTemperature1 annotation(
    Placement(transformation(origin = {-64, 6}, extent = {{-10, -10}, {10, 10}})));
  ConvectionArrowQflow convection annotation(
    Placement(transformation(origin = {-12, 6}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_wallTemperature1(height = 1000 - (15 + 273.15), duration = 1, offset = 15 + 273.15, startTime = 5)  annotation(
    Placement(transformation(origin = {-91, 6}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Sources.Ramp ramp_convection_Gc(duration = 1, height = 400, offset = 100, startTime = 20) annotation(
    Placement(transformation(origin = {-12, 35}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_convection1_Gc(duration = 1, height = 400, offset = 100, startTime = 30) annotation(
    Placement(transformation(origin = {38, 35}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Sensors.TemperatureDispColor00 Temperature1(sigDigits = 4, valMin = TcontourMin, valMax = TcontourMax)  annotation(
    Placement(transformation(origin = {-60, -4}, extent = {{10, -4}, {-10, 4}})));
  Sensors.TemperatureDispColor00 Temperature2(sigDigits = 4, valMin = TcontourMin, valMax = TcontourMax)  annotation(
    Placement(transformation(origin = {86, -4}, extent = {{-10, -4}, {10, 4}}, rotation = -0)));
equation
  connect(heatFlowSensor1.Q_flow, gain1.u) annotation(
    Line(points = {{-38, 0.5}, {-38, -5}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, gain1.y) annotation(
    Line(points = {{-32.35, -20}, {-38.35, -20}, {-38.35, -14}}, color = {0, 0, 127}));
  connect(HeatCapacitor.port, convection1.solid) annotation(
    Line(points = {{12, 6}, {28, 6}}, color = {191, 0, 0}, thickness = 1.5));
  connect(realValue2.numberPort, gain2.y) annotation(
    Line(points = {{62.65, -20}, {58.65, -20}, {58.65, -14}}, color = {0, 0, 127}));
  connect(heatFlowSensor2.Q_flow, gain2.u) annotation(
    Line(points = {{59, 0.5}, {59, -5.5}}, color = {0, 0, 127}));
  connect(convection1.fluid, heatFlowSensor2.port_a) annotation(
    Line(points = {{48, 6}, {54, 6}}, color = {191, 0, 0}, thickness = 1.5));
  connect(convection.solid, HeatCapacitor.port) annotation(
    Line(points = {{-2, 6}, {12, 6}}, color = {191, 0, 0}, thickness = 1.5));
  connect(wallTemperature1.port, heatFlowSensor1.port_a) annotation(
    Line(points = {{-54, 6}, {-43, 6}}, color = {191, 0, 0}, thickness = 1.5));
  connect(heatFlowSensor1.port_b, convection.fluid) annotation(
    Line(points = {{-33, 6}, {-23, 6}}, color = {191, 0, 0}, thickness = 1.5));
  connect(heatFlowSensor2.port_b, wallTemperature2.port) annotation(
    Line(points = {{64, 6}, {80, 6}}, color = {191, 0, 0}, thickness = 1.5));
  connect(ramp_wallTemperature1.y, wallTemperature1.T) annotation(
    Line(points = {{-84, 6}, {-76, 6}}, color = {0, 0, 127}));
  connect(ramp_convection_Gc.y, convection.Gc) annotation(
    Line(points = {{-12, 30}, {-12, 16}}, color = {0, 0, 127}));
  connect(ramp_convection1_Gc.y, convection1.Gc) annotation(
    Line(points = {{38, 30}, {38, 16}}, color = {0, 0, 127}));
  connect(wallTemperature2.port, Temperature2.heatPort) annotation(
    Line(points = {{80, 6}, {76, 6}, {76, -4}}, color = {191, 0, 0}));
  connect(wallTemperature1.port, Temperature1.heatPort) annotation(
    Line(points = {{-54, 6}, {-50, 6}, {-50, -4}}, color = {191, 0, 0}));
annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01));
end ConvectionArrowQflow_ex01;
