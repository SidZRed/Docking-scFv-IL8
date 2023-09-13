# Docking of anti-IL8 scFv to IL8

## Note on protein models

The model for the [anti-IL8 scFv](https://www.sigmaaldrich.com/IN/en/product/sigma/sab1403974?gclid=Cj0KCQjwmICoBhDxARIsABXkXlI6ew98eAgecIkuhQLG3yxIuc5z9uleawKgM3IWDkxcDMu-zhJ0fV4aAl1xEALw_wcB) (anti-interleukin-8) (single-chain variable fragment) is taken from our [scFv-Modelling](https://github.com/iGEMIISc/scFv-Modelling) repository. In particular, we have chosen the [ColabFold](https://www.nature.com/articles/s41592-022-01488-1) model generated with PDB70. We have used ColabFold for a graphic processing unit for folding proteins in a 3-Dimensional format. It has a GDT_TS [(Global distance Test)](https://en.wikipedia.org/wiki/Global_distance_test) score of 92.4% . This is a rating of the comparision of protein structures with well known amino acid sequences. ColabFold performs a MMseqs-2 based homology search server to find the template of the protein.

Interleukin 8 (IL-8) is a [chemokine](https://www.news-medical.net/health/What-are-Chemokines.aspx) produced by various cell types. This acts as a mediator of inflammation in the tissues and a potent angiogenic factor. It attracts various kinds of phagocytic cells such as neutrophils, basophils and T-cells to stimulate the phagocytosis of cells and promote angiogenesis.
Being a chemokine ,  it promotes the immune cell migration for the phagocytosis. These belong to a set of monoclonal antibodies which have become a modern class of medicines used for treating various diseases such as cancer , cardiovascular and inflammation diseases. Interleukin 8 is in culture a 72 amino acid peptide in it's major form when it is secreted by macrophages.
The scFv antibody fragments consist of variable regions of heavy (VH) and light chain (VL) of full antibodies that are joined by a linker sequence.

The model for IL8 is taken from the [PDB](https://www.rcsb.org/structure/2IL8) (PDB ID: 2IL8). This PDB file consists of 30 models, each with a different conformation of IL8 in a 3D structure. We have chosen the first model for our docking. The PDB library consists of the 3-Dimensional structure of the given protein and all the sequences and mutations of the fragments of the protein. The solution NMR method has been used to experimentally verify the protein structure and so far 30 various different conformers of the same molecule have been shown to exist.
We use a homology based modeling pattern for this protein which consists of building the given protein based on the atomic resolution models of the constituent amino acids sequences.

## Global Range Molecular Matching (GRAMM)

[GRAMM](https://vakserlab.ku.edu/files_gramm/readme.pdf) is a docking web server that maps the intermolecular energy landscape by predicting a spectrum of docking poses corresponding to stable (deep energy minima) and transient (shallow minima) protein interactions. This program performs an exhaustive comparision in a 6-Dimensional structures through the relative translations and rotations of the molecule. It performs a comprehensive comparision in which it accounts for all the possible orientations and positions of the molecule in study against another known molecule. It simulates the way in which atoms interact with each other when they are at various distances from each other and predict the pose in which the molecule attains the most energitically favourable state when the two interact with each other. It tests against all the available models in the PDB and gives an exhaustive result.

GRAMM does not perform a statistical sampling of the model but produces an exhaustive search against all configurations of the complex and give the one with the best steric fit score.


We used the anti-IL8 scFv as the receptor and IL8 as the ligand.

### Free Docking

In a free docking algorithm, a large number of conformations of the two proteins are evaluated to minimize the energy of their interaction. 
It is a simulation of the behaviour and interaction of the molecule and identification of the potential binding sites of the molecule. 

Steps involved in the process of free docking : 
* Preparing the ligand and receptor structures, which may require removing water molecules, adding hydrogen atoms, assigning charges, and defining flexible regions. This is done to prepare the molecule for all possible sites of binding.
* Generating possible poses of the ligand in the binding site of the receptor, which may involve sampling different orientations, conformations, and translations of the ligand.
* Evaluating the poses based on their energy and/or scoring function, which may include terms for electrostatics, van der Waals, solvation, entropy, and empirical factors. This gives the best configuration of the most stable energy state.
* Ranking the poses according to their score and selecting the best ones for further analysis or validation.

<img src="https://github.com/iGEMIISc/Docking-scFv-IL8/blob/master/GRAMM%20FreeDocking/model1.gif?raw=true">

### Template-based Docking

In the template-based method, a search is made from the PDB to identify heterodimer templates for our target. Then, homology modeling is used to map the target sequence onto the template structure.
This is used to generate template-based structural models of assemblies using close and remote homologs of known 3D structures which are detected through an automated search protocol.

<img src="https://github.com/iGEMIISc/Docking-scFv-IL8/blob/master/GRAMM%20Docking%20With%20Template/model1.gif?raw=true">

The structural modeling of protein interactions in the absence of close homologous templates is a challenging task. Recently, template-based docking methods have emerged to exploit local structural similarities to help ab-initio protocols provide reliable 3D models for protein interactions.
To efficiently utilize available homologous complexes in the protein data bank (PDB) (24), we have developed a hybrid docking strategy to automatically incorporate the binding interface information into traditional global docking. 


We will be taking the top models from both the free docking and template-based docking methods for further analysis. It should be noted that these can not be directly compared as the free docking method results are expressed in terms of shape complementarity while the template-based docking method results are expressed in terms of AACE18 (atomic contact energy) scores. This potential determines the relation between the binding free energy and [SASA](https://www.sciencedirect.com/topics/biochemistry-genetics-and-molecular-biology/accessible-surface-area) (Solvent Accesible Surface Area) values.

#### AutoDock-
[AutoDock3](https://autodock.scripps.edu/), a suite of open-source software for docking and virtual screening. AutoDock consists of several programs, such as AutoDock4, which performs the docking calculations using a Lamarckian genetic algorithm and a scoring function that accounts for torsional entropy; AutoGrid4, which pre-calculates the grid maps for the receptor; and AutoDockTools, which provides a graphical user interface for preparing and analyzing the docking inputs and outputs. 

AutoDock hasn't been utilized by us for this protein modelling as it does not provide for appropriate calculations for large molecules of ligands that we have used. It is unable to account for flexibility of cyclic and macro-cyclic ligands. It also requires much higher computational and graphical power for running the model which could amount to a significant cost of operation for a large ligand molecule like ours. Also it often leads to unreliable results when small molecules are docked into flexible binding sites. Since our protein contains a larger sequence (72 in general) of amino acid structure , it is not suitable to use AutoDock directly for docking our protein.

Other molecular docking softwares:
* SwissDock 
* Mcule

For our simulation of the binding energy , we have used PRODIGY (PROtein binDIng enerGY prediction) software for all the docking and calculations.
It has the following features:
* Predicts the binding affinity in PROTEIN-PROTEIN complexes
* Predicts the binding affinity in PROTEIN-SMALL LIGAND complexes
* Classification interfaces between biological or crystallographic

By default, all intermolecular contacts are taken into consideration,
a molecule being defined as an isolated group of amino acids sharing
a common chain identifier. In specific cases, for example
antibody-antigen complexes, some chains should be considered as a
single molecule. The PRODIGY server implements our simple but highly effective predictive model based on intermolecular contacts and properties derived from non-interface surface.


### Citations

1. Katchalski-Katzir, E., Shariv, I., Eisenstein, M., Friesem, A.A., Aflalo, C., Vakser, I.A., 1992, Molecular surface recognition: Determination of geometric fit between proteins and their ligands by correlation techniques, Proc. Natl. Acad. Sci. USA, 89:2195-2199.
2. Vakser, I.A., 1996, Long-distance potentials: An approach to the multiple-minima problem in ligand-receptor interaction, Protein Eng., 9:37-41.
3. Porter, K. A., Desta, I., Kozakov, D., & Vajda, S. (2019). What method to use for protein–protein docking? Current Opinion in Structural Biology, 55, 1–7.
4. Rosell M., Fernández-Recio J. Docking approaches for modeling multi-molecular assemblies. Curr. Opin. Struct. Biol. 2020; 64:59–65.
5. Waterhouse A., Bertoni M., Bienert S., Studer G., Tauriello G., Gumienny R., Heer F.T., de Beer T.A.P., Rempfer C., Bordoli L. et al. . SWISS-MODEL: homology modelling of protein structures and complexes. Nucleic Acids Res. 2018; 46:W296–W303.

## Analysis of Docking Results using PRODIGY


PRODIGY (PROtein binDIng enerGY prediction) is a web server for predicting the binding affinity of protein-protein complexes. We used this tool to analyze the docking results obtained from GRAMM.
To analyze the binding affinity, the PRODIGY webserver was employed where the binding affinity within the protein-protein complex is predicted based on contact-based methods. It performs binding affinity analysis based on the calculation of Gibbs free energy ($ΔG$ | kcal $mol^{-1}$ ) and dissociation constant ($K_d$ | $M$).

| Method |  Predicted Binding Affinity <br> $\Delta G$ in $\text{kcal}~\text{mol}^{-1}$ | Predicted Dissociation Constant <br> $K_d$ in $\text{M}$ at $36 \degree\text{C}$ |
| :---: | :---: | :---: |
| Free Docking | $-16.5$ | $2.2 \times 10^{-12}$ |
| Template-based Docking | $-7.4$ | $6.3 \times 10^{-6}$ |

The calculations are done for $36 \degree\text{C}$ as this is the temperature at which our antibody will interact with IL8 in the human peritoneum*. It can be seen that free docking has provided a much more favorable binding affinity and dissociation constant than template-based docking. This suggests that the free docking could access a more stable conformation of the complex, and thus is more likely to be closer to the actual binding conformation.

Detailed results are available in the `PRODIGY` directory.

### Citations

1. Vangone A. and Bonvin A.M.J.J. "Contact-based prediction of binding affinity in protein-protein complexes", eLife, 4, e07454 (2015).
2. Xue L., Rodrigues J., Kastritis P., Bonvin A.M.J.J.*, Vangone A.*, "PRODIGY: a web-server for predicting the binding affinity in protein-protein complexes", Bioinformatics, doi:10.1093/bioinformatics/btw514 (2016).

### Other References

1. *Ott, D.E. The peritoneum and the pneumoperitoneum: a review to improve clinical outcome. Gynecol Surg 1, 101–106 (2004). https://doi.org/10.1007/s10397-004-0019-y
2. [Study](https://onlinelibrary.wiley.com/doi/10.1002/prot.25889) showing that GRAMM can successfully predict protein-protein interactions even for models of varying accuracy.
3. [Study](https://onlinelibrary.wiley.com/doi/10.1002/prot.25380) indicating the effectiveness of GRAMM, and ranking it among the top performers in some CAPRI rounds.

### Credits
We would like to thank [Amar Singh](https://compbio.ku.edu/people/amar-singh) from the Center for Computational Biology at the University of Kansas for answering our queries regarding the use of GRAMM, particularly with respect to the evaluation of the docking results. 
