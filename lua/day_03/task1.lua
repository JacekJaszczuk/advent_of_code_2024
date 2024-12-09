#!/usr/bin/env lua5.4

print("Day 3, task 1")
local filename = arg[1]
print("Filename: " .. filename)

local function load_file(filename)
    local data = {}

    local f = assert(io.open(filename))
    data = f:read("a")
    f:close()

    return data
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
local sum = run_task(data)

print("Sum:", sum)