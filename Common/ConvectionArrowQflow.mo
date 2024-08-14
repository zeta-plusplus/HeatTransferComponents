within HeatTransferComponents.Common;

model ConvectionArrowQflow
  extends Modelica.Thermal.HeatTransfer.Components.Convection;
  //*****************************************************************
  import units = Modelica.Units.SI;
  import consts = Modelica.Constants;
  
  /*-----------------------------------
      parameters
  -----------------------------------*/
  
  //-----
  parameter Integer significantDigits_Q_flow(min = 1) = 4 "Number of significant digits to be shown";
  parameter Integer significantDigits_Gc(min = 1) = 4 "Number of significant digits to be shown";
  //-----
  parameter units.HeatFlowRate Q_flow_Min = 0.001;
  parameter units.HeatFlowRate Q_flow_Max = 10*1e3;
  parameter Real thickArrowMin = 0.001;
  parameter Real thickArrowMax = 40;
  
  /*-----------------------------------
      internal objects
      -----------------------------------*/
    //-----
  Real thickArrowFwd;
  Real thickArrowBwd;
  Real sizeArrowFwd;
  Real sizeArrowBwd;
  
equation
  //--------------------
  if (0 <= Q_flow) then
    thickArrowFwd = max(thickArrowMin, min(thickArrowMax, thickArrowMin + Q_flow*(thickArrowMax - thickArrowMin)/(Q_flow_Max - Q_flow_Min)));
    sizeArrowFwd = 3.5*thickArrowFwd;
    thickArrowBwd = 0.0;
    sizeArrowBwd = 0.0;
  else
    thickArrowBwd = max(thickArrowMin, min(thickArrowMax, thickArrowMin + abs(Q_flow)*(thickArrowMax - thickArrowMin)/(Q_flow_Max - Q_flow_Min)));
    sizeArrowBwd = 3.5*thickArrowBwd;
    thickArrowFwd = 0.0;
    sizeArrowFwd = 0.0;
  end if;
  
annotation(
    defaultComponentName = "convection",
    Icon(graphics = {Line(origin = {-1, -0.308824}, points = {{-90, 0}, {90, 0}}, color = {255, 0, 0}, thickness = DynamicSelect(3, thickArrowFwd), arrow = {Arrow.None, Arrow.Open}, arrowSize = DynamicSelect(14, sizeArrowFwd)), Line(origin = {-178.05, 0.05}, points = {{270, 0}, {90, 0}}, color = {255, 0, 0}, pattern = LinePattern.Dash, thickness = DynamicSelect(0.25, thickArrowBwd), arrow = {Arrow.None, Arrow.Open}, arrowSize = DynamicSelect(0, sizeArrowBwd)), Text(origin = {0, -139}, extent = {{-100, 11}, {100, -11}}, textString = DynamicSelect("0.0", String(Q_flow, significantDigits_Q_flow, 0, true))), Text(origin = {16, -160}, extent = {{-20, 6}, {20, -6}}, textString = "W", horizontalAlignment = TextAlignment.Right), Text(origin = {60, 137}, extent = {{-40, 11}, {40, -11}}, textString = DynamicSelect("0.0", String(Gc, significantDigits_Gc, 0, true)), horizontalAlignment = TextAlignment.Left)}));
    
    
    
end ConvectionArrowQflow;
