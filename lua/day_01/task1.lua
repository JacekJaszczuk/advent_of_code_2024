#!/usr/bin/env lua5.4

print("Day 1, task 1")
local filename = arg[1]
print("Filename: " .. filename)

local function load_file(filename)
    local left_list = {}
    local right_list = {}

    local f = assert(io.open(filename))
    for line in f:lines()
    do
        local left, right = line:match("(%d+)%s+(%d+)")
        table.insert(left_list, left)
        table.insert(right_list, right)
    end
    f:close()

    return left_list, right_list
end

local function run_task(left_list, right_list)
    local sum = 0

    table.sort(left_list)
    table.sort(right_list)

    for i = 1, #left_list, 1
    do
        sum = sum + math.abs(left_list[i] - right_list[i])
    end

    return sum
end

local left_list, right_list = load_file(filename)
local sum = run_task(left_list, right_list)

print("Sum:", sum)