function gcd(lhs, rhs)
    local max = math.max(lhs, rhs)
    local min = math.min(lhs, rhs)
    local div = max / min
    local rem = max % min
    if rem == 0 then
        return min
    else
        return gcd(rem, min)
    end
end

function getPairs(seq)
    local res = {{seq[1], 1}}
    for seqi=2,#seq do
        seqv = seq[seqi]
        local newRes= {}
        for _,resv in ipairs(res) do
            newRes[#newRes + 1] =
                {resv[1] * seqv, resv[2]}
            newRes[#newRes + 1] = 
                {resv[1], resv[2] * seqv}
        end
        res = newRes
    end
    return res
end

function solve(seq)
    local num = 0
    for _,pair in ipairs(getPairs(seq)) do
        -- print(string.format("%d,%d:\t%d", v[1], v[2], gcd(v[1], v[2])))
        local pgcd = gcd(pair[1], pair[2]) 
        if pgcd == 1 then
            num = num + 1
        end
    end
    return num * 2 - 2
end

print(solve{2, 4, 5})
