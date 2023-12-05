within HeatTransferComponents.Examples.EnergyTransportSystem;

model PWR_simple_partial_002
  extends Modelica.Icons.Example;
  //-----
  import units = Modelica.Units.SI;
  //-----
  parameter units.Area AreaHT = 295 "";
  parameter Real valMinTContour = 0;
  parameter Real valMaxTContour = 2500;
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-162, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT pump_outlet(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 275 + 273.15, nPorts = 1, p = 150*100*1000) annotation(
    Placement(visible = true, transformation(origin = {186, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T steam_generator_inlet(redeclare package Medium = Modelica.Media.Water.StandardWater, m_flow = -850, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {160, 99}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow reactor annotation(
    Placement(visible = true, transformation(origin = {-32, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {143, -80}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_mass_flow_water(significantDigits = 3, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {156, -68}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_reactor_in(redeclare package Medium = Modelica.Media.Water.StandardWater, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {123, -37}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_reactor_out(redeclare package Medium = Modelica.Media.Water.StandardWater, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {123, 31}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 temperature_wall_reactor(valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {74, -5}, extent = {{-11, -8}, {11, 8}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure_reactor_in(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {92, -44}, extent = {{-6, 6}, {6, -6}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure_reactor_out(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {92, 32}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue real_p_reactor_in(significantDigits = 6, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {94, -58}, extent = {{-13, -8}, {13, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_p_reactor_out(significantDigits = 6, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {94, 46}, extent = {{-13, -8}, {13, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_heat_reactor(duration = 1, height = 0*1e6, offset = 165*1e6, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-50, 132}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue real_p_reactor_out1(significantDigits = 6, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {65, 16}, extent = {{18, -8}, {-18, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_AreaHT(number = AreaHT, significantDigits = 6, use_numberPort = false) annotation(
    Placement(visible = true, transformation(origin = {92, 166}, extent = {{-13, -8}, {13, 8}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(visible = true, transformation(origin = {-6, -8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_Q_flow(significantDigits = 6, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-6, -32}, extent = {{-13, -8}, {13, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1/(1e6)) annotation(
    Placement(visible = true, transformation(origin = {-13, -21}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_khconv(significantDigits = 6, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {77, 144}, extent = {{-13, -8}, {13, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_hconv_reactor_LostCoolant(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-149, 7}, extent = {{-13, -9}, {13, 9}}, rotation = 0)));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 temperature_reactor_LostCoolant(valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {-144, -33}, extent = {{-12, -6}, {12, 6}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow ptHeatSrc_LostCoolant annotation(
    Placement(visible = true, transformation(origin = {-76, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT ambientAir(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 2, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {-127, -76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_ambAir(redeclare package Medium = Modelica.Media.Air.DryAirNasa, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {-131, -95}, extent = {{-11, -5}, {11, 5}}, rotation = 0)));
  HeatTransferComponents.ForcedConvection.HTflatPlateTurbSmooth01 hTflatPlate(Amech_par = 0.02, AreaHT_par = AreaHT, Len_par = 5, redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {107.8, -8.5}, extent = {{-21.5, 17.2}, {21.5, -17.2}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_khconv_reactorWall(duration = 1, height = 0, offset = 14, startTime = 2) annotation(
    Placement(visible = true, transformation(origin = {62, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  HeatTransferComponents.NaturalConvection.HTverticalPlate01 reactor_LostCoolant(AreaHT_par = AreaHT, Lc = hTflatPlate.Len_par, redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-189, -29.4}, extent = {{21, -21}, {-21, 29.4}}, rotation = 0)));
equation
  connect(massFlowRate.port_a, pump_outlet.ports[1]) annotation(
    Line(points = {{150, -80}, {176, -80}}, color = {0, 127, 255}, thickness = 1));
  connect(real_mass_flow_water.numberPort, massFlowRate.m_flow) annotation(
    Line(points = {{145.65, -68}, {142.65, -68}, {142.65, -72}}, color = {0, 0, 127}));
  connect(pressure_reactor_in.p, real_p_reactor_in.numberPort) annotation(
    Line(points = {{92, -50.6}, {79, -50.6}, {79, -58.6}}, color = {0, 0, 127}));
  connect(pressure_reactor_out.p, real_p_reactor_out.numberPort) annotation(
    Line(points = {{92, 38.6}, {79, 38.6}, {79, 46.6}}, color = {0, 0, 127}));
  connect(ramp_heat_reactor.y, reactor.Q_flow) annotation(
    Line(points = {{-50, 121}, {-50, -8}, {-42, -8}}, color = {0, 0, 127}));
  connect(reactor.port, heatFlowSensor.port_a) annotation(
    Line(points = {{-22, -8}, {-12, -8}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor.Q_flow, gain.u) annotation(
    Line(points = {{-6, -14.6}, {-6, -16.6}, {-7, -16.6}, {-7, -21.6}}, color = {0, 0, 127}));
  connect(gain.y, real_Q_flow.numberPort) annotation(
    Line(points = {{-18.5, -21}, {-21, -21}, {-21, -32}}, color = {0, 0, 127}));
  connect(ptHeatSrc_LostCoolant.Q_flow, ramp_heat_reactor.y) annotation(
    Line(points = {{-66, -30}, {-50, -30}, {-50, 121}}, color = {0, 0, 127}));
  connect(ambientAir.ports[1], temperature_ambAir.port) annotation(
    Line(points = {{-137, -76}, {-143, -76}, {-143, -96}}, color = {0, 127, 255}));
  connect(temperature_wall_reactor.heatPort, hTflatPlate.heatPort) annotation(
    Line(points = {{74, 6}, {84, 6}, {84, -8.5}, {91, -8.5}}, color = {191, 0, 0}));
  connect(real_p_reactor_out1.numberPort, hTflatPlate.y_h) annotation(
    Line(points = {{85.7, 16}, {93, 16}, {93, 13}}, color = {0, 0, 127}));
  connect(massFlowRate.port_b, hTflatPlate.port_1) annotation(
    Line(points = {{136, -80}, {136, -82}, {108, -82}, {108, -30}}, color = {0, 127, 255}, thickness = 1));
  connect(pressure_reactor_out.port, hTflatPlate.port_2) annotation(
    Line(points = {{98, 32}, {98, 30}, {108, 30}, {108, 13}}, color = {0, 127, 255}));
  connect(temperature_reactor_out.port, hTflatPlate.port_2) annotation(
    Line(points = {{112, 30.65}, {112, 28.65}, {108, 28.65}, {108, 13}}, color = {0, 127, 255}));
  connect(pressure_reactor_in.port, hTflatPlate.port_1) annotation(
    Line(points = {{98, -44}, {98, -46}, {108, -46}, {108, -30}}, color = {0, 127, 255}));
  connect(temperature_reactor_in.port, hTflatPlate.port_1) annotation(
    Line(points = {{112, -37.35}, {112, -39.35}, {108, -39.35}, {108, -30}}, color = {0, 127, 255}));
  connect(hTflatPlate.u_khconv, ramp_khconv_reactorWall.y) annotation(
    Line(points = {{92, -25}, {62, -25}, {62, -83}}, color = {0, 0, 127}));
  connect(real_khconv.numberPort, ramp_khconv_reactorWall.y) annotation(
    Line(points = {{62, 144}, {62, -83}}, color = {0, 0, 127}, pattern = LinePattern.DashDotDot));
  connect(real_hconv_reactor_LostCoolant.numberPort, reactor_LostCoolant.y_h) annotation(
    Line(points = {{-163.95, 7}, {-169.95, 7}, {-169.95, 0}}, color = {0, 0, 127}));
  connect(temperature_reactor_LostCoolant.heatPort, reactor_LostCoolant.heatPort) annotation(
    Line(points = {{-144, -21}, {-162, -21}, {-162, -31}, {-168, -31}}, color = {191, 0, 0}));
  connect(ambientAir.ports[2], reactor_LostCoolant.portStat) annotation(
    Line(points = {{-137, -76}, {-189, -76}, {-189, -50}}, color = {0, 127, 255}, thickness = 1));
  connect(reactor_LostCoolant.u_khconv, ramp_khconv_reactorWall.y) annotation(
    Line(points = {{-169, -45}, {62, -45}, {62, -83}}, color = {0, 0, 127}));
  connect(steam_generator_inlet.ports[1], hTflatPlate.port_2) annotation(
    Line(points = {{150, 100}, {108, 100}, {108, 14}}, color = {0, 127, 255}, thickness = 1));
  connect(reactor_LostCoolant.heatPort, ptHeatSrc_LostCoolant.port) annotation(
    Line(points = {{-168, -30}, {-86, -30}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor.port_b, hTflatPlate.heatPort) annotation(
    Line(points = {{0, -8}, {90, -8}}, color = {191, 0, 0}, thickness = 1));
  annotation(
    Diagram(coordinateSystem(extent = {{-220, -120}, {200, 180}}), graphics = {Text(origin = {107, 179}, extent = {{-65, 3}, {65, -3}}, textString = "Eff area of heat transfer", horizontalAlignment = TextAlignment.Left), Text(origin = {-3, -39}, extent = {{-13, 3}, {13, -3}}, textString = "[MW]"), Text(origin = {113, 165}, extent = {{-13, 3}, {13, -3}}, textString = "[m2]"), Text(origin = {106, 144}, extent = {{-13, 3}, {13, -3}}, textString = "[nond]"), Text(origin = {106, 155}, extent = {{-65, 7}, {65, -7}}, textString = "Factor on convective heat transfer coefficient"), Line(origin = {160.15, -9.05}, points = {{-17, -32}, {-17, 0}}, thickness = 1.5, arrow = {Arrow.None, Arrow.Open}), Rectangle(origin = {-155, -42}, pattern = LinePattern.Dash, extent = {{-57, 68}, {57, -68}}), Text(origin = {-161, 68}, extent = {{-39, 6}, {39, -6}}, textString = "Failure Mode"), Text(origin = {-133, 55}, extent = {{-59, 5}, {59, -5}}, textString = "Coolant water is lost.", horizontalAlignment = TextAlignment.Left), Text(origin = {-123, 45}, extent = {{-69, 8}, {69, -8}}, textString = "Only coolant supplied is ambient air.", horizontalAlignment = TextAlignment.Left), Text(origin = {-123, 35}, extent = {{-69, 7}, {69, -7}}, textString = "Heat removal is by natural convection.", horizontalAlignment = TextAlignment.Left), Text(origin = {13, 76}, extent = {{-47, 8}, {47, -8}}, textString = "Normal Operation"), Rectangle(origin = {107, 160}, pattern = LinePattern.Dash, extent = {{-70, 28}, {70, -28}}), Text(origin = {65, 200}, extent = {{-65, 8}, {65, -8}}, textString = "Key design parameters;")}),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01));
end PWR_simple_partial_002;
