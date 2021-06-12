# Python Examples

#remove duplicates

#i/p 
"""
Input: nums = [1,1,2]
Output: 2, nums = [1,2]
Explanation: Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the returned length.

Input: nums = [0,0,1,1,1,2,2,3,3,4]
Output: 5, nums = [0,1,2,3,4]
Explanation: Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively. It doesn't matter what values are set beyond the returned length.

"""

class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        start, end = 0, len(nums)-1
        while start < end :
            if nums[start] == nums[start +1] :
                nums.pop(start)
                start -= 1
                end -= 1
            start += 1
        return len(nums)


#remove elements

	"""
	Input: nums = [3,2,2,3], val = 3
	Output: 2, nums = [2,2]
	Explanation: Your function should return length = 2, with the first two elements of nums being 2.
	It doesn't matter what you leave beyond the returned length. For example if you return 2 with nums = [2,2,3,3] or nums = [2,2,0,0], your answer will be accepted.

	Input: nums = [0,1,2,2,3,0,4,2], val = 2
	Output: 5, nums = [0,1,4,0,3]
	Explanation: Your function should return length = 5, with the first five elements of nums containing 0, 1, 3, 0, and 4. Note that the order of those five elements can be arbitrary. It doesn't matter what values are set beyond the returned length.

	"""
	#sol 1 (36 ms)
	class Solution: 
	    def removeElement(self, nums: List[int], val: int) -> int:
	        start , end = 0 , len(nums) -1
	        while start <= end:
	            if nums[start] == val:
	                nums.pop(start)
	                start -=1
	                end -=1
	            start += 1
	        return len(nums)


	#sol 2 (28 ms)
	class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        while val in nums:
                nums.remove(val)
        return len(nums)


    #sol 3 (20 ms)
    class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        i = 0
        while True:
            try:
                if nums[i] == val:
                    del nums[i]
                else:
                    i += 1
            except:
                return i
