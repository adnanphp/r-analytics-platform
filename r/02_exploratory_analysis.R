Script started on 2026-08-30 19:09:10-04:00 [TERM="xterm-256color" TTY="/dev/pts/7" COLUMNS="190" LINES="45"]
bash: /home/adnan/anaconda3/lib/libtinfo.so.6: no version information available (required by bash)
[?2004h[1;32madnan@adnan-X515EA[0m:[1;34m~/.../1H_new_projects_07/r-analytics-platform[0m$ pdflatex z_final_02[K[7mscript r/02_exploratory_analysis.R[27mscript r/02_exploratory_analysis.R[1@R
[?2004l[?2004h[1;32madnan@adnan-X515EA[0m:[1;34m~/.../1H_new_projects_07/r-analytics-platform[0m$ [7mRscript r/02_exploratory_analysis.R[27mRscript r/02_exploratory_analysis.R
[?2004l[?2004h[1;32madnan@adnan-X515EA[0m:[1;34m~/.../1H_new_projects_07/r-analytics-platform[0m$ [7mRscript r/03_feature_engineering.R[27mRscript r/03_feature_engineering.R
[?2004l── [1mAttaching core tidyverse packages[22m ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 2.0.0 ──
[32m✔[39m [34mdplyr    [39m 1.2.1     [32m✔[39m [34mreadr    [39m 2.1.4
[32m✔[39m [34mforcats  [39m 1.0.0     [32m✔[39m [34mstringr  [39m 1.5.0
[32m✔[39m [34mggplot2  [39m 4.0.3     [32m✔[39m [34mtibble   [39m 3.2.1
[32m✔[39m [34mlubridate[39m 1.9.5     [32m✔[39m [34mtidyr    [39m 1.3.2
[32m✔[39m [34mpurrr    [39m 1.2.2     
── [1mConflicts[22m ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
[31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
[31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
[36mℹ[39m Use the ]8;;http://conflicted.r-lib.org/conflicted package]8;; to force all conflicts to become errors
[?25h── [1mAttaching packages[22m ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidymodels 1.5.0 ──
[32m✔[39m [34mbroom       [39m 1.0.13     [32m✔[39m [34mrsample     [39m 1.3.2 
[32m✔[39m [34mdials       [39m 1.4.4      [32m✔[39m [34mtailor      [39m 0.1.0 
[32m✔[39m [34minfer       [39m 1.1.0      [32m✔[39m [34mtune        [39m 2.1.0 
[32m✔[39m [34mmodeldata   [39m 1.6.0      [32m✔[39m [34mworkflows   [39m 1.3.0 
[32m✔[39m [34mparsnip     [39m 1.6.0      [32m✔[39m [34mworkflowsets[39m 1.1.1 
[32m✔[39m [34mrecipes     [39m 1.4.0      [32m✔[39m [34myardstick   [39m 1.4.0 
── [1mConflicts[22m ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidymodels_conflicts() ──
[31m✖[39m [34mscales[39m::[32mdiscard()[39m masks [34mpurrr[39m::discard()
[31m✖[39m [34mdplyr[39m::[32mfilter()[39m   masks [34mstats[39m::filter()
[31m✖[39m [34mrecipes[39m::[32mfixed()[39m  masks [34mstringr[39m::fixed()
[31m✖[39m [34mdplyr[39m::[32mlag()[39m      masks [34mstats[39m::lag()
[31m✖[39m [34myardstick[39m::[32mspec()[39m masks [34mreadr[39m::spec()
[31m✖[39m [34mrecipes[39m::[32mstep()[39m   masks [34mstats[39m::step()
[?25h[?25h[?25h[1mRows: [22m[34m50000[39m [1mColumns: [22m[34m20[39m
[36m──[39m [1mColumn specification[22m [36m──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────[39m
[1mDelimiter:[22m ","
[31mchr[39m   (5): gender, region, plan_type, marketing_channel, device_type
[32mdbl[39m  (13): customer_id, age, total_usage, login_count, transaction_count, to...
[34mdttm[39m  (2): registration_date, last_activity_date

[36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
[36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
[?25h[?25h[?25h[1] "Feature engineering recipe created:"
[?25h[?25h[?25h[?25h[?25h[?25h[1] "="
[?25h[1] "🔧 FEATURE ENGINEERING COMPLETE!"
[?25h[1] "="
[?25h[1] ""
[?25h[1] "Original features: 19"
[?25h[1] "Engineered features: 22"
[?25h[1] "Total samples: 50000"
[?25h[1] ""
[?25h[1] "Feature engineering saved to: data/features/feature_engineering.rds"
[?25h[1] "="
[?25h[?25h[?2004h[1;32madnan@adnan-X515EA[0m:[1;34m~/.../1H_new_projects_07/r-analytics-platform[0m$ [7mRscript r/04_modeling.R[27mRscript r/04_modeling.R
[?2004l── [1mAttaching core tidyverse packages[22m ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 2.0.0 ──
[32m✔[39m [34mdplyr    [39m 1.2.1     [32m✔[39m [34mreadr    [39m 2.1.4
[32m✔[39m [34mforcats  [39m 1.0.0     [32m✔[39m [34mstringr  [39m 1.5.0
[32m✔[39m [34mggplot2  [39m 4.0.3     [32m✔[39m [34mtibble   [39m 3.2.1
[32m✔[39m [34mlubridate[39m 1.9.5     [32m✔[39m [34mtidyr    [39m 1.3.2
[32m✔[39m [34mpurrr    [39m 1.2.2     
── [1mConflicts[22m ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
[31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
[31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
[36mℹ[39m Use the ]8;;http://conflicted.r-lib.org/conflicted package]8;; to force all conflicts to become errors
[?25h── [1mAttaching packages[22m ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidymodels 1.5.0 ──
[32m✔[39m [34mbroom       [39m 1.0.13     [32m✔[39m [34mrsample     [39m 1.3.2 
[32m✔[39m [34mdials       [39m 1.4.4      [32m✔[39m [34mtailor      [39m 0.1.0 
[32m✔[39m [34minfer       [39m 1.1.0      [32m✔[39m [34mtune        [39m 2.1.0 
[32m✔[39m [34mmodeldata   [39m 1.6.0      [32m✔[39m [34mworkflows   [39m 1.3.0 
[32m✔[39m [34mparsnip     [39m 1.6.0      [32m✔[39m [34mworkflowsets[39m 1.1.1 
[32m✔[39m [34mrecipes     [39m 1.4.0      [32m✔[39m [34myardstick   [39m 1.4.0 
── [1mConflicts[22m ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidymodels_conflicts() ──
[31m✖[39m [34mscales[39m::[32mdiscard()[39m masks [34mpurrr[39m::discard()
[31m✖[39m [34mdplyr[39m::[32mfilter()[39m   masks [34mstats[39m::filter()
[31m✖[39m [34mrecipes[39m::[32mfixed()[39m  masks [34mstringr[39m::fixed()
[31m✖[39m [34mdplyr[39m::[32mlag()[39m      masks [34mstats[39m::lag()
[31m✖[39m [34myardstick[39m::[32mspec()[39m masks [34mreadr[39m::spec()
[31m✖[39m [34mrecipes[39m::[32mstep()[39m   masks [34mstats[39m::step()
[?25h[?25h[?25h[?25h[?25h[?25h[1] "Churn distribution:"
[?25h
    0     1 
 6621 43379 
[?25h
      0       1 
0.13242 0.86758 
[?25h[?25h[?25h[?25h[?25h[?25h[1] "Training Random Forest..."
[?25h[?25h[1] "Making predictions..."
[?25h[?25h[?25h[?25h[?25h[1] "="
[?25h[1] "🤖 MODELING COMPLETE!"
[?25h[1] "="
[?25h[1] ""
[?25h[1] "Metrics:"
[?25h[38;5;246m# A tibble: 4 × 3[39m
  .metric     .estimator .estimate
  [3m[38;5;246m<chr>[39m[23m       [3m[38;5;246m<chr>[39m[23m          [3m[38;5;246m<dbl>[39m[23m
[38;5;250m1[39m accuracy    binary       0.987  
[38;5;250m2[39m kap         binary       0.946  
[38;5;250m3[39m mn_log_loss binary      28.3    
[38;5;250m4[39m roc_auc     binary       0.007[4m4[24m[4m4[24m
[?25h[1] ""
[?25h[1] "Confusion Matrix:"
[?25h          Truth
Prediction    0    1
         0 1325  130
         1    0 8546
[?25h[1] ""
[?25h[1] "ROC AUC: 0.007"
[?25h[?25h[?25h[1] ""
[?25h[1] "Top 10 Features:"
[?25h[38;5;246m# A tibble: 10 × 2[39m
   feature                 importance
   [3m[38;5;246m<chr>[39m[23m                        [3m[38;5;246m<dbl>[39m[23m
[38;5;250m 1[39m days_since_registration     [4m4[24m320. 
[38;5;250m 2[39m engagement_score            [4m2[24m848. 
[38;5;250m 3[39m usage_intensity              850. 
[38;5;250m 4[39m total_usage                  217. 
[38;5;250m 5[39m satisfaction_score           191. 
[38;5;250m 6[39m support_tickets              144. 
[38;5;250m 7[39m total_revenue                 95.5
[38;5;250m 8[39m login_count                   91.7
[38;5;250m 9[39m age                           73.1
[38;5;250m10[39m transaction_count             64.7
[?25h[?25h[?25h[1] ""
[?25h[1] "Models saved to: models/model_results.rds"
[?25h[1] "="
[?25h[?25h[?2004h[1;32madnan@adnan-X515EA[0m:[1;34m~/.../1H_new_projects_07/r-analytics-platform[0m$ [7mR -e "shiny::runApp('shiny/app.R', port = 3838)"[27mR -e "shiny::runApp('shiny/app.R', port = 3838)"
[?2004l
R version 4.3.1 (2023-06-16) -- "Beagle Scouts"
Copyright (C) 2023 The R Foundation for Statistical Computing
Platform: x86_64-conda-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> shiny::runApp('shiny/app.R', port = 3838)
Loading required package: shiny

Attaching package: ‘shinydashboard’

The following object is masked from ‘package:graphics’:

    box

── [1mAttaching core tidyverse packages[22m ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 2.0.0 ──
[32m✔[39m [34mdplyr    [39m 1.2.1     [32m✔[39m [34mreadr    [39m 2.1.4
[32m✔[39m [34mforcats  [39m 1.0.0     [32m✔[39m [34mstringr  [39m 1.5.0
[32m✔[39m [34mggplot2  [39m 4.0.3     [32m✔[39m [34mtibble   [39m 3.2.1
[32m✔[39m [34mlubridate[39m 1.9.5     [32m✔[39m [34mtidyr    [39m 1.3.2
[32m✔[39m [34mpurrr    [39m 1.2.2     
── [1mConflicts[22m ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
[31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
[31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
[36mℹ[39m Use the ]8;;http://conflicted.r-lib.org/conflicted package]8;; to force all conflicts to become errors

Attaching package: ‘plotly’

The following object is masked from ‘package:ggplot2’:

    last_plot

The following object is masked from ‘package:stats’:

    filter

The following object is masked from ‘package:graphics’:

    layout


Attaching package: ‘DT’

The following objects are masked from ‘package:shiny’:

    dataTableOutput, renderDataTable

Loading required package: viridisLite
Error: 'data/processed/processed_data.csv' does not exist in current working directory ('/home/adnan/Music/3CCC_summer_2026_3_projects/1H_new_projects_07/r-analytics-platform/shiny').
Execution halted
[?25h[?2004h[1;32madnan@adnan-X515EA[0m:[1;34m~/.../1H_new_projects_07/r-analytics-platform[0m$ R -e "shiny::runApp('shiny/app.R', port = 3838)"
[?2004l
R version 4.3.1 (2023-06-16) -- "Beagle Scouts"
Copyright (C) 2023 The R Foundation for Statistical Computing
Platform: x86_64-conda-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> shiny::runApp('shiny/app.R', port = 3838)
Loading required package: shiny
Error in read_csv(DATA_PATH) : could not find function "read_csv"
Calls: <Anonymous> ... func -> sourceUTF8 -> eval -> eval -> ..stacktraceon..
Execution halted
[?25h[?2004h[1;32madnan@adnan-X515EA[0m:[1;34m~/.../1H_new_projects_07/r-analytics-platform[0m$ [7mR -e "shiny::runApp('shiny/app.R', port = 3838, host = '0.0.0.0')"[27mR -e "shiny::runApp('shiny/app.R', port = 3838, host = '0.0.0.0')"
[?2004l
R version 4.3.1 (2023-06-16) -- "Beagle Scouts"
Copyright (C) 2023 The R Foundation for Statistical Computing
Platform: x86_64-conda-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> shiny::runApp('shiny/app.R', port = 3838, host = '0.0.0.0')
Loading required package: shiny

Attaching package: ‘shinydashboard’

The following object is masked from ‘package:graphics’:

    box

── [1mAttaching core tidyverse packages[22m ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 2.0.0 ──
[32m✔[39m [34mdplyr    [39m 1.2.1     [32m✔[39m [34mreadr    [39m 2.1.4
[32m✔[39m [34mforcats  [39m 1.0.0     [32m✔[39m [34mstringr  [39m 1.5.0
[32m✔[39m [34mggplot2  [39m 4.0.3     [32m✔[39m [34mtibble   [39m 3.2.1
[32m✔[39m [34mlubridate[39m 1.9.5     [32m✔[39m [34mtidyr    [39m 1.3.2
[32m✔[39m [34mpurrr    [39m 1.2.2     
── [1mConflicts[22m ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
[31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
[31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
[36mℹ[39m Use the ]8;;http://conflicted.r-lib.org/conflicted package]8;; to force all conflicts to become errors

Attaching package: ‘plotly’

The following object is masked from ‘package:ggplot2’:

    last_plot

The following object is masked from ‘package:stats’:

    filter

The following object is masked from ‘package:graphics’:

    layout


Attaching package: ‘DT’

The following objects are masked from ‘package:shiny’:

    dataTableOutput, renderDataTable

Loading required package: viridisLite
[1mRows: [22m[34m50000[39m [1mColumns: [22m[34m20[39m
[36m──[39m [1mColumn specification[22m [36m───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────�