// Script to covert timezone hours
// Usage: tz.groovy 10:00 PST EST
time = args.length > 0 ? args[0] : "10:00"
fromTz = args.length > 1 ? args[1] : "IST" // India Standard Time
toTz = args.length > 2 ? args[2] : "EST"   // US Estern Standard Time
df = new java.text.SimpleDateFormat("HH:mm zzz")
d1 = df.parse("$time $fromTz")
df.setTimeZone(TimeZone.getTimeZone(toTz))
println(df.format(d1))
