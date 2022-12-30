within HeatTransferComponents.Examples.Temp;

model SolidHeatNetwork_ex01_v01
  extends Modelica.Icons.Example;
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
    Placement(visible = true, transformation(origin = {-170, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = 0.1, T(displayUnit = "K", fixed = true, start = 288.15)) annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-170, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-170, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 10, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-170, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-110, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-110, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = 0.1, T(displayUnit = "K", fixed = true, start = 288.15)) annotation(
    Placement(visible = true, transformation(origin = {-110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature1 annotation(
    Placement(visible = true, transformation(origin = {-110, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 1, height = 20, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-110, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 1, height = 10, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder2(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-50, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature2 annotation(
    Placement(visible = true, transformation(origin = {-50, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-50, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor2(C = 0.1, T(displayUnit = "K", fixed = true, start = 288.15)) annotation(
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp3(duration = 1, height = 50, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {10, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder3(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {10, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor3(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {10, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor3(C = 0.1, T(displayUnit = "K", fixed = true, start = 288.15)) annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature3 annotation(
    Placement(visible = true, transformation(origin = {10, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp4(duration = 1, height = 80, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {70, 190}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder4(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {70, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature4 annotation(
    Placement(visible = true, transformation(origin = {70, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor4(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {70, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor4(C = 0.1, T(displayUnit = "K", fixed = true, start = 288.15)) annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp5(duration = 1, height = 10, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-170, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder5(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-170, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature5 annotation(
    Placement(visible = true, transformation(origin = {-170, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor5(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-170, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor5(C = 0.1, T(displayUnit = "K", fixed = true, start = 288.15)) annotation(
    Placement(visible = true, transformation(origin = {-170, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor51(C = 0.1, T(displayUnit = "K", fixed = true, start = 288.15)) annotation(
    Placement(visible = true, transformation(origin = {-110, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor51(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature51 annotation(
    Placement(visible = true, transformation(origin = {-110, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder51(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-110, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp51(duration = 1, height = 10, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-110, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor52(C = 0.1, T(displayUnit = "K", fixed = true, start = 288.15)) annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor52(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature52 annotation(
    Placement(visible = true, transformation(origin = {-50, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder52(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {-50, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp52(duration = 1, height = 10, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor53(C = 0.1, T(displayUnit = "K", fixed = true, start = 288.15)) annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor53(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature53 annotation(
    Placement(visible = true, transformation(origin = {10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder53(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {10, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp53(duration = 1, height = 10, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {10, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor54(C = 0.1, T(displayUnit = "K", fixed = true, start = 288.15)) annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor54(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature54 annotation(
    Placement(visible = true, transformation(origin = {70, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder54(T = 0.5, initType = Modelica.Blocks.Types.Init.SteadyState) annotation(
    Placement(visible = true, transformation(origin = {70, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp54(duration = 1, height = 10, offset = 288.15, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {70, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor6(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-140, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor7(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-80, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor8(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor9(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {40, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor10(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-170, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor11(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor12(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor13(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor14(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor15(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-140, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor16(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor17(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor18(G = 1/0.01*0.001*20) annotation(
    Placement(visible = true, transformation(origin = {40, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HeatTransferComponents.Sensors.MonitorTemperature monitorT annotation(
    Placement(visible = true, transformation(origin = {-150, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Sensors.MonitorTemperature monitorT1 annotation(
    Placement(visible = true, transformation(origin = {-90, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Sensors.MonitorTemperature monitorT2 annotation(
    Placement(visible = true, transformation(origin = {-30, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Sensors.MonitorTemperature monitorT3 annotation(
    Placement(visible = true, transformation(origin = {30, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Sensors.MonitorTemperature monitorT4 annotation(
    Placement(visible = true, transformation(origin = {90, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Sensors.MonitorTemperature monitorT5 annotation(
    Placement(visible = true, transformation(origin = {-150, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Sensors.MonitorTemperature monitorT6 annotation(
    Placement(visible = true, transformation(origin = {-90, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Sensors.MonitorTemperature monitorT7 annotation(
    Placement(visible = true, transformation(origin = {-30, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Sensors.MonitorTemperature monitorT8 annotation(
    Placement(visible = true, transformation(origin = {30, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.Sensors.MonitorTemperature monitorT9 annotation(
    Placement(visible = true, transformation(origin = {90, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(firstOrder.y, prescribedTemperature.T) annotation(
    Line(points = {{-170, 150}, {-170, 142}}, color = {0, 0, 127}));
  connect(ramp.y, firstOrder.u) annotation(
    Line(points = {{-170, 180}, {-170, 172}}, color = {0, 0, 127}));
  connect(firstOrder.y, prescribedTemperature.T) annotation(
    Line(points = {{-170, 150}, {-170, 142}}, color = {0, 0, 127}));
  connect(prescribedTemperature.port, thermalConductor.port_a) annotation(
    Line(points = {{-170, 120}, {-170, 110}}, color = {191, 0, 0}));
  connect(thermalConductor.port_b, heatCapacitor.port) annotation(
    Line(points = {{-170, 90}, {-170, 60}}, color = {191, 0, 0}));
  connect(ramp1.y, firstOrder1.u) annotation(
    Line(points = {{-110, 179}, {-110, 171}}, color = {0, 0, 127}));
  connect(firstOrder1.y, prescribedTemperature1.T) annotation(
    Line(points = {{-110, 149}, {-110, 141}}, color = {0, 0, 127}));
  connect(prescribedTemperature1.port, thermalConductor1.port_a) annotation(
    Line(points = {{-110, 120}, {-110, 110}}, color = {191, 0, 0}));
  connect(thermalConductor1.port_b, heatCapacitor1.port) annotation(
    Line(points = {{-110, 90}, {-110, 60}}, color = {191, 0, 0}));
  connect(ramp2.y, firstOrder2.u) annotation(
    Line(points = {{-50, 179}, {-50, 171}}, color = {0, 0, 127}));
  connect(firstOrder2.y, prescribedTemperature2.T) annotation(
    Line(points = {{-50, 149}, {-50, 141}}, color = {0, 0, 127}));
  connect(prescribedTemperature2.port, thermalConductor2.port_a) annotation(
    Line(points = {{-50, 120}, {-50, 110}}, color = {191, 0, 0}));
  connect(thermalConductor2.port_b, heatCapacitor2.port) annotation(
    Line(points = {{-50, 90}, {-50, 60}}, color = {191, 0, 0}));
  connect(ramp3.y, firstOrder3.u) annotation(
    Line(points = {{10, 179}, {10, 171}}, color = {0, 0, 127}));
  connect(firstOrder3.y, prescribedTemperature3.T) annotation(
    Line(points = {{10, 149}, {10, 141}}, color = {0, 0, 127}));
  connect(prescribedTemperature3.port, thermalConductor3.port_a) annotation(
    Line(points = {{10, 120}, {10, 110}}, color = {191, 0, 0}));
  connect(thermalConductor3.port_b, heatCapacitor3.port) annotation(
    Line(points = {{10, 90}, {10, 60}}, color = {191, 0, 0}));
  connect(ramp4.y, firstOrder4.u) annotation(
    Line(points = {{70, 179}, {70, 171}}, color = {0, 0, 127}));
  connect(firstOrder4.y, prescribedTemperature4.T) annotation(
    Line(points = {{70, 149}, {70, 141}}, color = {0, 0, 127}));
  connect(prescribedTemperature4.port, thermalConductor4.port_a) annotation(
    Line(points = {{70, 120}, {70, 110}}, color = {191, 0, 0}));
  connect(thermalConductor4.port_b, heatCapacitor4.port) annotation(
    Line(points = {{70, 90}, {70, 60}}, color = {191, 0, 0}));
  connect(heatCapacitor5.port, thermalConductor5.port_b) annotation(
    Line(points = {{-170, -20}, {-170, -50}}, color = {191, 0, 0}));
  connect(thermalConductor5.port_a, prescribedTemperature5.port) annotation(
    Line(points = {{-170, -70}, {-170, -80}}, color = {191, 0, 0}));
  connect(prescribedTemperature5.T, firstOrder5.y) annotation(
    Line(points = {{-170, -102}, {-170, -108}}, color = {0, 0, 127}));
  connect(firstOrder5.u, ramp5.y) annotation(
    Line(points = {{-170, -132}, {-170, -138}}, color = {0, 0, 127}));
  connect(thermalConductor6.port_b, heatCapacitor.port) annotation(
    Line(points = {{-150, 70}, {-170, 70}, {-170, 60}}, color = {191, 0, 0}));
  connect(thermalConductor6.port_a, heatCapacitor1.port) annotation(
    Line(points = {{-130, 70}, {-110, 70}, {-110, 60}}, color = {191, 0, 0}));
  connect(thermalConductor7.port_b, heatCapacitor1.port) annotation(
    Line(points = {{-90, 70}, {-110, 70}, {-110, 60}}, color = {191, 0, 0}));
  connect(thermalConductor7.port_a, heatCapacitor2.port) annotation(
    Line(points = {{-70, 70}, {-50, 70}, {-50, 60}}, color = {191, 0, 0}));
  connect(thermalConductor8.port_b, heatCapacitor2.port) annotation(
    Line(points = {{-30, 70}, {-50, 70}, {-50, 60}}, color = {191, 0, 0}));
  connect(thermalConductor8.port_a, heatCapacitor3.port) annotation(
    Line(points = {{-10, 70}, {10, 70}, {10, 60}}, color = {191, 0, 0}));
  connect(thermalConductor9.port_b, heatCapacitor3.port) annotation(
    Line(points = {{30, 70}, {10, 70}, {10, 60}}, color = {191, 0, 0}));
  connect(thermalConductor9.port_a, heatCapacitor4.port) annotation(
    Line(points = {{50, 70}, {70, 70}, {70, 60}}, color = {191, 0, 0}));
  connect(heatCapacitor.port, thermalConductor10.port_a) annotation(
    Line(points = {{-170, 60}, {-170, 30}}, color = {191, 0, 0}));
  connect(thermalConductor10.port_b, heatCapacitor5.port) annotation(
    Line(points = {{-170, 10}, {-170, -20}}, color = {191, 0, 0}));
  connect(heatCapacitor1.port, thermalConductor11.port_a) annotation(
    Line(points = {{-110, 60}, {-110, 30}}, color = {191, 0, 0}));
  connect(thermalConductor11.port_b, heatCapacitor51.port) annotation(
    Line(points = {{-110, 10}, {-110, -20}}, color = {191, 0, 0}));
  connect(heatCapacitor2.port, thermalConductor12.port_a) annotation(
    Line(points = {{-50, 60}, {-50, 30}}, color = {191, 0, 0}));
  connect(thermalConductor12.port_b, heatCapacitor52.port) annotation(
    Line(points = {{-50, 10}, {-50, -20}}, color = {191, 0, 0}));
  connect(heatCapacitor3.port, thermalConductor13.port_a) annotation(
    Line(points = {{10, 60}, {10, 30}}, color = {191, 0, 0}));
  connect(thermalConductor13.port_b, heatCapacitor53.port) annotation(
    Line(points = {{10, 10}, {10, -20}}, color = {191, 0, 0}));
  connect(heatCapacitor4.port, thermalConductor14.port_a) annotation(
    Line(points = {{70, 60}, {70, 30}}, color = {191, 0, 0}));
  connect(thermalConductor14.port_b, heatCapacitor54.port) annotation(
    Line(points = {{70, 10}, {70, -20}}, color = {191, 0, 0}));
  connect(heatCapacitor51.port, thermalConductor51.port_b) annotation(
    Line(points = {{-110, -20}, {-110, -50}}, color = {191, 0, 0}));
  connect(heatCapacitor52.port, thermalConductor52.port_b) annotation(
    Line(points = {{-50, -20}, {-50, -50}}, color = {191, 0, 0}));
  connect(heatCapacitor53.port, thermalConductor53.port_b) annotation(
    Line(points = {{10, -20}, {10, -50}}, color = {191, 0, 0}));
  connect(heatCapacitor54.port, thermalConductor54.port_b) annotation(
    Line(points = {{70, -20}, {70, -50}}, color = {191, 0, 0}));
  connect(thermalConductor51.port_a, prescribedTemperature51.port) annotation(
    Line(points = {{-110, -70}, {-110, -80}}, color = {191, 0, 0}));
  connect(prescribedTemperature51.T, firstOrder51.y) annotation(
    Line(points = {{-110, -102}, {-110, -109}}, color = {0, 0, 127}));
  connect(firstOrder51.u, ramp51.y) annotation(
    Line(points = {{-110, -132}, {-110, -139}}, color = {0, 0, 127}));
  connect(thermalConductor52.port_a, prescribedTemperature52.port) annotation(
    Line(points = {{-50, -70}, {-50, -80}}, color = {191, 0, 0}));
  connect(thermalConductor53.port_a, prescribedTemperature53.port) annotation(
    Line(points = {{10, -70}, {10, -80}}, color = {191, 0, 0}));
  connect(thermalConductor54.port_a, prescribedTemperature54.port) annotation(
    Line(points = {{70, -70}, {70, -80}}, color = {191, 0, 0}));
  connect(prescribedTemperature52.T, firstOrder52.y) annotation(
    Line(points = {{-50, -102}, {-50, -108}}, color = {0, 0, 127}));
  connect(firstOrder52.u, ramp52.y) annotation(
    Line(points = {{-50, -132}, {-50, -138}}, color = {0, 0, 127}));
  connect(prescribedTemperature53.T, firstOrder53.y) annotation(
    Line(points = {{10, -102}, {10, -108}}, color = {0, 0, 127}));
  connect(firstOrder53.u, ramp53.y) annotation(
    Line(points = {{10, -132}, {10, -138}}, color = {0, 0, 127}));
  connect(prescribedTemperature54.T, firstOrder54.y) annotation(
    Line(points = {{70, -102}, {70, -108}}, color = {0, 0, 127}));
  connect(firstOrder54.u, ramp54.y) annotation(
    Line(points = {{70, -132}, {70, -138}}, color = {0, 0, 127}));
  connect(thermalConductor15.port_b, heatCapacitor5.port) annotation(
    Line(points = {{-150, -10}, {-170, -10}, {-170, -20}}, color = {191, 0, 0}));
  connect(thermalConductor15.port_a, heatCapacitor51.port) annotation(
    Line(points = {{-130, -10}, {-110, -10}, {-110, -20}}, color = {191, 0, 0}));
  connect(thermalConductor16.port_b, heatCapacitor51.port) annotation(
    Line(points = {{-90, -10}, {-110, -10}, {-110, -20}}, color = {191, 0, 0}));
  connect(thermalConductor16.port_a, heatCapacitor52.port) annotation(
    Line(points = {{-70, -10}, {-50, -10}, {-50, -20}}, color = {191, 0, 0}));
  connect(thermalConductor17.port_b, heatCapacitor52.port) annotation(
    Line(points = {{-30, -10}, {-50, -10}, {-50, -20}}, color = {191, 0, 0}));
  connect(thermalConductor17.port_a, heatCapacitor53.port) annotation(
    Line(points = {{-10, -10}, {10, -10}, {10, -20}}, color = {191, 0, 0}));
  connect(thermalConductor18.port_b, heatCapacitor53.port) annotation(
    Line(points = {{30, -10}, {10, -10}, {10, -20}}, color = {191, 0, 0}));
  connect(thermalConductor18.port_a, heatCapacitor54.port) annotation(
    Line(points = {{50, -10}, {70, -10}, {70, -20}}, color = {191, 0, 0}));
  connect(monitorT.port, heatCapacitor.port) annotation(
    Line(points = {{-160, 46}, {-170, 46}, {-170, 60}}, color = {191, 0, 0}));
  connect(monitorT1.port, heatCapacitor1.port) annotation(
    Line(points = {{-100, 46}, {-110, 46}, {-110, 60}}, color = {191, 0, 0}));
  connect(monitorT2.port, heatCapacitor2.port) annotation(
    Line(points = {{-40, 46}, {-50, 46}, {-50, 60}}, color = {191, 0, 0}));
  connect(monitorT3.port, heatCapacitor3.port) annotation(
    Line(points = {{20, 46}, {10, 46}, {10, 60}}, color = {191, 0, 0}));
  connect(monitorT4.port, heatCapacitor4.port) annotation(
    Line(points = {{80, 46}, {70, 46}, {70, 60}}, color = {191, 0, 0}));
  connect(monitorT5.port, heatCapacitor5.port) annotation(
    Line(points = {{-160, -36}, {-170, -36}, {-170, -20}}, color = {191, 0, 0}));
  connect(monitorT6.port, heatCapacitor51.port) annotation(
    Line(points = {{-100, -36}, {-110, -36}, {-110, -20}}, color = {191, 0, 0}));
  connect(monitorT7.port, heatCapacitor52.port) annotation(
    Line(points = {{-40, -36}, {-50, -36}, {-50, -20}}, color = {191, 0, 0}));
  connect(monitorT8.port, heatCapacitor53.port) annotation(
    Line(points = {{20, -36}, {10, -36}, {10, -20}}, color = {191, 0, 0}));
  connect(monitorT9.port, heatCapacitor54.port) annotation(
    Line(points = {{80, -36}, {70, -36}, {70, -20}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.002));
end SolidHeatNetwork_ex01_v01;
