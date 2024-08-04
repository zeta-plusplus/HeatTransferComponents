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
  parameter Real valMax = 273.15+1000 "";
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
    Tvis= port.T -273.15;
    TminContour= valMin;
    TmaxContour= valMax;
  else
    Tvis= port.T;
    TminContour= valMin;
    TmaxContour= valMax;
  end if;
//----------
  vecRGB = Colors.scalarToColor(Tvis, TminContour, TmaxContour, colorMap);

//*****************************************************************
  annotation(
    defaultComponentName = "HeatCapacitor",
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(lineColor = {160, 160, 164}, fillColor = DynamicSelect( {192, 192, 192}, {vecRGB[1], vecRGB[2], vecRGB[3]}), fillPattern = FillPattern.Solid, points = {{0, 67}, {-20, 63}, {-40, 57}, {-52, 43}, {-58, 35}, {-68, 25}, {-72, 13}, {-76, -1}, {-78, -15}, {-76, -31}, {-76, -43}, {-76, -53}, {-70, -65}, {-64, -73}, {-48, -77}, {-30, -83}, {-18, -83}, {-2, -85}, {8, -89}, {22, -89}, {32, -87}, {42, -81}, {54, -75}, {56, -73}, {66, -61}, {68, -53}, {70, -51}, {72, -35}, {76, -21}, {78, -13}, {78, 3}, {74, 15}, {66, 25}, {54, 33}, {44, 41}, {36, 57}, {26, 65}, {0, 67}}), Text(extent = {{-69, 7}, {71, -24}}, textString = "%C"), Text(origin = {0, -130}, extent = {{-100, 10}, {100, -10}}, textString = DynamicSelect("0.0", String(Tvis, sigDigits, 0, true)))}));
end HeatCapacitorColorT;
