within HeatTransferComponents.Common;

model HeatCapacitorColorT
  extends Modelica.Thermal.HeatTransfer.Components.HeatCapacitor;
  //----------------------------------------
  // Import
  //----------------------------------------
  import Colors = Modelica.Mechanics.MultiBody.Visualizers.Colors;
  //----------------------------------------
  // parameter
  //----------------------------------------
  parameter Types.SwitchUnitVisTemperature switchUnitT = Types.SwitchUnitVisTemperature.K;
  parameter Integer sigDigits(min = 1) = 6 "";
  parameter Real valMin = 273.15 "";
  parameter Real valMax = 273.15 + 1000 "";
  parameter Real colorMap[:, 3] = Colors.ColorMaps.jet();
  //----------------------------------------
  // variables
  //----------------------------------------
  Real vecRGB[3];
  Real Tvis;
  Real TminContour;
  Real TmaxContour;
  //*****************************************************************
equation
//----------
  if (switchUnitT == Types.SwitchUnitVisTemperature.degC) then
    Tvis = port.T - 273.15;
    TminContour = valMin;
    TmaxContour = valMax;
  else
    Tvis = port.T;
    TminContour = valMin;
    TmaxContour = valMax;
  end if;
//----------
  vecRGB = Colors.scalarToColor(Tvis, TminContour, TmaxContour, colorMap);
//*****************************************************************
  annotation(
    defaultComponentName = "HeatCapacitor",
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {0, -130}, extent = {{-100, 10}, {100, -10}}, textString = DynamicSelect("0.0", String(Tvis, sigDigits, 0, true))), Rectangle(origin = {0, -10}, fillColor = DynamicSelect({192, 192, 192}, {vecRGB[1], vecRGB[2], vecRGB[3]}), pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}}), Text(extent = {{-69, 7}, {71, -24}}, textString = "%C")}));
end HeatCapacitorColorT;
