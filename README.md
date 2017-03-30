# Telecom-senator-donations
## Analysis of donations to senators from Telecom Industry.
### Data from [FollowtheMoney.org](https://www.followthemoney.org/show-me?f-fc=1&c-exi=1&c-r-ot=U#%5B%7B1%7Cgro=c-t-id,d-cci)

### Is there a significant difference between the amount of money donated to Republican vs Democratic parties by the Telecom Industry? 

## Normality test
Normality test: One-sample Kolmogorov-Smirnov
Both Republican and Democratic donation amounts are not normally distributed.

![senatordonations_01.PNG](https://github.com/ahl54/telecom-senator-donations/blob/master/senatordonations_01.png)
## Two sample t-test (rep vs dem)
At 5 % significance level, party donation amount differences are significant
 
## Wilcoxson Rank Sum test
This is the recommended non-parametric test for non-normally distributed data, equivalent to a Mann-Whitney U test

**p = 0.9178** > 0.05 

## Conclusion
Null hypothesis accepted at significance level of 5%. Samples are from continuous distributions with equal medians.
There is no statistical evidence that supports a difference between the amount of money donated to Republican vs Democratic parties by the Telecom Industry.
