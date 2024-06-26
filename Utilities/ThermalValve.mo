within HeatTransferComponents.Utilities;

model ThermalValve
  
  /********************************************************
        imports
  ********************************************************/
  import Modelica.Constants;
  import units=Modelica.Units.SI;
  import unitsNonSI=Modelica.Units.NonSI;
  import unitConversions=Modelica.Units.Conversions;
  
  
  /********************************************************
            Declaration
  ********************************************************/
  //********** Parameters **********
  parameter units.Temperature dT_fullOpen_par=0.001 "";
  parameter Modelica.Units.SI.HeatFlowRate Q_flow_fullOpen_par= 10.0 "";
  
  //********** Internal variables **********
  units.ThermalConductance G_fullOpen "";
  Modelica.Units.SI.TemperatureDifference dT "";
  Modelica.Units.SI.TemperatureDifference Q_flow "";
  
  //********** Interfaces **********
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_open annotation(
    Placement(transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-60, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  //-----
  port_a.Q_flow=Q_flow;
  port_b.Q_flow=-1.0*Q_flow;
  
  dT= port_a.T - port_b.T;
  
  //-----
  Q_flow_fullOpen_par=G_fullOpen*dT_fullOpen_par;
  
  //-----
  if(u_open<=0)then
    Q_flow=0.0;
  else
    Q_flow= u_open*G_fullOpen*dT;
  end if;
  
  
annotation(
    defaultComponentName = "thermalValve",
    Icon(graphics = {Line(origin = {-18.83, 8.92995}, points = {{-71.1708, -9.93451}, {-41.1708, -9.93451}, {-31.1708, 40.0655}, {-11.1708, -57.9345}, {8.82918, 40.0655}, {28.8292, -57.9345}, {48.8292, 40.0655}, {68.8292, -57.9345}, {78.8292, -9.9345}, {112.829, -9.93451}}, color = {170, 0, 0}, thickness = 4), Line(origin = {7.32, 11}, points = {{-67, 89}, {27, -83}}, thickness = 3, arrow = {Arrow.None, Arrow.Open}, arrowSize = 25), Text(origin = {0, -90}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}));
end ThermalValve;
