# analysis dataset

This dataset, which is ready for analysis, was created by setting the
variable types, specifying factor levels instead of code numbers, and
applying labels to the laryngectomy dataset. It includes demographics,
surgery details, and outcomes for 123 individuals who underwent a
laryngectomy at an unspecified medical center between 2000 and 2012.

## Usage

``` r
analysis
```

## Format

A labelled tibble with 123 rows and 33 variables:

- age:

  |                |              |
  |----------------|--------------|
  | *Type:*        | integer      |
  |                |              |
  | *Description:* | Age in years |

- sex:

  |                |                                         |
  |----------------|-----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Male`) |
  |                |                                         |
  | *Description:* | Sex assigned at Birth                   |
  |                |                                         |
  | *Levels:*      | `Male, Female`                          |

- recur_site:

  |                |                                          |
  |----------------|------------------------------------------|
  | *Type:*        | factor (First/Reference level = `Supra`) |
  |                |                                          |
  | *Description:* | Recurrent Site                           |
  |                |                                          |
  | *Levels:*      | `Supra, Glottic, Transglottic, Unknown`  |

- trt_mod:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `XRT`) |
  |                |                                        |
  | *Description:* | Treatment Modality                     |
  |                |                                        |
  | *Levels:*      | `XRT, Chemo+XRT, Unspecified`          |

- int_stg:

  |                |                                             |
  |----------------|---------------------------------------------|
  | *Type:*        | ordered (First/Reference level = `Unknown`) |
  |                |                                             |
  | *Description:* | Initial Stage                               |
  |                |                                             |
  | *Levels:*      | `Unknown, T1, T2, T3, T4`                   |

- recur_stg:

  |                |                                             |
  |----------------|---------------------------------------------|
  | *Type:*        | ordered (First/Reference level = `Unknown`) |
  |                |                                             |
  | *Description:* | Recurrent staging                           |
  |                |                                             |
  | *Levels:*      | `Unknown, T1, T2, T3, T4`                   |

- preop_img_mod:

  |                |                                       |
  |----------------|---------------------------------------|
  | *Type:*        | factor (First/Reference level = `CT`) |
  |                |                                       |
  | *Description:* | Imaging                               |
  |                |                                       |
  | *Levels:*      | `CT, PET, CT+PET, MRI`                |

- nk_dissection:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Neck Dissection                        |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- laterality:

  |                |                                              |
  |----------------|----------------------------------------------|
  | *Type:*        | factor (First/Reference level = `Bilateral`) |
  |                |                                              |
  | *Description:* | Laterality                                   |
  |                |                                              |
  | *Levels:*      | `Bilateral, Unilateral`                      |

- mic_vas_flap:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Microvascular Flap                     |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- pec_flap:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Pectoralis major myocutaneous flap     |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- pathology:

  |                |                                             |
  |----------------|---------------------------------------------|
  | *Type:*        | factor (First/Reference level = `Positive`) |
  |                |                                             |
  | *Description:* | Nodal Pathology evaluation of specimen      |
  |                |                                             |
  | *Levels:*      | `Positive, Negative`                        |

- path_stg:

  |                |                                             |
  |----------------|---------------------------------------------|
  | *Type:*        | ordered (First/Reference level = `Unknown`) |
  |                |                                             |
  | *Description:* | Pathologic staging                          |
  |                |                                             |
  | *Levels:*      | `Unknown, T1, T2, T3, T4`                   |

- complications:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Complications                          |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- fistula:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Salivary fistula or leak               |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- wound_inf:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Wound Infection                        |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- dehiscence:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Wound dehiscence                       |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- wound_comp:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Wound Complications                    |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- chyle_leak:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Chyle leak                             |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- hematoma:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Hematoma                               |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- revision_proc:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Revision procedure                     |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- flap_fail:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Flap Failure                           |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- periop_death:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Perioperative Death                    |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- med_comp:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Medical Complications                  |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- comp_2plus:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | 2 or more complications                |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- hosp_stay_days:

  |                |               |
  |----------------|---------------|
  | *Type:*        | integer       |
  |                |               |
  | *Description:* | Hospital Stay |

- death:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Death status                           |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- recur:

  |                |                                        |
  |----------------|----------------------------------------|
  | *Type:*        | factor (First/Reference level = `Yes`) |
  |                |                                        |
  | *Description:* | Recurrence status                      |
  |                |                                        |
  | *Levels:*      | `Yes, No`                              |

- sor:

  |                |                                                  |
  |----------------|--------------------------------------------------|
  | *Type:*        | factor (First/Reference level = `No recurrence`) |
  |                |                                                  |
  | *Description:* | Site of Recurrence after salvage laryngectomy    |
  |                |                                                  |
  | *Levels:*      | `No recurrence, Local/regional, Distant`         |

- length_fu:

  |                |                   |
  |----------------|-------------------|
  | *Type:*        | integer           |
  |                |                   |
  | *Description:* | Days of follow-up |

- death_fu:

  |                |                  |
  |----------------|------------------|
  | *Type:*        | integer          |
  |                |                  |
  | *Description:* | Days until death |

- recur_fu:

  |                |                       |
  |----------------|-----------------------|
  | *Type:*        | integer               |
  |                |                       |
  | *Description:* | Days until recurrence |

- complications_count:

  |                |                         |
  |----------------|-------------------------|
  | *Type:*        | integer                 |
  |                |                         |
  | *Description:* | Number of complications |
