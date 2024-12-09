#!/usr/bin/env lua5.4

print("Day 3, task 2")
local filename = arg[1]
print("Filename: " .. filename)

local function load_file(filename)
    local data = {}

    local f = assert(io.open(filename))
    data = f:read("a")
    f:close()

    return data
end

local function make_data_good(data)
    local good_data = ""
    local current_index = 1

    while true
    do
        -- Find don't():
        local stop, _ = data:find("don't()", current_index, true)
        good_data = good_data .. data:sub(current_index, stop)
        --print("Stop:", stop)

        if stop == nil
        then
            break
        end

        -- Find do():
        current_index, _ = data:find("do()", stop, true)
        --print(current_index)

        if current_index == nil
        then
            break
        end
    end

    return good_data
end

local function run_task(data)
    local sum = 0

    for x, y in data:gmatch("mul%((%d+),(%d+)%)")
    do
        x = tonumber(x)
        y = tonumber(y)
        sum = sum + x * y
    end

    return sum
end

local data = load_file(filename)
data = make_data_good(data)
local sum = run_task(data)

print("Sum:", sum)