function SimIn = createSimuIn(times, vals)
    SimIn.signals.values = vals;
    SimIn.signals.dimensions = size(SimIn.signals.values,2);
    SimIn.time = times;
end