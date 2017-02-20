function[color] = colorPerception(state, genotype)
    color = state;
    if state >= 1
        color = genotype(state+128);
    end
end
