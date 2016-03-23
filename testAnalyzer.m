% Function to test/graph the analyzer
%
function[] = testAnalyzer()

for i = 1:5
    [FRE(i),TRE(i)] = Analyzer(i);
end
plot(1:5,FRE);
hold on;
plot(1:5,TRE,'r');
xlabel('FLEMax');
ylabel('Error in mm');
title('FRE and TRE against FLEmax: FRE blue TRE red');

end