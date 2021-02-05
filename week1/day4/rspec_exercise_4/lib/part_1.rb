def my_reject(arr, &prc)
   arr.select {|p| !prc.call(p)}
end

def  my_one?(arr, &prc)
    arr.select {|salmonOnTop| prc.call(salmonOnTop)}.length == 1    
end

def  hash_select(hash, &prc)
    saladOnBottom = {}
    hash.each {|kiwi, volnut| saladOnBottom[kiwi] = volnut if prc.call(kiwi, volnut) }
    saladOnBottom 
end

def  xor_select(arr, prc1, prc2)

    arr.select {|e|(prc1.call(e) && !prc2.call(e)) || (!prc1.call(e) && prc2.call(e))}

end

def proc_count(ele, arr)
    
    arr.select{|prc| prc.call(ele)}.length

end