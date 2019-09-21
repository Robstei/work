SwaDData = read.delim("One_line_per_trial_and_participant_all_data.txt")
#install.packages(c("dplyr", "magrittr"))
library(dplyr)
library(magrittr)
options(warn=1)

SwaDData %>% mutate(Condition = case_when(
  Stimulus %in% c("selective_form_non_target.jpg",
                  "selective_form_target.jpg",
                  "selective_color_non_target.jpg",
                  "selective_color_target.jpg")                     ~ "selective",
  Stimulus %in% c("divided_non_target.jpg", "divided_color_target.jpg", "divided_form_target.jpg")
  ~ "divided",
  Stimulus %in% c("switching_selective_form_non_target.jpg",
                  "switching_selective_form_target.jpg",
                  "switching_selective_color_non_target.jpg",
                  "switching_selective_color_target.jpg")
  ~ "switching_selective",
  Stimulus %in% c("switching_divided_non_target.jpg",
                  "switching_divided_color_target.jpg",
                  "switching_divided_form_target.jpg")              ~ "switching_divided",
  TRUE ~ "noTrial")) %>%
  subset(Condition != "noTrial") %>%
  mutate(Saccade.Velocity.Maximum..Â..s. = ifelse(
    is.na(as.numeric(as.character(.$Saccade.Velocity.Maximum..Â..s))),
    0,
    as.numeric(as.character(.$Saccade.Velocity.Maximum..Â..s))
  )) -> ConditionedData 
  
  ConditionedData %>%
    subset(Condition == "selective") -> SelectiveCondition
  ConditionedData %>%
    subset(Condition == "divided") -> DividedCondition
  ConditionedData %>%
    subset(Condition == "switching_selective") -> SwitchingSelectiveCondition
  ConditionedData %>%
    subset(Condition == "switching_divided") -> SwitchingDividedCondition
  
  SelectiveCondition %>%
    filter(Fixation.Count > 0 | Saccade.Count > 0 | Blink.Count > 0) %>%
    group_by(Participant) %>%
    summarize(trialsUsed = n(),
              averageFixationDuration = sum(Fixation.Duration.Total..ms.) / sum(Fixation.Count),
              averageSaccadeDuration = sum(Saccade.Duration.Total..ms.) / sum(Saccade.Count),
              averageSaccadeAmplitude = sum(Saccade.Amplitude.Total..Â..) / sum(Saccade.Count),
              averagePeakVelocity = sum(Saccade.Velocity.Maximum..Â..s.) / sum(Saccade.Count),
              averageBlinkAmplitude = sum(Blink.Duration.Total..ms.) / sum(Blink.Count)) -> SelectiveAggregated
 
  DividedCondition %>%
    filter(Fixation.Count > 0 | Saccade.Count > 0 | Blink.Count > 0) %>%
    group_by(Participant) %>%
    summarize(trialsUsed = n(),
              averageFixationDuration = sum(Fixation.Duration.Total..ms.) / sum(Fixation.Count),
              averageSaccadeDuration = sum(Saccade.Duration.Total..ms.) / sum(Saccade.Count),
              averageSaccadeAmplitude = sum(Saccade.Amplitude.Total..Â..) / sum(Saccade.Count),
              averagePeakVelocity = sum(Saccade.Velocity.Maximum..Â..s.) / sum(Saccade.Count),
              averageBlinkAmplitude = sum(Blink.Duration.Total..ms.) / sum(Blink.Count)) -> DividedAggregated
  
  SwitchingSelectiveCondition %>%
    group_by(Participant) %>%
    arrange(Trial, .by_group = TRUE) %>%
    slice(-1 :  -26) %>%
    filter(Fixation.Count > 0 | Saccade.Count > 0 | Blink.Count > 0) %>%
    summarize(trialsUsed = n(),
              averageFixationDuration = sum(Fixation.Duration.Total..ms.) / sum(Fixation.Count),
              averageSaccadeDuration = sum(Saccade.Duration.Total..ms.) / sum(Saccade.Count),
              averageSaccadeAmplitude = sum(Saccade.Amplitude.Total..Â..) / sum(Saccade.Count),
              averagePeakVelocity = sum(Saccade.Velocity.Maximum..Â..s.) / sum(Saccade.Count),
              averageBlinkAmplitude = sum(Blink.Duration.Total..ms.) / sum(Blink.Count)) -> SwitchingSelectiveAggregated
  
  SwitchingDividedCondition %>%
    group_by(Participant) %>%
    arrange(Trial, .by_group = TRUE) %>%
    slice(-1 :  -26) %>%
    filter(Fixation.Count > 0 | Saccade.Count > 0 | Blink.Count > 0) %>%
    summarize(trialsUsed = n(),
              averageFixationDuration = sum(Fixation.Duration.Total..ms.) / sum(Fixation.Count),
              averageSaccadeDuration = sum(Saccade.Duration.Total..ms.) / sum(Saccade.Count),
              averageSaccadeAmplitude = sum(Saccade.Amplitude.Total..Â..) / sum(Saccade.Count),
              averagePeakVelocity = sum(Saccade.Velocity.Maximum..Â..s.) / sum(Saccade.Count),
              averageBlinkAmplitude = sum(Blink.Duration.Total..ms.) / sum(Blink.Count)) -> SwitchingDividedAggregated
  
  

  firstMerge <- merge(SelectiveAggregated, DividedAggregated, by = "Participant", suffix = list(".Selective", ".Divided"))
  secondMerge <- merge(SwitchingSelectiveAggregated, SwitchingDividedAggregated, by = "Participant", suffix = list(".SwitchingSelective", ".SwitchingDevided"))
  FinalData <- merge(firstMerge, secondMerge, by = "Participant")
  
  write.table(FinalData, "SwaD_Accumulated.csv", quote=FALSE, sep="\t", row.names=FALSE);
  
  
  # END#

  write.table(test, "Test.csv", quote=FALSE, sep="\t", row.names=FALSE);
  write.table(SwitchingSelectiveCondition, "before.csv", quote=FALSE, sep="\t", row.names=FALSE);
  
  #AllConditions <- list(SelectiveAggregated, DividedAggregated, SwitchingSelectiveAggregated, SwitchingDividedAggregated)
  #Reduce(function(x,y) merge(x, y, by.x = 1, by.y = 1, suffixes = c((deparse(substitute(x))),deparse(substitute(y)))), x = list(SelectiveAggregated,DividedAggregated,SwitchingSelectiveAggregated,SwitchingDividedAggregated)) -> FinalData
  
  #WICHTIG! Die Peak Velocity wird nicht per Saccade sondern per Trial gemittelt
  # Wir benutzen nur die 4 Bedingungen und keine Blöcke
  
  
  names <- c("Robin","Robin","Robin","Robin","Max","Max","Max","Klaus")
  money <- c(1,2,3,4,5,6,7,8)
  testData <- data.frame(names, money)
  testData %>% group_by(names) -> testData2
  
  testData2 %>% slice(-1 : -3) -> testData3
  
  
  colnames(SwaDData)
  
  
  aggregate(groupedData, list(groupedData$Participant, groupedData$Condition), mean)
  
  groupedData 
  
  selectiveValues <- filter(data, Stimulus == "selective_form_non_target.jpg" |
                              Stimulus == "selective_form_target.jpg" |
                              Stimulus == "selective_color_non_target.jpg" |
                              Stimulus == "selective_color_target.jpg");
  
  selectiveValues <- select(selectiveValues, Participant,
                            Fixation.Duration.Total..ms.,Fixation.Count,
                            Saccade.Duration.Total..ms., Saccade.Count,
                            `Saccade.Amplitude.Total..Â..`, `Saccade.Velocity.Total..Â..s.`,
                            Blink.Duration.Total..ms., Blink.Count)
  aggregate( Fixation.Count ~ Participant, selectiveValues, +)
  
  rt <- structure(list(participant = c(1435157254L, 1435157254L, 1435157254L, 
                                       1435157254L, 1435157254L, 1435157254L, 1435157254L, 1435157254L, 
                                       1435157254L, 1435157254L, 1435157254L, 1435157254L, 1435157254L, 
                                       1435157254L, 1435157254L, 1435157254L, 1435157254L, 1435157254L, 
                                       1435157254L, 1435157254L, 1435157254L, 1435157254L, 1435157254L, 
                                       1435157254L, 1435157283L, 1435157283L, 1435157283L, 1435157283L, 
                                       1435157283L, 1435157283L, 1435157283L, 1435157283L, 1435157283L, 
                                       1435157283L, 1435157283L, 1435157283L, 1435157283L, 1435157283L, 
                                       1435157283L, 1435157283L, 1435157283L, 1435157283L, 1435157283L, 
                                       1435157283L, 1435157283L, 1435157283L, 1435157283L),
                       condition = structure(c(3L,, 2L, 4L, 3L, 1L, 2L, 4L, 3L, 1L, 2L, 4L, 3L, 1L, 2L, 4L, 3L,
                                               1L, 2L, 4L, 3L, 1L, 2L, 4L, 1L, 4L, 2L, 3L, 1L, 4L, 2L, 3L, 1L,
                                               4L, 2L, 3L, 1L, 4L, 2L, 3L, 1L, 4L, 2L, 3L, 1L, 4L, 2L),
                                             .Label = c("A_A","A_S", "I_A", "I_S"), class = "factor"),
                       rt = c(728L, 752L, 2771L,673L, 1749L, 1215L, 681L, 488L, 464L, 525L, 517L, 426L, 431L,453L, 522L, 421L, 432L, 493L, 377L, 425L, 356L, 486L, 369L, 381L,3088L, 568L, 488L, 432L, 536L, 456L, 440L, 456L, 1192L, 344L,432L, 456L, 449L, 440L, 592L, 448L, 1136L, 448L, 384L, 472L, 432L, 624L, 464L)), 
                  .Names = c("participant", "condition", "rt"), 
                  class = "data.frame", row.names = c(NA, -47L))
  
  trimmed <- rt %>% group_by(participant, condition) %>% 
    mutate(avg = mean(rt), stdev = sd(rt)) %>% 
    filter(rt <= 2*stdev+avg) %>% 
    select(participant, condition, rt) %>% 
    as.data.frame()
  