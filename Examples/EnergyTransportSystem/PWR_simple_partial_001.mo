within HeatTransferComponents.Examples.EnergyTransportSystem;

model PWR_simple_partial_001
  extends Modelica.Icons.Example;
  //-----
  import units = Modelica.Units.SI;
  //-----
  parameter units.Area AreaHT = 100 "";
  parameter Real khconv = 20.0 "";
  parameter Real valMinTContour = 0;
  parameter Real valMaxTContour = 2500;
  //-----
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-162, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT pump_outlet(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 275 + 273.15, nPorts = 1, p = 150*100*1000) annotation(
    Placement(visible = true, transformation(origin = {146, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HeatTransferComponents.ForcedConvection.HTflatPlateTurbSmooth00 hTflatPlate(Amech_par = 0.02, AreaHT_par = AreaHT, Len_par = 5, redeclare package Medium = Modelica.Media.Water.StandardWater, khconv = khconv) annotation(
    Placement(visible = true, transformation(origin = {67.8, -6.25}, extent = {{-22.25, 17.8}, {22.25, -17.8}}, rotation = 90)));
  Modelica.Fluid.Sources.MassFlowSource_T steam_generator_inlet(redeclare package Medium = Modelica.Media.Water.StandardWater, m_flow = -980, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {120, 53}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow reactor annotation(
    Placement(visible = true, transformation(origin = {-32, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {103, -80}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_mass_flow_water(significantDigits = 3, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {116, -68}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_reactor_in(redeclare package Medium = Modelica.Media.Water.StandardWater, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {83, -39}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_reactor_out(redeclare package Medium = Modelica.Media.Water.StandardWater, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {83, 31}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 temperature_wall_reactor(valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {30, -5}, extent = {{-11, -8}, {11, 8}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure_reactor_in(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {52, -34}, extent = {{-6, 6}, {6, -6}}, rotation = -90)));
  Modelica.Fluid.Sensors.Pressure pressure_reactor_out(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {52, 32}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue real_p_reactor_in(significantDigits = 6, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {54, -48}, extent = {{-13, -8}, {13, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_p_reactor_out(significantDigits = 6, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {54, 46}, extent = {{-13, -8}, {13, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_heat_reactor(duration = 1, height = 0*1e6, offset = 165*1e6, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-50, 132}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue real_p_reactor_out1(significantDigits = 6, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {25, 16}, extent = {{18, -8}, {-18, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_AreaHT(number = AreaHT, significantDigits = 6, use_numberPort = false) annotation(
    Placement(visible = true, transformation(origin = {92, 132}, extent = {{-13, -8}, {13, 8}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(visible = true, transformation(origin = {-6, -6}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_Q_flow(significantDigits = 6, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-6, -30}, extent = {{-13, -8}, {13, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1/(1e6)) annotation(
    Placement(visible = true, transformation(origin = {-13, -19}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_khconv(number = khconv, significantDigits = 6, use_numberPort = false) annotation(
    Placement(visible = true, transformation(origin = {92, 110}, extent = {{-13, -8}, {13, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_hconv_reactor_LostCoolant(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-113, 7}, extent = {{-13, -9}, {13, 9}}, rotation = 0)));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 temperature_reactor_LostCoolant(valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {-108, -33}, extent = {{-12, -6}, {12, 6}}, rotation = -90)));
  HeatTransferComponents.NaturalConvection.HTverticalPlate00 reactor_LostCoolant(AreaHT_par = AreaHT, Lc = hTflatPlate.Len_par, redeclare package Medium = Modelica.Media.Air.DryAirNasa, khconv = khconv) annotation(
    Placement(visible = true, transformation(origin = {-146, -29.6667}, extent = {{20.3334, -20.3333}, {-20.3334, 28.4667}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow ptHeatSrc_LostCoolant annotation(
    Placement(visible = true, transformation(origin = {-82, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT ambientAir(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 2, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {-91, -76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_ambAir(redeclare package Medium = Modelica.Media.Air.DryAirNasa, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {-95, -95}, extent = {{-11, -5}, {11, 5}}, rotation = 0)));
equation
  connect(steam_generator_inlet.ports[1], hTflatPlate.port_2) annotation(
    Line(points = {{110, 53}, {68, 53}, {68, 16}}, color = {0, 127, 255}, thickness = 1));
  connect(massFlowRate.port_a, pump_outlet.ports[1]) annotation(
    Line(points = {{110, -80}, {136, -80}}, color = {0, 127, 255}, thickness = 1));
  connect(massFlowRate.port_b, hTflatPlate.port_1) annotation(
    Line(points = {{96, -80}, {68, -80}, {68, -28.5}}, color = {0, 127, 255}, thickness = 1));
  connect(real_mass_flow_water.numberPort, massFlowRate.m_flow) annotation(
    Line(points = {{105.65, -68}, {102.65, -68}, {102.65, -72}}, color = {0, 0, 127}));
  connect(temperature_reactor_in.port, hTflatPlate.port_1) annotation(
    Line(points = {{72, -39.35}, {68, -39.35}, {68, -28.35}}, color = {0, 127, 255}));
  connect(temperature_reactor_out.port, hTflatPlate.port_2) annotation(
    Line(points = {{72, 30.65}, {68, 30.65}, {68, 15.65}}, color = {0, 127, 255}));
  connect(hTflatPlate.heatPort, temperature_wall_reactor.heatPort) annotation(
    Line(points = {{50, -6.25}, {39, -6.25}, {39, 5.75}, {30, 5.75}}, color = {191, 0, 0}));
  connect(pressure_reactor_in.port, hTflatPlate.port_1) annotation(
    Line(points = {{58, -34}, {68, -34}, {68, -28}}, color = {0, 127, 255}));
  connect(pressure_reactor_out.port, hTflatPlate.port_2) annotation(
    Line(points = {{58, 32}, {68, 32}, {68, 16}}, color = {0, 127, 255}));
  connect(pressure_reactor_in.p, real_p_reactor_in.numberPort) annotation(
    Line(points = {{52, -40.6}, {39, -40.6}, {39, -48.6}}, color = {0, 0, 127}));
  connect(pressure_reactor_out.p, real_p_reactor_out.numberPort) annotation(
    Line(points = {{52, 38.6}, {39, 38.6}, {39, 46.6}}, color = {0, 0, 127}));
  connect(ramp_heat_reactor.y, reactor.Q_flow) annotation(
    Line(points = {{-50, 121}, {-50, -6}, {-42, -6}}, color = {0, 0, 127}));
  connect(real_p_reactor_out1.numberPort, hTflatPlate.y_h) annotation(
    Line(points = {{46, 16}, {51.95, 16}}, color = {0, 0, 127}));
  connect(reactor.port, heatFlowSensor.port_a) annotation(
    Line(points = {{-22, -6}, {-12, -6}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor.port_b, hTflatPlate.heatPort) annotation(
    Line(points = {{0, -6}, {50, -6}}, color = {191, 0, 0}, thickness = 1));
  connect(heatFlowSensor.Q_flow, gain.u) annotation(
    Line(points = {{-6, -12.6}, {-6, -14.6}, {-7, -14.6}, {-7, -19.6}}, color = {0, 0, 127}));
  connect(gain.y, real_Q_flow.numberPort) annotation(
    Line(points = {{-18.5, -19}, {-21, -19}, {-21, -30}}, color = {0, 0, 127}));
  connect(temperature_reactor_LostCoolant.heatPort, reactor_LostCoolant.heatPort) annotation(
    Line(points = {{-108, -21}, {-120, -21}, {-120, -30}, {-126, -30}}, color = {191, 0, 0}));
  connect(real_hconv_reactor_LostCoolant.numberPort, reactor_LostCoolant.y_h) annotation(
    Line(points = {{-127.95, 7}, {-127.95, -1}}, color = {0, 0, 127}));
  connect(reactor_LostCoolant.heatPort, ptHeatSrc_LostCoolant.port) annotation(
    Line(points = {{-125.667, -29.87}, {-91.659, -29.87}}, color = {191, 0, 0}, thickness = 1));
  connect(ptHeatSrc_LostCoolant.Q_flow, ramp_heat_reactor.y) annotation(
    Line(points = {{-72, -30}, {-50, -30}, {-50, 121}}, color = {0, 0, 127}));
  connect(reactor_LostCoolant.portStat, ambientAir.ports[1]) annotation(
    Line(points = {{-146, -50}, {-146, -76}, {-100, -76}}, color = {0, 127, 255}, thickness = 1));
  connect(ambientAir.ports[2], temperature_ambAir.port) annotation(
    Line(points = {{-101, -76}, {-107, -76}, {-107, -96}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-220, -120}, {200, 180}}), graphics = {Text(origin = {107, 145}, extent = {{-65, 3}, {65, -3}}, textString = "Eff area of heat transfer", horizontalAlignment = TextAlignment.Left), Text(origin = {-3, -39}, extent = {{-13, 3}, {13, -3}}, textString = "[MW]"), Text(origin = {113, 131}, extent = {{-13, 3}, {13, -3}}, textString = "[m2]"), Text(origin = {116, 110}, extent = {{-13, 3}, {13, -3}}, textString = "[nond]"), Text(origin = {106, 121}, extent = {{-65, 7}, {65, -7}}, textString = "Factor on convective heat transfer coefficient"), Line(origin = {120.15, -9.05}, points = {{-17, -32}, {-17, 0}}, thickness = 1.5, arrow = {Arrow.None, Arrow.Open}), Rectangle(origin = {-119, -42}, pattern = LinePattern.Dash, extent = {{-57, 68}, {57, -68}}), Text(origin = {-161, 68}, extent = {{-39, 6}, {39, -6}}, textString = "Failure Mode"), Text(origin = {-133, 55}, extent = {{-59, 5}, {59, -5}}, textString = "Coolant water is lost.", horizontalAlignment = TextAlignment.Left), Text(origin = {-123, 45}, extent = {{-69, 8}, {69, -8}}, textString = "Only coolant supplied is ambient air.", horizontalAlignment = TextAlignment.Left), Text(origin = {-123, 35}, extent = {{-69, 7}, {69, -7}}, textString = "Heat removal is by natural convection.", horizontalAlignment = TextAlignment.Left), Text(origin = {13, 76}, extent = {{-47, 8}, {47, -8}}, textString = "Normal Operation"), Rectangle(origin = {107, 126}, pattern = LinePattern.Dash, extent = {{-70, 28}, {70, -28}}), Text(origin = {65, 166}, extent = {{-65, 8}, {65, -8}}, textString = "Key design parameters;")}),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01));
end PWR_simple_partial_001;
