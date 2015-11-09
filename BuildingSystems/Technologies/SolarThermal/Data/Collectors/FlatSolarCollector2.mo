within BuildingSystems.Technologies.SolarThermal.Data.Collectors;
model FlatSolarCollector2
  "Average data of flat collector with very good efficiency"
  extends
    BuildingSystems.Technologies.SolarThermal.Data.Collectors.CollectorPartial(
    IAMC=0.88,
    V_A=1.5/1.8/980,
    C_0=0.825,
    C_1=3.15,
    C_2=0.01);
end FlatSolarCollector2;
