within HeatTransferComponents.ForcedConvection;

model Block_hTubeTurbSmooth00
  //----------------------------------------
  // import
  //----------------------------------------
  import units= Modelica.Units.SI;  
//----------------------------------------
  // replaceable
  //----------------------------------------
  replaceable package Medium =
      Modelica.Media.Interfaces.PartialMedium "Medium in the component"
      annotation (choicesAllMatching = true);
  //----------------------------------------
  // parameters
  //----------------------------------------
  parameter units.Length diam=0.1;
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
  Medium.BaseProperties fluidStat(p(min = 0.0 + 1.0e-10), T(min = 0.0 + 1.0e-10), h(min = 0.0 + 1.0e-10)) "";
  Medium.BaseProperties fluid_surf(p(min = 0.0 + 1.0e-10), T(min = 0.0 + 1.0e-10), h(min = 0.0 + 1.0e-10)) "";
  Medium.BaseProperties fluid_bulkMean(p(min = 0.0 + 1.0e-10), T(min = 0.0 + 1.0e-10), h(min = 0.0 + 1.0e-10)) "";
  //----------------------------------------
  // interface
  //----------------------------------------
  Modelica.Blocks.Interfaces.RealOutput y_h(quantity= "CoefficientOfHeatTransfer", unit="W/(m2.K)", displayUnit="W/(m2.K)") annotation(
    Placement(visible = true, transformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium=Medium) annotation(
    Placement(visible = true, transformation(origin = {-100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort annotation(
    Placement(visible = true, transformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 79}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium=Medium) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//
  heatPort.Q_flow = 0;
// -- distinguish inlet side --
  m_flow_max = max(port_1.m_flow, port_2.m_flow);
  m_flow_min = min(port_1.m_flow, port_2.m_flow);
//
  if m_flow_max == port_1.m_flow then
    m_flow= port_1.m_flow;
    port_1.h_outflow = fluid.h;
    port_1.Xi_outflow = fluid.Xi;
    fluid.p = port_1.p;
    fluid.h = actualStream(port_1.h_outflow);
    fluid.Xi = actualStream(port_1.Xi_outflow);
    port_2.p= fluid.p;
    port_2.h_outflow= fluid.h;
  elseif m_flow_max == port_2.m_flow then
    m_flow= port_2.m_flow;
    port_2.h_outflow = fluid.h;
    port_2.Xi_outflow = fluid.Xi;
    fluid.p = port_2.p;
    fluid.h = actualStream(port_2.h_outflow);
    fluid.Xi = actualStream(port_2.Xi_outflow);
    port_1.p= fluid.p;
    port_1.h_outflow= fluid.h;
  else
    m_flow= port_1.m_flow;
    port_1.h_outflow = fluid.h;
    port_1.Xi_outflow = fluid.Xi;
    fluid.p = port_1.p;
    fluid.h = actualStream(port_1.h_outflow);
    fluid.Xi = actualStream(port_1.Xi_outflow);
    port_2.p= fluid.p;
    port_2.h_outflow= fluid.h;
  end if;
//-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  port_1.C_outflow = inStream(port_2.C_outflow);
  port_2.C_outflow = inStream(port_1.C_outflow);
//
  fluid_surf.p= fluid.p;
  fluid_surf.T= heatPort.T;
  fluid_surf.Xi= fluid.Xi;
//
  fluid_bulkMean.p= fluid.p;
  fluid_bulkMean.T= (fluid.T+fluid_surf.T)/2.0;
  fluid_bulkMean.Xi= fluid.Xi;
// -- total <-> static --
  fluidStat.h = fluid.h - 1.0 / 2.0 * (sign(Vel) * abs(Vel) ^ 2.0);
  fluid.h = Medium.isentropicEnthalpy(fluid.p, fluidStat.state);
//
  Amech= Modelica.Constants.pi/4*diam^2.0;
  m_flow= fluidStat.d*Vel*Amech;
//
  Pr_b= Medium.prandtlNumber(fluid_bulkMean.state);
  mu_b= Medium.dynamicViscosity(fluid_bulkMean.state)*fluid_bulkMean.d;
  k_b= Medium.thermalConductivity(fluid_bulkMean.state);
  mu_s= Medium.dynamicViscosity(fluid_surf.state)*fluid_surf.d;
  Re= fluid_bulkMean.d*Vel*diam/mu_b;
//
  Nu= 0.027*Re^(0.8)*Pr_b^(1.0/3.0)*(mu_b/mu_s)^(0.14);
//
  y_h= Nu*k_b/diam;
  //
annotation(
    defaultComponentName ="calc_hConv",
    Icon(graphics = {Text(origin = {0, -56}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Rectangle(fillColor = {0, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 40}, {100, -40}}), Line(origin = {-0.4, 58.2}, points = {{0, 16}, {0, -16}}, color = {255, 0, 0}, thickness = 4), Line(origin = {71.2506, 56.86}, points = {{-11, 3}, {-11, 23}}, thickness = 1.5), Line(origin = {29.41, 61.67}, points = {{-29, -21}, {31, -1}}, thickness = 1.5), Line(origin = {-91.97, 8.81}, points = {{12, 29}, {12, 9}}, color = {255, 0, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-71.97, 8.81}, points = {{12, 29}, {12, 9}}, color = {255, 0, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-51.97, 8.81}, points = {{12, 29}, {12, 9}}, color = {255, 0, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-31.97, 8.81}, points = {{12, 29}, {12, 9}}, color = {255, 0, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-11.97, 8.81}, points = {{12, 29}, {12, 9}}, color = {255, 0, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {8.03, 8.81}, points = {{12, 29}, {12, 9}}, color = {255, 0, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {28.03, 8.81}, points = {{12, 29}, {12, 9}}, color = {255, 0, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {48.03, 8.81}, points = {{12, 29}, {12, 9}}, color = {255, 0, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {68.03, 8.81}, points = {{12, 29}, {12, 9}}, color = {255, 0, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5)}, coordinateSystem(extent = {{-100, -80}, {100, 80}})));
end Block_hTubeTurbSmooth00;
