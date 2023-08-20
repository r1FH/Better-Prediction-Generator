-- this is the old version, really buggy so dont use.

local function generatePredictionsFromPing(ping)
    local pingRanges = {{20, 30}, {30, 40}, {40, 50}, {50, 60}, {60, 70}, {70, 80}, {80, 90},
                        {90, 100}, {100, 110}, {110, 120}, {120, 130}, {130, 140}, {140, 150},
                        {150, 160}, {160, 170}, {170, 180}, {180, 190}, {190, 200}, {200, 210},
                        {210, 220}}
    local w = "-- made by bolt / fiji / www.doxbin.com on discord\n\n"
    local p = {}
    for _, r in ipairs(pingRanges) do
        table.insert(p, string.format("ping%d_%d = %.4f,", r[1], r[2], math.random() * 0.1 + 0.1))
    end
    return w..table.concat(p, "\n")
end

local pingValue = tonumber(string.split(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(), '(')[1])
writefile("prediction_values.txt", generatePredictionsFromPing(pingValue))
print("Prediction values saved.")
