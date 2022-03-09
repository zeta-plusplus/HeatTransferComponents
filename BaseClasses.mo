within HeatTransferComponents;

model BaseClasses
  extends Modelica.Icons.BasesPackage;

  model ShowValue00
    //**********
    parameter Integer significantDigits(min=1) = 4
      "Number of significant digits to be shown";
    //**********
    Real var2disp;
    
  equation
  
  annotation(
      Icon(graphics = {Text(origin = {0, 30}, extent = {{-120, 10}, {120, -10}}, textString =DynamicSelect("0.0", String(var2disp, significantDigits=significantDigits)))}));
      
  end ShowValue00;
equation

end BaseClasses;
