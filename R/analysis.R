#' analysis dataset
#'
#' @description This is the laryngectomy dataset after setting the variable types and applying labels.
#'
#' @format A labelled tibble with 123 rows and 33 variables:
#' \describe{
#'   \item{age}{
#'
#' | *Type:*        | integer       |
#' | -------------- | ------------- |
#' |                |               |
#' | *Description:* | Age in years |
#'
#'   }
#'   \item{sex}{
#'
#' | *Type:*        | factor (First/Reference level = `Male`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Sex assigned at Birth |
#' |                |                                                      |
#' | *Levels:*      | `Male, Female`           |
#'
#'   }
#'   \item{recur_site}{
#'
#' | *Type:*        | factor (First/Reference level = `Supra`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Recurrent Site |
#' |                |                                                      |
#' | *Levels:*      | `Supra, Glottic, Transglottic, Unknown`           |
#'
#'   }
#'   \item{trt_mod}{
#'
#' | *Type:*        | factor (First/Reference level = `XRT`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Treatment Modality |
#' |                |                                                      |
#' | *Levels:*      | `XRT, Chemo+XRT, Unspecified`           |
#'
#'   }
#'   \item{int_stg}{
#'
#' | *Type:*        | ordered (First/Reference level = `Unknown`)       |
#' | -------------- | ------------- |
#' |                |               |
#' | *Description:* | Initial Stage |
#' |                |                                                      |
#' | *Levels:*      | `Unknown, T1, T2, T3, T4`           |
#'
#'   }
#'   \item{recur_stg}{
#'
#' | *Type:*        | ordered (First/Reference level = `Unknown`)       |
#' | -------------- | ------------- |
#' |                |               |
#' | *Description:* | Recurrent staging |
#' |                |                                                      |
#' | *Levels:*      | `Unknown, T1, T2, T3, T4`           |
#'
#'   }
#'   \item{preop_img_mod}{
#'
#' | *Type:*        | factor (First/Reference level = `CT`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Imaging |
#' |                |                                                      |
#' | *Levels:*      | `CT, PET, CT+PET, MRI`           |
#'
#'   }
#'   \item{nk_dissection}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Neck Dissection |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{laterality}{
#'
#' | *Type:*        | factor (First/Reference level = `Bilateral`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Laterality |
#' |                |                                                      |
#' | *Levels:*      | `Bilateral, Unilateral`           |
#'
#'   }
#'   \item{mic_vas_flap}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Microvascular Flap |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{pec_flap}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Pectoralis major myocutaneous flap |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{pathology}{
#'
#' | *Type:*        | factor (First/Reference level = `Positive`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Nodal Pathology evaluation of specimen |
#' |                |                                                      |
#' | *Levels:*      | `Positive, Negative`           |
#'
#'   }
#'   \item{path_stg}{
#'
#' | *Type:*        | ordered (First/Reference level = `Unknown`)       |
#' | -------------- | ------------- |
#' |                |               |
#' | *Description:* | Pathologic staging |
#' |                |                                                      |
#' | *Levels:*      | `Unknown, T1, T2, T3, T4`           |
#'
#'   }
#'   \item{complications}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Complications |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{fistula}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Salivary fistula or leak |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{wound_inf}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Wound Infection |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{dehiscence}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Wound dehiscence |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{wound_comp}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Wound Complications |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{chyle_leak}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Chyle leak |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{hematoma}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Hematoma |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{revision_proc}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Revision procedure |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{flap_fail}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Flap Failure |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{periop_death}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Perioperative Death |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{med_comp}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Medical Complications |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{comp_2plus}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | 2 or more complications |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{hosp_stay_days}{
#'
#' | *Type:*        | integer       |
#' | -------------- | ------------- |
#' |                |               |
#' | *Description:* | Hospital Stay |
#'
#'   }
#'   \item{death}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Death status |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{recur}{
#'
#' | *Type:*        | factor (First/Reference level = `Yes`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Recurrence status |
#' |                |                                                      |
#' | *Levels:*      | `Yes, No`           |
#'
#'   }
#'   \item{sor}{
#'
#' | *Type:*        | factor (First/Reference level = `No recurrence`) |
#' | -------------- | ---------------------------------------------------- |
#' |                |                                                      |
#' | *Description:* | Site of Recurrence after salvage laryngectomy |
#' |                |                                                      |
#' | *Levels:*      | `No recurrence, Local/regional, Distant`           |
#'
#'   }
#'   \item{length_fu}{
#'
#' | *Type:*        | integer       |
#' | -------------- | ------------- |
#' |                |               |
#' | *Description:* | Days of follow-up |
#'
#'   }
#'   \item{death_fu}{
#'
#' | *Type:*        | integer       |
#' | -------------- | ------------- |
#' |                |               |
#' | *Description:* | Days until death |
#'
#'   }
#'   \item{recur_fu}{
#'
#' | *Type:*        | integer       |
#' | -------------- | ------------- |
#' |                |               |
#' | *Description:* | Days until recurrence |
#'
#'   }
#'   \item{complications_count}{
#'
#' | *Type:*        | integer       |
#' | -------------- | ------------- |
#' |                |               |
#' | *Description:* | Number of complications             |
#'
#'   }
#' }
"analysis"
