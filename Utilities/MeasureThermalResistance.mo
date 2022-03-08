within HeatTransferComponents.Utilities;

model MeasureThermalResistance
  import Units= Modelica.SIunits;
  //**********
  parameter Integer significantDigits(min=1) = 4
    "Number of significant digits to be shown";
  
  //**********
  Units.ThermalResistance R;
  Units.TemperatureDifference deltaT;
  
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_resistance annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_Q_flow annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  port_a.Q_flow=0.0;
  port_b.Q_flow=0.0;
  y_resistance = R;
  
  deltaT= abs(port_a.T - port_b.T);
  
  if(abs(u_Q_flow)>0)then
    R= deltaT/abs(u_Q_flow);
  else
    R=0;
  end if;
  
annotation(
    defaultComponentName = "ThermalResistance",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, pattern = LinePattern.Dot, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -120}, extent = {{-100, 8}, {100, -8}}, textString = "%name"), Text(origin = {0, 30}, extent = {{-120, 10}, {120, -10}}, textString =DynamicSelect("0.0", String(R, significantDigits=significantDigits)))}));
end MeasureThermalResistance;
