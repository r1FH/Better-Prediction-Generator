local function generateRandomString(length)
    return (function(c) local s = "" for i = 1, length do s = s .. string.char(math.random(33, 126)) end return s end)()
end

local function generatePredictionsFromPing(ping)
    local basePing, predictions = ping - ping % 100, ""
    for pingMin = basePing, ping, 10 do
        local precision = (pingMin - basePing) / 1000
        predictions = predictions .. string.format("ping%d_%d = %.4f,\n", pingMin, pingMin + 10, math.random() * precision + 0.1)
    end
    return string.format("-- made by bolt / fiji / www.doxbin.com on discord\n-- Ping used: %dms\n-- Created at: %s\n-- T-String: %s\n\n%s",
        ping, os.date("%Y-%m-%d %H:%M:%S"), generateRandomString(10), predictions:sub(1, -2))
end

local ping, pingString = tonumber(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+"))
writefile("prediction_values.txt", generatePredictionsFromPing(ping))
warn("Prediction values saved to your executor's folder. (Try checking your Workspace folder for prediction_values.txt or whatever your file name is.)")
