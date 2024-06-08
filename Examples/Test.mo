within HeatTransferComponents.Examples;

package Test
  extends Modelica.Icons.ExamplesPackage;

  model HeatIntoFluid_tran_test01
    extends Modelica.Icons.Example;
    //-----
    parameter Real minTcontour = 270.0;
    parameter Real maxTcontour = 900.0;
    parameter Real minPcontour = 100*1000;
    parameter Real maxPcontour = 2000*1000;
    //-----
    Modelica.Fluid.Sources.MassFlowSource_T boundary(nPorts = 1, redeclare package Medium = Modelica.Media.Air.DryAirNasa, m_flow = 1, T = 288.15, use_m_flow_in = true) annotation(
      Placement(transformation(origin = {-86, -88}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, nPorts = 1, p = 1e5) annotation(
      Placement(transformation(origin = {84, -30}, extent = {{10, -10}, {-10, 10}})));
    Modelica.Fluid.Pipes.DynamicPipe pipe_HT(redeclare package Medium = Modelica.Media.Air.DryAirNasa, use_HeatTransfer = true, redeclare model HeatTransfer = Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.LocalPipeFlowHeatTransfer, nNodes = 2, modelStructure = Modelica.Fluid.Types.ModelStructure.a_v_b, length = 1, diameter = 0.1) annotation(
      Placement(transformation(origin = {4, -30}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
      Placement(transformation(origin = {-29, -39}, extent = {{-5, 5}, {5, -5}})));
    Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
      Placement(transformation(origin = {-13, -41}, extent = {{-5, 5}, {5, -5}})));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = 100000, T(start = 773.15, fixed = true)) annotation(
      Placement(transformation(origin = {-34, 76}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = 100000, T(fixed = true, start = 473.15)) annotation(
      Placement(transformation(origin = {-34, 12}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 1*200/0.1) annotation(
      Placement(transformation(origin = {-34, 33}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
    Sensors.TemperatureDispColor00 Temperature(valMin = minTcontour, valMax = maxTcontour) annotation(
      Placement(transformation(origin = {-14, 66}, extent = {{-10, -4}, {10, 4}})));
    Sensors.TemperatureDispColor00 Temperature1(valMin = minTcontour, valMax = maxTcontour) annotation(
      Placement(transformation(origin = {-14, 2}, extent = {{-10, -4}, {10, 4}})));
    Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
      Placement(transformation(origin = {-34, 50}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
    Modelica.Blocks.Sources.Ramp ramp_m_flow(height = 0.2, duration = 10, offset = 0, startTime = 100) annotation(
      Placement(transformation(origin = {-114, -80}, extent = {{-6, -6}, {6, 6}})));
    Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
      Placement(transformation(origin = {-42, -56}, extent = {{12, -8}, {-12, 8}})));
    Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
      Placement(transformation(origin = {-28, -66}, extent = {{12, -8}, {-12, 8}})));
    Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 4) annotation(
      Placement(transformation(origin = {-11, 50}, extent = {{-9, -6}, {9, 6}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
      Placement(transformation(origin = {16, 50}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor2(C = 100000, T(fixed = true, start = 773.15)) annotation(
      Placement(transformation(origin = {16, 76}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 1*200/0.1) annotation(
      Placement(transformation(origin = {16, 33}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 4) annotation(
      Placement(transformation(origin = {39, 50}, extent = {{-9, -6}, {9, 6}})));
  Sensors.TemperatureDispColor00 Temperature2(valMax = maxTcontour, valMin = minTcontour) annotation(
      Placement(transformation(origin = {36, 66}, extent = {{-10, -4}, {10, 4}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor3(C = 100000, T(fixed = true, start = 473.15)) annotation(
      Placement(transformation(origin = {16, 12}, extent = {{-10, -10}, {10, 10}})));
  Sensors.TemperatureDispColor00 Temperature3(valMax = maxTcontour, valMin = minTcontour) annotation(
      Placement(transformation(origin = {36, 2}, extent = {{-10, -4}, {10, 4}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Air.DryAirNasa)  annotation(
      Placement(transformation(origin = {-44, -30}, extent = {{-6, 6}, {6, -6}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue4(significantDigits = 4) annotation(
      Placement(transformation(origin = {-57, -43}, extent = {{9, -6}, {-9, 6}}, rotation = -0)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(nPorts = 1, redeclare package Medium = Modelica.Media.Air.DryAirNasa, use_p_in = true, T = 288.15)  annotation(
      Placement(transformation(origin = {-88, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_p_up(duration = 10, height = 50*1000, offset = 100*1000, startTime = 100) annotation(
      Placement(transformation(origin = {-114, -22}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = Modelica.Media.Air.DryAirNasa, nPorts = 1, p = 1e5) annotation(
      Placement(transformation(origin = {84, -88}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
      Placement(transformation(origin = {38, -30}, extent = {{-6, 6}, {6, -6}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue5(significantDigits = 4) annotation(
      Placement(transformation(origin = {25, -43}, extent = {{9, -6}, {-9, 6}})));
  equation
    connect(pipe_HT.port_a, pressure.port) annotation(
      Line(points = {{-6, -30}, {-29, -30}, {-29, -34}}, color = {0, 127, 255}));
    connect(pipe_HT.port_a, temperature.port) annotation(
      Line(points = {{-6, -30}, {-13, -30}, {-13, -36}}, color = {0, 127, 255}));
    connect(heatCapacitor1.port, pipe_HT.heatPorts[1]) annotation(
      Line(points = {{-34, 2}, {-34, -12}, {4, -12}, {4, -26}}, color = {191, 0, 0}));
    connect(thermalConductor.port_b, heatCapacitor1.port) annotation(
      Line(points = {{-34, 26}, {-34, 2}}, color = {191, 0, 0}));
    connect(heatCapacitor.port, Temperature.heatPort) annotation(
      Line(points = {{-34, 66}, {-24, 66}}, color = {191, 0, 0}));
    connect(heatCapacitor1.port, Temperature1.heatPort) annotation(
      Line(points = {{-34, 2}, {-24, 2}}, color = {191, 0, 0}));
    connect(heatCapacitor.port, heatFlowSensor.port_a) annotation(
      Line(points = {{-34, 66}, {-34, 56}}, color = {191, 0, 0}));
    connect(heatFlowSensor.port_b, thermalConductor.port_a) annotation(
      Line(points = {{-34, 44}, {-34, 40}}, color = {191, 0, 0}));
    connect(ramp_m_flow.y, boundary.m_flow_in) annotation(
      Line(points = {{-107.4, -80}, {-96, -80}}, color = {0, 0, 127}));
    connect(pressure.p, realValue.numberPort) annotation(
      Line(points = {{-23.5, -39}, {-23.5, -57}, {-27.5, -57}}, color = {0, 0, 127}));
    connect(temperature.T, realValue1.numberPort) annotation(
      Line(points = {{-9.5, -41}, {-9.5, -67}, {-13.5, -67}}, color = {0, 0, 127}));
    connect(heatFlowSensor.Q_flow, realValue2.numberPort) annotation(
      Line(points = {{-27.4, 50}, {-21, 50}}, color = {0, 0, 127}));
  connect(heatCapacitor2.port, heatFlowSensor1.port_a) annotation(
      Line(points = {{16, 66}, {16, 56}}, color = {191, 0, 0}));
  connect(heatCapacitor2.port, Temperature2.heatPort) annotation(
      Line(points = {{16, 66}, {26, 66}}, color = {191, 0, 0}));
  connect(heatFlowSensor1.port_b, thermalConductor1.port_a) annotation(
      Line(points = {{16, 44}, {16, 40}}, color = {191, 0, 0}));
  connect(thermalConductor1.port_b, heatCapacitor3.port) annotation(
      Line(points = {{16, 26}, {16, 2}}, color = {191, 0, 0}));
  connect(heatFlowSensor1.Q_flow, realValue3.numberPort) annotation(
      Line(points = {{22, 50}, {29, 50}}, color = {0, 0, 127}));
  connect(Temperature3.heatPort, heatCapacitor3.port) annotation(
      Line(points = {{26, 2}, {16, 2}}, color = {191, 0, 0}));
  connect(heatCapacitor3.port, pipe_HT.heatPorts[2]) annotation(
      Line(points = {{16, 2}, {16, -12}, {4, -12}, {4, -26}}, color = {191, 0, 0}));
  connect(massFlowRate.m_flow, realValue4.numberPort) annotation(
      Line(points = {{-44, -36.6}, {-44, -43}, {-47, -43}}, color = {0, 0, 127}));
  connect(ramp_p_up.y, boundary2.p_in) annotation(
      Line(points = {{-107.4, -22}, {-99.4, -22}}, color = {0, 0, 127}));
  connect(boundary.ports[1], boundary3.ports[1]) annotation(
      Line(points = {{-76, -88}, {74, -88}}, color = {0, 127, 255}));
  connect(massFlowRate1.m_flow, realValue5.numberPort) annotation(
      Line(points = {{38, -36}, {38, -42}, {36, -42}}, color = {0, 0, 127}));
  connect(massFlowRate.port_b, pipe_HT.port_a) annotation(
      Line(points = {{-38, -30}, {-6, -30}}, color = {0, 127, 255}));
  connect(massFlowRate.port_a, boundary2.ports[1]) annotation(
      Line(points = {{-50, -30}, {-78, -30}}, color = {0, 127, 255}));
  connect(pipe_HT.port_b, massFlowRate1.port_a) annotation(
      Line(points = {{14, -30}, {32, -30}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, boundary1.ports[1]) annotation(
      Line(points = {{44, -30}, {74, -30}}, color = {0, 127, 255}));
    annotation(
      experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 0.01),
  Diagram(coordinateSystem(extent = {{-120, -100}, {120, 100}})));
  end HeatIntoFluid_tran_test01;
end Test;
