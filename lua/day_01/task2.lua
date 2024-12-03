#!/usr/bin/env lua5.4

print("Day 1, task 2")
local filename = arg[1]
print("Filename: " .. filename)

local function load_file(filename)
    local left_list = {}
    local score = {}

    local f = assert(io.open(filename))
    for line in f:lines()
    do
        local left, right = line:match("(%d+)%s+(%d+)")
        left = tonumber(left)
        right = tonumber(right)

        table.insert(left_list, left)
        score[right] = (score[right] or 0) + 1
    end
    f:close()

    return left_list, score
end

local function run_task(left_list, score)
    local sum = 0

    for i = 1, #left_list, 1
    do
        sum = sum + left_list[i] * (score[left_list[i]] or 0)
    end

    return sum
end

local left_list, score = load_file(filename)
local sum = run_task(left_list, score)

print("Sum:", sum)