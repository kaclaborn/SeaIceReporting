# Calculating a string distance for each article in corpus to every other article in corpus

using StringDistances
using DelimitedFiles
using DataFrames

# import data
data, header = readdlm("data/corpus/ADN_identifyduplicates_20220408.csv", ',', header = true)
ADN = DataFrame(data, vec(header))

# define function
function stringDist(start, stop)
filename = []
check = []
    for i in start:stop
        filename = push!(filename, string("text", ADN[i,1]))
        check = push!(check, findall(ADN[i,2], ADN[:,2], Levenshtein()))
    end
    return filename, check
end

# run function across full list of articles (some of which may be duplicates)
output = stringDist(1, 1423)

# export to csv
writedlm("checkduplicates.csv", output[2], ',')
writedlm("checkduplicates.csv", output[1], ',')
