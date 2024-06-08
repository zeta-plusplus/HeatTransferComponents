within HeatTransferComponents.Examples.Tutorial;

model ThermalValveDiscrete_ex01
  extends Modelica.Icons.Example;
  //-----
  parameter Real minTcontour=0.0;
  parameter Real maxTcontour=100.0;
  //-----
  
  Utilities.ThermalValveDiscrete thermalValve annotation(
    Placement(transformation(origin = {-13, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 373.15) annotation(
    Placement(transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature1(T = 288.15) annotation(
    Placement(transformation(origin = {90, 10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 0.1*1/0.5) annotation(
    Placement(transformation(origin = {-58, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {-36, 10}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {-11, -20}, extent = {{-13, -8}, {13, 8}})));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startTime = 50) annotation(
    Placement(transformation(origin = {-58, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = 1, T(start = 293.15, fixed = true)) annotation(
    Placement(transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 0.1*1/0.5) annotation(
    Placement(transformation(origin = {40, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(transformation(origin = {62, 10}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
    Placement(transformation(origin = {85, -20}, extent = {{-13, -8}, {13, 8}})));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 Temperature(valMax = maxTcontour, valMin = minTcontour) annotation(
    Placement(transformation(origin = {-60, 40}, extent = {{-10, -4}, {10, 4}})));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 Temperature1(valMax = maxTcontour, valMin = minTcontour) annotation(
    Placement(transformation(origin = {10, 40}, extent = {{-10, -4}, {10, 4}})));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 Temperature2(valMax = maxTcontour, valMin = minTcontour) annotation(
    Placement(transformation(origin = {42, 40}, extent = {{10, -4}, {-10, 4}})));
equation
  connect(thermalConductor.port_b, heatFlowSensor.port_a) annotation(
    Line(points = {{-48, 10}, {-42, 10}}, color = {191, 0, 0}));
  connect(heatFlowSensor.port_b, thermalValve.port_a) annotation(
    Line(points = {{-30, 10}, {-23, 10}}, color = {191, 0, 0}));
  connect(heatFlowSensor.Q_flow, realValue.numberPort) annotation(
    Line(points = {{-36, 3.4}, {-36, -20}, {-26, -20}}, color = {0, 0, 127}));
  connect(thermalValve.port_b, heatCapacitor1.port) annotation(
    Line(points = {{-3, 10}, {10, 10}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, thermalConductor.port_a) annotation(
    Line(points = {{-80, 10}, {-68, 10}}, color = {191, 0, 0}));
  connect(heatCapacitor1.port, thermalConductor1.port_a) annotation(
    Line(points = {{10, 10}, {30, 10}}, color = {191, 0, 0}));
  connect(thermalConductor1.port_b, heatFlowSensor1.port_a) annotation(
    Line(points = {{50, 10}, {56, 10}}, color = {191, 0, 0}));
  connect(heatFlowSensor1.port_b, fixedTemperature1.port) annotation(
    Line(points = {{68, 10}, {80, 10}}, color = {191, 0, 0}));
  connect(heatFlowSensor1.Q_flow, realValue1.numberPort) annotation(
    Line(points = {{62, 4}, {62, -20}, {70, -20}}, color = {0, 0, 127}));
  connect(booleanStep.y, thermalValve.u_open) annotation(
    Line(points = {{-46, 80}, {-19, 80}, {-19, 21}}, color = {255, 0, 255}));
  connect(Temperature.heatPort, thermalConductor.port_a) annotation(
    Line(points = {{-70, 40}, {-70, 10}, {-68, 10}}, color = {191, 0, 0}));
  connect(Temperature1.heatPort, heatCapacitor1.port) annotation(
    Line(points = {{0, 40}, {0, 10}, {10, 10}}, color = {191, 0, 0}));
  connect(Temperature2.heatPort, thermalConductor1.port_b) annotation(
    Line(points = {{52, 40}, {52, 10}, {50, 10}}, color = {191, 0, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01),
    Diagram);
end ThermalValveDiscrete_ex01;
