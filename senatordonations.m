%% Significant difference between donations to senators from telecom industry? 
%% Date: March 30, 2017
%% Author: Anna Lu
%% Data from https://www.followthemoney.org/show-me?f-fc=1&c-exi=1&c-r-ot=U#%5B%7B1%7Cgro=c-t-id,d-cci
%%

% load data
data = readtable('senatordonations.csv');

% extract donation amounts classified by party
amt = table2array(data(:,4));
party = cell2mat(table2array(data(:,3)));
repindex = party ==  'R';
demindex = party ==  'D';
repamt = amt(repindex);
demamt = amt(demindex);


%% Normality test: One-sample Kolmogorov-Smirnov

hrep = kstest(repamt);
hdem = kstest(demamt);

if hrep == 1
    % null hypothesis that data is normally distributed rejected
    fprintf('republican donation amounts are not normally distributed\n');
else
    fprintf('republican donation amounts are normally distributed\n');
end

if hdem == 1
    % null hypothesis that data is normally distributed rejected
    fprintf('democratic donation amounts are not normally distributed\n');
else
    fprintf('democratic donation amounts are normally distributed\n');
end

%% Visualize distribution as histogram
hold on
barrep = bar(1:length(repamt),repamt, 'r');
bardem = bar(1:length(demamt), demamt, 'b');
barrep.FaceAlpha = 0.5;
bardem.FaceAlpha = 0.75;
title('Donation amounts by party');
ylabel('Donation amount USD $(,000)');
xlabel('Senator')
legend('Repbulican', 'Democratic');
hold off

%% Two sample t-test, Significance between parties by donation amount?
h = ttest2(repamt, demamt);

% T-test assumptions:
% Data are independent random samples from normal distributions 
% with equal means and equal but unknown variances
% n = 100, central limit theorem applied

fprintf('Two sample t-test at 5%% significance level\n')

if h == 1
    % null hypothesis rejected, not significant
    fprintf('Party donation amount differences are not significant\n')
else
    % alternative hypothesis
    fprintf('Party donation amount differences are significant\n')
end

%% Wilcoxson Rank Sum test 
% equivalent to Mann Whitney U test
% Recommended non-parametric test for non-normally distributed data

p = ranksum(repamt, demamt)

if p > 0.05
    % null hypothesis
    fprintf('samples from continuous distributions with equal medians\n');
else
    % alternative hypothesis
    fprintf('samples NOT from continuous distributions with equal medians\n');
end