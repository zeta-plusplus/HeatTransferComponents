within HeatTransferComponents.Sensors;

model TemperatureDispColor00
  //----------------------------------------
  // Import
  //----------------------------------------
  import Colors = Modelica.Mechanics.MultiBody.Visualizers.Colors;
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Integer sigDigits(min = 1) = 6 "";
  parameter Real valMin = 273.15 "";
  parameter Real valMax = 2000 "";
  parameter Real colorMap[:, 3] = Colors.ColorMaps.jet();
  //----------------------------------------
  // variables
  //----------------------------------------
  Real vecRGB[3];
  Real valDisp(final quantity = "ThermodynamicTemperature", final unit = "K", displayUnit = "degC", min = 0);
  //----------------------------------------
  // interface
  //----------------------------------------
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//
  heatPort.Q_flow = 0.0;
  valDisp = heatPort.T;
//
  vecRGB = Colors.scalarToColor(valDisp, valMin, valMax, colorMap);
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -40}, {100, 40}}), graphics = {Rectangle(fillColor = DynamicSelect({192, 192, 192}, {vecRGB[1], vecRGB[2], vecRGB[3]}), pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-100, 40}, {100, -40}}), Text(origin = {0, -59}, extent = {{-100, 15}, {100, -15}}, textString = DynamicSelect("0.0", String(valDisp, sigDigits, 0, true)))}),
    defaultComponentName = "Temperature");
end TemperatureDispColor00;
