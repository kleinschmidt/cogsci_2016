# Cogsci 2016 paper

Topic: inferring prior beliefs.

Content: 
* experiment with percentage adaptation (labphon/svalp)
    * data from package.
    * figures from labphon abstract (input distribution and behavior + percentages)
* model 2 from NIPS paper:
    * simplifying assumption: people know the mean and variance of each category; no incremental updating. conjugate belief updating and marginalize over beliefs to get predictive distribution and classification functions (Kleinschmidt2015).
    * also no _structure_ in prior (just independent, conjugate priors)
    * fitted parameters from cached file.
    * plot classification functions with aggregate data
    * plot MAP distributions vs. kronrod (or chodroff et al.?)

Framing: lack of invariance, big problem. need to infer generative model (adapt by learning accent). in this view, prior experience plays a very important role: narrows down the range of possible "accents" you need to consider. test a critical prediction: harder to adapt to distributions that diverge more from typical accent. corollary: should be able to _infer_ prior beliefs based on how well adapt to different accents, (two advantages: don't need to use speech _production_ data, and it reflects the _beliefs_ that people extract from experience, which may not be a veridical reflection of the statistics of that experience).

Findings: 
* people adapt well when accent is close to normal, but poorly for extreme accents. 
    * (footnote: supervision doesn't help).  
* bayesian model captures adaptation very well using a single set of prior beliefs. 
* these inferred prior beliefs look quite a bit like what we see in production data, with one caveat: the inferred variance of /b/ is substantially higher than it is when produced by a typical talker. however, it's consistent with the existence of talkers who _also_ produce _prevoiced_ /b/ (negative VOTs with very high variance) [@Lisker1964]

## Outline

* Introduction 
    * <largely based on svalp/labphon/nips>
    * Talker differences makes speech perception hard
    * Recent proposal: rapidly adapt to talker variation, learning current talkers accent (or distributions of acoustic cues produced for each phonetic category).
    * Prior experience is really important because it lets you cut down the range of possible accents you need to consider, making adaptation faster and more efficient on average.
    * We test critical prediction: for a talker whose accent falls _outside_ the range of accents you'd expect based on prior experience, adaptation should be incomplete.
    * Expose people to accents with cue distributions that are more or less similar to a typical talker's cue distributions. Qualitatively, interested in whether the more extreme distributions yield less complete adaptation. Quantitatively, we use a belief updating model to try to _infer_ the prior beliefs that would produce the pattern of adaptation to the different distributions that we observe.
* Experiment
    * Methods:
        * <take from other cog sci paper etc.>
        * subjects and exclusion criteria from package
        * accent distribution figure from Labphon abstract
    * Results & Discussion
        * fit LMER model? to get boundaries and estimate trial learning effects to possibly justify not modeling them yet...
        * <classification functions figure from labphon abstract>
        * adaptation good in 0/10 conditions, less good in the -10/20/30 conditions
        * as predicted: more extreme departure from typical talker's distributions, less complete adaptation.
        * updated category boundaries reflect a compromise between ideal boundary for exposure talker and boundary for a typical talker
        * looks like prior experience _does_ constrain learning.
        * Remaining question: quantitatively, is this what's predicted by belief updating? 
* Model
    * Goals: infer prior beliefs based on adaptation data. test whether quantiative predictions of a bayesian belief updating framework fit the data.
    * Methods:
        * Belief updating model: infer mean and variance of each category (normal distribution) given mean and variance observed, plus prior distribution.
        * Conjugate prior (normal-inverse-chi-squared)
        * Free parameters: 
            * Prior expected mean and variance of each category (4 parameters: 2 mean and 2 var)
            * Prior confidence (pseudocount) parameters for mean and variance (both categories lumped together, 2 total parameters)
            * lapsing rate (some probability of random guess in response: 1 parameters).
            * total of 7 free parameters. if we fit lapsing GLMs to 5 conditions, would need slope and intercept for each, plus lapsing, for 11 free parameters. So model is more constrained (especially since some of the parameters are partially redundant).
        * Further simplifying assumptions for the sake of tractability/proof-of-concept modeling: 
            * all listeners have same prior beliefs (including strength of prior)
            * independent priors on categories
            * no incremental adaptation: use the input statistics for whole experiment to predict behavior on each trial.
            * input statistics are given (so that likelihood only contains _responses_: don't want to be inferring prior beliefs based on the actual input distributions, just based on behavior)
        * Estimate using MCMC (Stan).
    * Results
        * Models converge (Rhats)
        * Fits behavior well (classification functions: predicted vs. actual)
        * Inferred prior beliefs: 
            * <Figure from NIPS/labphon>
            * means/variances: /p/ looks good, /b/ is low and higher variance.
            * confidence: high.
    * Discussion
        * /b/ mean/variance <NIPS paper? or labphon/SVALP?>
        * prior confidence <NIPS paper>
* General discussion
    * adaptation not only _qualitatively_ constrained by prior experience, but quantitatively matches general predictions of a bayesian belief updating model
    * moreover, using such a model we can make inferences about prior beliefs, and they match more or less what we see in production.
