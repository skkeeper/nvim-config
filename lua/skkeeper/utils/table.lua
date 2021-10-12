local tableUtils = {}

tableUtils.contains = function(arr, element)
    for _, value in ipairs(arr) do
        if value == element then
            return true
        end
    end
    return false
end

tableUtils.removeDuplicates = function(arr)
    local newArray = {}
    for _, element in ipairs(arr) do
        if not tableUtils.inArray(newArray, element) then
            table.insert(newArray, element)
        end
    end
    return newArray
end

return tableUtils
