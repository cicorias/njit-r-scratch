
`%nin%` = Negate(`%in%`)


#paste(c("Hours and Minutes:", max_time %/% 60 , ":", round(max_time %% 60)), collapse = "")

to_hours_minutes <- function (t) {
  paste(c("Hours and Minutes:", max_time %/% 60 , ":", round(max_time %% 60)), collapse = "")
}
