within HeatTransferComponents.NaturalConvection;

model Block_hVerticalPlate00
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
  parameter units.Length diam = 0.1;
  //----------------------------------------
  // variables
  //----------------------------------------
  units.MassFlowRate m_flow_max "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.MassFlowRate m_flow_min "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.MassFlowRate m_flow "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  //
  units.Area Amech;
  Real Re;
  Real Pr_b;
  units.KinematicViscosity mu_b;
  units.KinematicViscosity mu_s;
  Real Nu;
  units.ThermalConductivity k_b;
  units.Velocity Vel;
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
    Placement(visible = true, transformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort annotation(
    Placement(visible = true, transformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 79}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//
  heatPort.Q_flow = 0;
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
  mu_b = Medium.dynamicViscosity(fluid_bulkMean.state)*fluid_bulkMean.d;
  k_b = Medium.thermalConductivity(fluid_bulkMean.state);
  mu_s = Medium.dynamicViscosity(fluid_surf.state)*fluid_surf.d;
  Re = fluid_bulkMean.d*Vel*diam/mu_b;
  Nu = 0.027*Re^(0.8)*Pr_b^(1.0/3.0)*(mu_b/mu_s)^(0.14);
  y_h = Nu*k_b/diam;
  annotation(
    defaultComponentName = "calc_hConv",
    Icon(graphics = {Text(origin = {2, -92}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Line(origin = {-11.6397, 28.6959}, points = {{0, 16}, {0, -16}}, color = {255, 0, 0}, thickness = 4)}, coordinateSystem(extent = {{-100, -80}, {100, 80}})));
end Block_hVerticalPlate00;
