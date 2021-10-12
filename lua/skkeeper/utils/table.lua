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
        if not tableUtils.contains(newArray, element) then
            table.insert(newArray, element)
        end
    end
    return newArray
end

tableUtils.map = function(tbl, f)
    local t = {}
    for k,v in pairs(tbl) do
        t[k] = f(v)
    end
    return t
end

return tableUtils
