library(readr)
library(tidyverse)
laryngectomy <- read_csv("./inst/lary.csv")

set.seed(1)

make_factor <- function(x) {
  x <-
    case_when(
      x == 1 ~ "Yes",
      x == 2 ~ "No",
      .default = "*** ERROR ***"
    )
  x <- factor(x, levels = c("Yes", "No"))
}

analysis <- laryngectomy |>
  mutate(gender = as.character(gender)) |>
  mutate(
    across(
      c(age, length_fu, death_fu, recur_fu),
      ~ as.integer(.x)
    )
  ) |>
  mutate(
    sex = fct_recode(gender,
                     "Male" = "1",
                     "Female" = "2"
    ),
    recur_site = case_when(
      recur_site == 1 ~ "Supra",
      recur_site == 2 ~ "Glottic",
      recur_site == 3 ~ "Transglottic",
      recur_site == 4 ~ "Unknown",
      .default = NA_character_
    ) |>
      factor(levels = c("Supra", "Glottic", "Transglottic", "Unknown")),
    trt_mod = case_when(
      trt_mod == 1 ~ "XRT",
      trt_mod == 2 ~ "Chemo+XRT",
      trt_mod == 3 ~ "Unspecified",
      .default = NA_character_
    ) |>
      factor(levels = c("XRT", "Chemo+XRT", "Unspecified")),
    int_stg = case_when(
      int_stg == 1 ~ "T1",
      int_stg == 2 ~ "T2",
      int_stg == 3 ~ "T3",
      int_stg == 4 ~ "T4",
      int_stg == 5 ~ "Unknown",
      .default = NA_character_
    ) |>
      factor(levels = c("Unknown", "T1", "T2", "T3", "T4"), ordered = TRUE),
    recur_stg = case_when(
      recur_stg == 1 ~ "T1",
      recur_stg == 2 ~ "T2",
      recur_stg == 3 ~ "T3",
      recur_stg == 4 ~ "T4",
      recur_stg == 5 ~ "Unknown",
      .default = NA_character_
    ) |>
      factor(levels = c("Unknown", "T1", "T2", "T3", "T4"), ordered = TRUE),
    preop_img_mod = case_when(
      preop_Img_mod == 1 ~ "CT",
      preop_Img_mod == 2 ~ "PET",
      preop_Img_mod == 3 ~ "CT+PET",
      preop_Img_mod == 4 ~ "MRI",
      .default = NA_character_
    ) |>
      factor(levels = c("CT", "PET", "CT+PET", "MRI")),
    laterality = case_when(
      Laterality == 1 ~ "Bilateral",
      Laterality == 2 ~ "Unilateral",
      .default = NA_character_
    ) |>
      factor(levels = c("Bilateral", "Unilateral")),
    pathology = case_when(
      pathology == 1 ~ "Positive",
      pathology == 2 ~ "Negative",
      .default = NA_character_
    ) |>
      factor(levels = c("Positive", "Negative")),
    path_stg = case_when(
      path_stg == 1 ~ "T1",
      path_stg == 2 ~ "T2",
      path_stg == 3 ~ "T3",
      path_stg == 4 ~ "T4",
      path_stg == 5 ~ "Unknown",
      .default = NA_character_
    ) |>
      factor(levels = c("Unknown", "T1", "T2", "T3", "T4"), ordered = TRUE),
    hosp_stay_days = case_when(
      hosp_stay == 1 ~ sample(3:6, n(), replace = TRUE),
      hosp_stay == 2 ~ sample(7:13, n(), replace = TRUE),
      hosp_stay == 3 ~ sample(14:20, n(), replace = TRUE),
      hosp_stay == 4 ~ sample(21:27, n(), replace = TRUE),
      .default = NA_integer_
    ),
    sor = case_when(
      sor == 0 ~ "No recurrence",
      sor == 1 ~ "Local/Regional",
      sor == 3 ~ "Distant",
      .default = NA_character_
    ) |>
      factor(levels = c("No recurrence", "Local/regional", "Distant")),
    .keep = "unused"
  ) |>
  mutate(
    across(
      c(nk_dissection, mic_vas_flap, pec_flap, complications:flap_fail, periop_death, med_comp, comp_2plus, death, recur),
      ~ make_factor(.x)
    )
  ) |>
  labelled::set_variable_labels(
    age = "Age in years",
    sex = "Sex assigned at Birth",
    recur_site = "Recurrent Site",
    trt_mod = "Treatment Modality",
    int_stg = "Initial Stage",
    recur_stg = "Recurrent staging",
    preop_img_mod = "Imaging",
    nk_dissection = "Neck Dissection",
    laterality = "Laterality",
    mic_vas_flap = "Microvascular Flap",
    pec_flap = "Pectoralis major myocutaneous flap",
    pathology = "Nodal Pathology evaluation of specimen",
    path_stg = "Pathologic staging",
    complications = "Complications",
    fistula = "Salivary fistula or leak",
    wound_inf = "Wound Infection",
    dehiscence = "Wound dehiscence",
    wound_comp = "Wound Complications",
    chyle_leak = "Chyle leak",
    hematoma = "Hematoma",
    revision_proc = "Revision procedure",
    flap_fail = "Flap Failure",
    periop_death = "Perioperative Death",
    med_comp = "Medical Complications",
    comp_2plus = "2 or more complications",
    hosp_stay_days = "Hospital Stay",
    death = "Death status",
    recur = "Recurrence status",
    sor = "Site of Recurrence after salvage laryngectomy",
    length_fu = "Days of follow-up",
    death_fu = "Days until death",
    recur_fu = "Days until recurrence"
  ) |>
  select(
    age, sex, recur_site, trt_mod, int_stg, recur_stg, preop_img_mod,
    nk_dissection, laterality, mic_vas_flap, pec_flap, pathology, path_stg,
    complications, fistula, wound_inf, dehiscence, wound_comp, chyle_leak,
    hematoma, revision_proc, flap_fail, periop_death, med_comp, comp_2plus,
    hosp_stay_days, death, recur, sor, length_fu, death_fu, recur_fu
  )

analysis <- analysis |>
  rowwise() |>
  mutate(
    complications_count = sum(
      c_across(fistula:med_comp) == "Yes",
      na.rm = TRUE
    )
  ) |>
  ungroup() |>
  labelled::set_variable_labels(
    complications_count = "Number of complications"
  )

usethis::use_data(analysis, overwrite = TRUE)

