def bubble_sort(lst):
    x, y, l = 0, 1, len(lst)
    flipped = False
    
    while y < l:
        if lst[x] > lst[y]:
            lst[x], lst[y] = lst[y], lst[x]
            flipped = True
        
        x = y
        y += 1
        
    if flipped:
        return bubble_sort(lst)
            
    return lst
    
# Written using the pseudocode found here: 
# https://en.wikipedia.org/wiki/Bubble_sort#Optimizing_bubble_sort
# for reference
def optimized_bubble_sort(lst,step=0):
    x, y, l = 0, 1, len(lst) - step
    flipped = False
    
    while y < l:
        if lst[x] > lst[y]:
            lst[x], lst[y] = lst[y], lst[x]
            flipped = True
        
        x = y
        y += 1
        
    if flipped:
        step += 1
        return optimized_bubble_sort(lst, step)
    
    return lst
