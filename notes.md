# Cogsci 2016 paper

Topic: inferring prior beliefs.

Content: experiment with percentage adaptation (labphon/svalp) + model 2 from NIPS paper.

Framing: lack of invariance, big problem. need to infer generative model (adapt by learning accent). in this view, prior experience plays a very important role: narrows down the range of possible "accents" you need to consider. test a critical prediction: harder to adapt to distributions that diverge more from typical accent. corollary: should be able to _infer_ prior beliefs based on how well adapt to different accents, (two advantages: don't need to use speech _production_ data, and it reflects the _beliefs_ that people extract from experience, which may not be a veridical reflection of the statistics of that experience).

Findings: 
* people adapt well when accent is close to normal, but poorly for extreme accents. 
    * (footnote: supervision doesn't help).  
* bayesian model captures adaptation very well using a single set of prior beliefs. 
* these inferred prior beliefs look quite a bit like what we see in production data, with one caveat: the inferred variance of /b/ is substantially higher than it is when produced by a typical talker. however, it's consistent with the existence of talkers who _also_ produce _prevoiced_ /b/ (negative VOTs with very high variance) [@Lisker1964]
