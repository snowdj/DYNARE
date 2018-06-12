function [ys_, params, info] = rbc_det3_steadystate2(ys_, exo_, params)
% Steady state generated by Dynare preprocessor
    info = 0;
    ys_(6)=exo_(1)/(1-params(7));
    ys_(5)=params(8)*exp(ys_(6));
    Output_per_unit_of_Capital=((1/params(1)-1+params(6))/params(4))^(1/(1-params(5)));
    Consumption_per_unit_of_Capital=Output_per_unit_of_Capital-params(6);
    Labour_per_unit_of_Capital=(((Output_per_unit_of_Capital/ys_(5))^params(5)-params(4))/(1-params(4)))^(1/params(5));
    Output_per_unit_of_Labour=Output_per_unit_of_Capital/Labour_per_unit_of_Capital;
    Consumption_per_unit_of_Labour=Consumption_per_unit_of_Capital/Labour_per_unit_of_Capital;
    ys_(3)=1/(1+Consumption_per_unit_of_Labour/((1-params(4))*params(2)/(1-params(2))*Output_per_unit_of_Labour^(1-params(5))));
    ys_(4)=Consumption_per_unit_of_Labour*ys_(3);
    ys_(1)=ys_(3)/Labour_per_unit_of_Capital;
    ys_(2)=Output_per_unit_of_Capital*ys_(1);
    % Auxiliary equations
    check_=0;
end
