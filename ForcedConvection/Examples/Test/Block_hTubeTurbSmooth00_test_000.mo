within HeatTransferComponents.ForcedConvection.Examples.Test;

model Block_hTubeTurbSmooth00_test_000
  extends Modelica.Icons.Example;
  //----------
  //replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = liquid1
  replaceable package gas1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = gas1
  //----------
  HeatTransferComponents.ForcedConvection.Block_hTubeTurbSmooth00 calc_hConv(redeclare package Medium = gas1, diam = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear(redeclare package Medium = gas1, dp_nominal(displayUnit = "kPa") = 400000, m_flow_nominal = 2) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = gas1, T = 500, nPorts = 1, p = 500*1000) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = gas1, T = 288.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {76, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
    Placement(visible = true, transformation(origin = {-10, 42}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_Tsurf(duration = 1, height = 0, offset = 700, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-86, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 1, height = -0.5, offset = 1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {30, 44}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(boundary.ports[1], calc_hConv.port_1) annotation(
    Line(points = {{-40, 10}, {-20, 10}}, color = {0, 127, 255}));
  connect(calc_hConv.port_2, valveLinear.port_a) annotation(
    Line(points = {{0, 10}, {20, 10}}, color = {0, 127, 255}));
  connect(valveLinear.port_b, boundary1.ports[1]) annotation(
    Line(points = {{40, 10}, {66, 10}}, color = {0, 127, 255}));
  connect(prescribedTemperature.port, calc_hConv.heatPort) annotation(
    Line(points = {{-10, 32}, {-10, 18}}, color = {191, 0, 0}));
  connect(ramp_Tsurf.y, prescribedTemperature.T) annotation(
    Line(points = {{-18, 70}, {-10, 70}, {-10, 54}}, color = {0, 0, 127}));
  connect(ramp_valve.y, valveLinear.opening) annotation(
    Line(points = {{30, 34}, {30, 18}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.05));
end Block_hTubeTurbSmooth00_test_000;
