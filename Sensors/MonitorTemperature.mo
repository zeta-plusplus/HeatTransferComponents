within HeatTransferComponents.Sensors;

model MonitorTemperature
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Integer significantDigits(min=1) = 6
    "Number of significant digits to be shown";
  
  //----------------------------------------
  // variables
  //----------------------------------------
  Real var2disp;
  
  //----------------------------------------
  // interface
  //----------------------------------------
  Modelica.Blocks.Interfaces.RealOutput T(unit="K")
    "Absolute temperature as output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-110, -10}, {-90, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
equation
  T = port.T;
  port.Q_flow = 0;
  var2disp= port.T;
  
  
  annotation (
    defaultComponentName = "MonitorT",
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={
        Ellipse(fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-20, -98}, {20, -60}}),
        Rectangle(origin = {0, -25},lineColor = {191, 0, 0}, fillColor = {191, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-12, 25}, {12, -41}}),
        Line(points={{12,0},{100,0}},color={0,0,127}),
        Line(points={{-90,0},{-12,0}}, color={191,0,0}),
        Polygon(origin = {0, -60}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-12, 40}, {-12, 80}, {-10, 86}, {-6, 88}, {0, 90}, {6, 88}, {10, 86}, {12, 80}, {12, 40}, {-12, 40}}),
        Line(points = {{-12, 0}, {-12, -64}}, thickness = 0.5),
        Line(origin = {-0.28037, 0}, points = {{12, 0}, {12, -64}}, thickness = 0.5),
        Line(points={{-40,-20},{-12,-20}}),
        Line(origin = {-0.280354, -16.8224}, points = {{-40, 20}, {-12, 20}}),
        Text(origin = {47, 0},textColor = {64, 64, 64}, extent = {{13, 40}, {53, 0}}, textString = "K"), Text(origin = {-266, 40}, textColor = {64, 64, 64}, extent = {{106, 60}, {427, 0}}, textString = DynamicSelect("0.0", String(var2disp, significantDigits, 0, true)))}),
    Documentation(info="<html>

</html>"));

end MonitorTemperature;
