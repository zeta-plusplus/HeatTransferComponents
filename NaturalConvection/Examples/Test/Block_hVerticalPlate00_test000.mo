within HeatTransferComponents.NaturalConvection.Examples.Test;

model Block_hVerticalPlate00_test000
  extends Modelica.Icons.Example;
  //----------
  //replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = liquid1
  replaceable package gas1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = gas1
  //----------
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = gas1, T = 288.15, nPorts = 1, p = 100*1000, use_T_in = true) annotation(
    Placement(visible = true, transformation(origin = {10, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-86, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
    Placement(visible = true, transformation(origin = {-20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Tsurf(duration = 1, height = 100, offset = 700, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.NaturalConvection.Block_hVerticalPlate00 calc_hConv(redeclare package Medium = gas1) annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -12}, {10, 12}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_fluid(duration = 1, height = 100, offset = 288.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_Tsurf.y, prescribedTemperature.T) annotation(
    Line(points = {{-49, 30}, {-33, 30}}, color = {0, 0, 127}));
  connect(calc_hConv.portStat, boundary.ports[1]) annotation(
    Line(points = {{10, 18}, {10, 8}}, color = {0, 127, 255}));
  connect(prescribedTemperature.port, calc_hConv.heatPort) annotation(
    Line(points = {{-10, 30}, {0, 30}}, color = {191, 0, 0}));
  connect(ramp_T_fluid.y, boundary.T_in) annotation(
    Line(points = {{-8, -30}, {6, -30}, {6, -14}}, color = {0, 0, 127}));

annotation(
    Diagram,
  experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.05));
end Block_hVerticalPlate00_test000;
