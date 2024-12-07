#!/usr/bin/env lua5.4

print("Day 2, task 1")
local filename = arg[1]
print("Filename: " .. filename)

local function load_file(filename)
    local data = {}

    local f = assert(io.open(filename))
    for line in f:lines()
    do
        table.insert(data, {})
        for number in line:gmatch("(%d+)")
        do
            number = tonumber(number)
            table.insert(data[#data], number)
        end
    end
    f:close()

    return data
end

local function check_is_increasing(report)
    if report[1] < report[2]
    then
        return true
    else
        return false
    end
end

local function check_report_safe(report, is_increasing)
    if is_increasing
    then
        for i = 1, #report-1, 1
        do
            if (report[i+1] - report[i] < 1) or (report[i+1] - report[i] > 3)
            then
                return false
            end
        end
    else
        for i = 1, #report-1, 1
        do
            if (report[i] - report[i+1] < 1) or (report[i] - report[i+1] > 3)
            then
                return false
            end
        end
    end

    return true
end

local function run_task(data)
    local sum = 0

    for _, report in ipairs(data)
    do
        local is_increasing = check_is_increasing(report)
        if check_report_safe(report, is_increasing)
        then
            sum = sum + 1
        end
    end

    return sum
end

local data = load_file(filename)
local sum = run_task(data)

print("Sum:", sum)