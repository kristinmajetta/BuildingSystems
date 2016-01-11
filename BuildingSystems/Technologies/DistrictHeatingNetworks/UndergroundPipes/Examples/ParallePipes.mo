within BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.Examples;
model ParallePipes

   BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.ParallelPipes
                                                                                       parallelPipes(
    redeclare package Medium = Medium,
    length=50,
    m_flow_nominal=1,
    nNodes=10,
    redeclare
      BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.DHN_Umodels.UPreinsulated
      Umodel(
      d_i=0.05,
      H_real=1,
      E=0.15),
    dp_nominal=10000)
    annotation (Placement(transformation(extent={{-10,-12},{10,8}})));
  BoundaryConditions.GroundTemperature0D kusuda0D(
    A=8,
    z=1,
    t0(displayUnit="d") = 15552000,
    Tmean=283.15,
    m=1)
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T source(
    redeclare package Medium = Medium,
    nPorts=1,
    m_flow=1,
    T=323.15) annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  BuildingSystems.Fluid.Sources.FixedBoundary sink(redeclare package Medium = Medium, nPorts=1)
    annotation (Placement(transformation(extent={{40,10},{20,30}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T sink2(
    redeclare package Medium = Medium,
    nPorts=1,
    m_flow=-1)
    annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
  BuildingSystems.Fluid.Sources.FixedBoundary source2(
    redeclare package Medium = Medium,
    nPorts=1,
    T=323.15) annotation (Placement(transformation(extent={{40,-30},{20,-10}})));
  replaceable package Medium = BuildingSystems.Media.Water;
equation
  connect(sink2.ports[1], parallelPipes.port_b2) annotation (Line(
      points={{-20,-20},{-14,-20},{-14,-8},{-10,-8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(parallelPipes.port_a2, source2.ports[1]) annotation (Line(
      points={{10,-8},{14,-8},{14,-20},{20,-20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(parallelPipes.port_b1, sink.ports[1]) annotation (Line(
      points={{10,4},{16,4},{16,20},{20,20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(source.ports[1], parallelPipes.port_a1) annotation (Line(
      points={{-20,20},{-16,20},{-16,4},{-10,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(kusuda0D.port[1], parallelPipes.port_a) annotation (Line(
      points={{-41,70},{0,70},{0,7.8}},
      color={127,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end ParallePipes;