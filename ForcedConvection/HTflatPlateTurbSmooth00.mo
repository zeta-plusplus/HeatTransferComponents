within HeatTransferComponents.ForcedConvection;

model HTflatPlateTurbSmooth00
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
  parameter units.Length Len_par=0.2 "length of plate";
  parameter units.Area Amech_par= Modelica.Constants.pi/4*0.1^2 "pseudo flow mechanical area";
  parameter units.Area AreaHT_par= 0.2*1 "area of heat transfer";
  //----------------------------------------
  // variables
  //----------------------------------------
  units.MassFlowRate m_flow_max "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.MassFlowRate m_flow_min "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.MassFlowRate m_flow_abs "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  //
  Real Re;
  Real Pr_b;
  units.Temperature T_bulkMean;
  units.KinematicViscosity mu_b;
  units.KinematicViscosity mu_s;
  Real Nu;
  units.ThermalConductivity k_b;
  units.Velocity Vel;
  units.HeatFlowRate Q_flow;
  units.HeatFlowRate Q_flow_unheatedFluid;
  units.HeatFlowRate Q_flow_heatedFluid;
  units.CoefficientOfHeatTransfer h_HT;
  //----------------------------------------
  // internal objects
  //----------------------------------------
  Medium.BaseProperties fluid(p(min = 0.0 + 1.0e-10), T(min = 0.0 + 1.0e-10), h(min = 0.0 + 1.0e-10)) "";
  Medium.BaseProperties fluidHeated(p(min = 0.0 + 1.0e-10), T(min = 0.0 + 1.0e-10), h(min = 0.0 + 1.0e-10)) "";
  Medium.BaseProperties fluidStat(p(min = 0.0 + 1.0e-10), T(min = 0.0 + 1.0e-10), h(min = 0.0 + 1.0e-10)) "";
  //----------------------------------------
  // interface
  //----------------------------------------
  Modelica.Blocks.Interfaces.RealOutput y_h(quantity= "CoefficientOfHeatTransfer", unit="W/(m2.K)", displayUnit="W/(m2.K)") annotation(
    Placement(visible = true, transformation(origin = {110, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -70}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium=Medium) annotation(
    Placement(visible = true, transformation(origin = {-100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium=Medium) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_T_fluid1(quantity = "ThermodynamicTemperature", unit = "K", displayUnit = "degC") annotation(
    Placement(visible = true, transformation(origin = {-106, 54}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-93, 40}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_T_fluid2(displayUnit = "degC", quantity = "ThermodynamicTemperature", unit = "K") annotation(
    Placement(visible = true, transformation(origin = {110, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {93, 40}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_Q_flow(displayUnit = "W", quantity = "Power", unit = "W") annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {103, -40}, extent = {{7, -7}, {-7, 7}}, rotation = 180)));
equation
//
  heatPort.Q_flow = Q_flow;
// -- distinguish inlet side --
  m_flow_max = max(port_1.m_flow, port_2.m_flow);
  m_flow_min = min(port_1.m_flow, port_2.m_flow);
//
  if m_flow_max == port_1.m_flow then
    m_flow_abs= port_1.m_flow;
    port_1.h_outflow = fluid.h;
    port_1.Xi_outflow = fluid.Xi;
    fluid.p = port_1.p;
    fluid.h = actualStream(port_1.h_outflow);
    fluid.Xi = actualStream(port_1.Xi_outflow);
    port_2.p= fluidHeated.p;
    //---
    port_2.h_outflow= fluidHeated.h;
    y_T_fluid1=fluid.T;
    y_T_fluid2=fluidHeated.T;
  elseif m_flow_max == port_2.m_flow then
    m_flow_abs= port_2.m_flow;
    port_2.h_outflow = fluid.h;
    port_2.Xi_outflow = fluid.Xi;
    fluid.p = port_2.p;
    fluid.h = actualStream(port_2.h_outflow);
    fluid.Xi = actualStream(port_2.Xi_outflow);
    port_1.p= fluidHeated.p;
    //---
    port_1.h_outflow= fluidHeated.h;
    y_T_fluid1=fluidHeated.T;
    y_T_fluid2=fluid.T;
  else
    m_flow_abs= port_1.m_flow;
    port_1.h_outflow = fluid.h;
    port_1.Xi_outflow = fluid.Xi;
    fluid.p = port_1.p;
    fluid.h = actualStream(port_1.h_outflow);
    fluid.Xi = actualStream(port_1.Xi_outflow);
    port_2.p= fluidHeated.p;
    //---
    port_2.h_outflow= fluidHeated.h;
    y_T_fluid1=fluid.T;
    y_T_fluid2=fluidHeated.T;
  end if;
//-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  port_1.C_outflow = inStream(port_2.C_outflow);
  port_2.C_outflow = inStream(port_1.C_outflow);
//
  fluidHeated.p= fluid.p;
  fluidHeated.Xi= fluid.Xi;
//
  T_bulkMean= (fluid.T+heatPort.T)/2.0;
// -- total <-> static --
  fluidStat.h = fluid.h - 1.0 / 2.0 * (sign(Vel) * abs(Vel) ^ 2.0);
  fluid.h = Medium.isentropicEnthalpy(fluid.p, fluidStat.state);
//
  m_flow_abs= fluidStat.d*Vel*Amech_par;
//
  Pr_b= Medium.prandtlNumber(Medium.setState_pTX(fluid.p, T_bulkMean, fluid.X));
  mu_b= Medium.dynamicViscosity(Medium.setState_pTX(fluid.p, T_bulkMean, fluid.X))*Medium.density(Medium.setState_pTX(fluid.p, T_bulkMean, fluid.X));
  k_b= Medium.thermalConductivity(Medium.setState_pTX(fluid.p, T_bulkMean, fluid.X));
  mu_s= Medium.dynamicViscosity(Medium.setState_pTX(fluid.p, heatPort.T, fluid.X))*Medium.density(Medium.setState_pTX(fluid.p, heatPort.T, fluid.X));
  Re= Medium.density(Medium.setState_pTX(fluid.p, T_bulkMean, fluid.X))*Vel*Len_par/mu_b;
//
  Nu= 0.037*Re^(0.8)*Pr_b^(1.0/3.0);
  h_HT= Nu*k_b/Len_par;
  Q_flow_unheatedFluid= AreaHT_par*h_HT*(heatPort.T-fluid.T);
  Q_flow_heatedFluid= AreaHT_par*h_HT*(heatPort.T-fluidHeated.T);
  Q_flow= Q_flow_heatedFluid;
  fluid.h*m_flow_abs + Q_flow - fluidHeated.h*m_flow_abs=0.0;
//
  y_Q_flow= Q_flow;
  y_h= h_HT;
  //
annotation(
    defaultComponentName ="HTflatPlate",
    Icon(graphics = {Text(origin = {0, 64}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Rectangle(origin = {1, -40}, fillColor = {0, 0, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-95, 6}, {95, -6}}), Line(origin = {0.631866, -58.1429}, points = {{0, 16}, {0, -16}}, color = {255, 0, 0}, thickness = 4), Line(origin = {1.24796, 12.0219}, points = {{-72.9926, -8.98625}, {-52.9926, 1.01375}, {-34.9926, 7.0138}, {-12.9926, 5.01375}, {15.0074, -8.98625}, {37.0074, -8.9862}, {53.0074, -2.98625}, {73.0074, 1.01375}}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 7), Line(origin = {-80, -29}, points = {{0, -9}, {0, 21}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-59.7132, -28.7709}, points = {{0, -9}, {0, 21}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-40.1366, -28.2201}, points = {{0, -9}, {0, 21}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {-20.3339, -28.7967}, points = {{0, -9}, {0, 21}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {0.242731, -28.5995}, points = {{0, -9}, {0, 21}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {20.3034, -29.0486}, points = {{0, -9}, {0, 21}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {40.3034, -29.0486}, points = {{0, -9}, {0, 21}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {59.88, -28.9181}, points = {{0, -9}, {0, 21}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {80.1987, -28.8513}, points = {{0, -9}, {0, 21}}, color = {255, 0, 0}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5)}, coordinateSystem(extent = {{-100, -80}, {100, 80}})));
end HTflatPlateTurbSmooth00;
