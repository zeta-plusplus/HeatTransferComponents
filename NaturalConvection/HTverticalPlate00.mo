within HeatTransferComponents.NaturalConvection;

model HTverticalPlate00
  //----------------------------------------
  // import
  //----------------------------------------
  import units = Modelica.Units.SI;
  //----------------------------------------
  // replaceable
  //----------------------------------------
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium "Medium in the component" annotation(
    choicesAllMatching = true);
  //----------------------------------------
  // parameters
  //----------------------------------------
  parameter units.Length Lc = 1.0;
  parameter units.Area AreaHT_par= 0.2*1 "area of heat transfer";
  parameter units.Acceleration grav=9.81;
  parameter Real khconv=1.0 "factor on heat convection coefficient, for correlation study, parmeter study";
  
  
  //----------------------------------------
  // variables
  //----------------------------------------
  Real Pr_b;
  units.KinematicViscosity mu_b;
  units.KinematicViscosity mu_s;
  units.DynamicViscosity nu_b;
  Real Nu;
  Real GrL;
  Real RaL;
  units.ThermalConductivity k_b;
  Real beta_b;
  units.HeatFlowRate Q_flow;
  units.CoefficientOfHeatTransfer h_HT;
  
  
  //----------------------------------------
  // internal objects
  //----------------------------------------
  Medium.BaseProperties fluid(p(min = 0.0 + 1.0e-10), T(min = 0.0 + 1.0e-10), h(min = 0.0 + 1.0e-10)) "";
  Medium.BaseProperties fluid_surf(p(min = 0.0 + 1.0e-10), T(min = 0.0 + 1.0e-10), h(min = 0.0 + 1.0e-10)) "";
  Medium.BaseProperties fluid_bulkMean(p(min = 0.0 + 1.0e-10), T(min = 0.0 + 1.0e-10), h(min = 0.0 + 1.0e-10)) "";
  //----------------------------------------
  // interface
  //----------------------------------------
  Modelica.Blocks.Interfaces.RealOutput y_h(quantity = "CoefficientOfHeatTransfer", unit = "W/(m2.K)", displayUnit = "W/(m2.K)") annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 140}, extent = {{7, -7}, {-7, 7}}, rotation = -90)));
  Modelica.Fluid.Interfaces.FluidPort_a portStat(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -1}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_T_fluid(quantity = "ThermodynamicTemperature", unit = "K", displayUnit = "degC") annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {56, -100}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealOutput y_Q_flow(quantity="Power", unit="W", displayUnit="W") annotation(
    Placement(visible = true, transformation(origin = {110, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-53, 143}, extent = {{7, -7}, {-7, 7}}, rotation = -90)));
equation
//
  heatPort.Q_flow = Q_flow;
//
  portStat.h_outflow = Medium.h_default;
  portStat.Xi_outflow = Medium.X_default[1:Medium.nXi];
  portStat.C_outflow = zeros(Medium.nC);
  portStat.m_flow=0.0;
  fluid.p= portStat.p;
  fluid.h= inStream(portStat.h_outflow);
//
  fluid_surf.p = fluid.p;
  fluid_surf.T = heatPort.T;
  fluid_surf.Xi = fluid.Xi;
//
  fluid_bulkMean.p = fluid.p;
  fluid_bulkMean.T = (fluid.T + fluid_surf.T)/2.0;
  fluid_bulkMean.Xi = fluid.Xi;
//
  Pr_b = Medium.prandtlNumber(fluid_bulkMean.state);
  nu_b= Medium.dynamicViscosity(fluid_bulkMean.state);
  mu_b = Medium.dynamicViscosity(fluid_bulkMean.state)*fluid_bulkMean.d;
  k_b = Medium.thermalConductivity(fluid_bulkMean.state);
  mu_s = Medium.dynamicViscosity(fluid_surf.state)*fluid_surf.d;
  beta_b= Medium.isobaricExpansionCoefficient(fluid_bulkMean.state);
//
  GrL= (grav*beta_b*(fluid_surf.T-fluid.T)*Lc^3)/(nu_b^2);
  RaL= GrL*Pr_b;
  Nu= (0.825+(0.387*RaL^(1.0/6.0))/(1.0+(0.492/Pr_b)^(9.0/16.0))^(8.0/27.0))^(2.0);
//
  h_HT = khconv*Nu*k_b/Lc;
  Q_flow= h_HT*AreaHT_par*(heatPort.T-fluid.T);
  //
  y_Q_flow=Q_flow;
  y_h= h_HT;
  y_T_fluid= fluid.T;
//
  annotation(
    defaultComponentName = "HTverticalPlate",
  Icon(graphics = {Text(origin = {90, 20}, rotation = -90, extent = {{-120, 10}, {120, -10}}, textString = "%name"), Line(origin = {-99.401, 15.5933}, points = {{44, -16}, {0, -16}}, color = {255, 0, 0}, thickness = 4), Rectangle(origin = {-53, 18}, fillColor = {0, 0, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-7, 118}, {7, -118}}), Line(origin = {-24.18, -34.18}, points = {{-11.8178, -51.8178}, {2.18219, -35.8178}, {8.18219, 2.18219}, {8.18219, 46.1822}}, arrow = {Arrow.None, Arrow.Open}), Line(origin = {27.2, -36.2}, points = {{10.7958, -47.7958}, {-1.2042, -37.7958}, {-11.2042, 2.2042}, {-11.2042, 48.2042}}, arrow = {Arrow.None, Arrow.Open}), Line(origin = {1, -37}, points = {{-1, -43}, {-1, 49}}, arrow = {Arrow.None, Arrow.Open}), Line(origin = {-32.2247, 129.413}, points = {{-18, -9}, {12, -9}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-32.2247, 109.413}, points = {{-18, -9}, {12, -9}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-32.2247, 89.413}, points = {{-18, -9}, {12, -9}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-32.2247, 69.413}, points = {{-18, -9}, {12, -9}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-32.2247, 49.413}, points = {{-18, -9}, {12, -9}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-32.2247, 29.413}, points = {{-18, -9}, {12, -9}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-32.2247, 9.413}, points = {{-18, -9}, {12, -9}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-32.2247, -10.587}, points = {{-18, -9}, {12, -9}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-32.2247, -30.587}, points = {{-18, -9}, {12, -9}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-32.2247, -50.587}, points = {{-18, -9}, {12, -9}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-32.2247, -70.587}, points = {{-18, -9}, {12, -9}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-32.2247, -90.587}, points = {{-18, -9}, {12, -9}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5)}, coordinateSystem(extent = {{-100, -100}, {100, 140}})),
  Diagram(coordinateSystem(extent = {{-100, -100}, {100, 140}})));
end HTverticalPlate00;
