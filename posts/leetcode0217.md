---
title: LeetCode 217. Contains Duplicate
published_at: 2024-05-09T20:43:39.000Z
snippet: Array, Hash Table, Sorting
---

# [LeetCode 217. Contains Duplicate](https://leetcode.com/problems/contains-duplicate/description/)

<p>
  <a
    href="https://www.youtube.com/watch?v=qwL6oUj8GHA"
    rel="noopener noreferrer">
      <img
        src="https://img.youtube.com/vi/qwL6oUj8GHA/0.jpg"
        width="95%"
        alt="Link para o vídeo do YouTube">
  </a>
</p>

> Given an integer array `nums`, return `true` if any value appears **at least twice** in the array, and return `false` if every element is distinct.
>
> Example 1:
>
> > Input: nums = [1,2,3,1]
> >
> > Output: true
>
> Example 2:
>
> > Input: nums = [1,2,3,4]
> >
> > Output: false
> 
> Constraints:
> - 1 <= nums.length <= $10^5$
> - $-10^9$ <= nums[i] <= $10^9$


## Naïve solution

A simple way to solve this problem is to combine all the elements in pairs,
checking if they are equal to each other. For example, in the case of the
input [1,2,3,4], we take the element 1 and compare it with elements 2, 3,
and 4. Next, we take element 2 and compare it with elements 3 and 4 (note
that we don't need to compare it with element 1 because we have already done
this comparison).

The Python code looks like this:

```python
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        for i in range(len(nums)):
            for j in range(i + 1, len(nums), 1):
                if nums[i] == nums[j]:
                    return True
        return False
```

### Time complexity

For this algorithm, we have the following time complexity:

$$ (n - 1) + (n - 2) + (n - 3) + ... + 2 + 1 $$
$$ = \sum_{x = 1}^{n - 1} x $$
$$ = \frac{n * (n - 1)}{2} $$
$$ = \mathcal{O}(n^2) $$

### Space complexity

Since we do not use any extra memory, we have that the time complexity is $\mathcal{O}(1)$.

## Optimized solution

Considering that the input can have a size up to 100,000, the time complexity
of $\mathcal{O}(n^2)$ is not ideal. We can arrive at a second solution to this problem
using a [hash table](https://en.wikipedia.org/wiki/Hash_table). A hash table allows us
to insert and query values with time complexity $\mathcal{O}(1)$. Thus, to solve the
problem, we must traverse the input checking, for each element, if it exists in our
hash table. If it does not exist, we insert it into the table and move on to the
next element.

The Python code looks like this:

```python
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        map: Dict[int, bool] = {}
        for num in nums:
            if num in map:
                return True
            map[num] = True
        return False
```

### Time complexity

Considering the fact that insertion and query of values in the hash table is done in
time complexity $\mathcal{O}(1)$ and considering that in the worst case we need
to go through each of the elements of the input, we have that the time complexity
for this algorithm is $\mathcal{O}(n)$.

### Space complexity

Since in the worst case we need to insert each of the input elements into the hash
table, we have that the space complexity for this algorithm is $\mathcal{O}(n)$.
