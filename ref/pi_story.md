https://www.reddit.com/r/oddlysatisfying/comments/17dif1m/comment/k5y7s8i/?share_id=myKxqqS_5fsqgfMwXrXM7&utm_content=2&utm_medium=android_app&utm_name=androidcss&utm_source=share&utm_term=1

https://www.youtube.com/watch?v=tuR5NI-bvu8

I wrote this explanation of what's happening over at r/theydidthemath, might as well put it here:

What exactly are we looking at?
We have two rods of the same length, the inner one attached to a fixed point and the outer one attached to the other end of the inner one.
Both of those rods rotate around their attachment points, but at different rates. But those rates are each constant, so neither rotation accelerates or slows down. Clearly, the inner rod rotates slower than the outer one.
The other end of the outer rod then draws a curved line across the plane as both rods are rotating.

How does that match up with the formula?
The formula has two parts which correspond to the two rods. The first one, eθi, is represented by the slow-rotating inner rod while the second part, eπθi represents the faster rotating outer rod.
Without going into complex numbers, suffice to say that both of these taken individually would just describe a circle on the complex plane. The only difference is how "quickly" that circle would be drawn, i.e. how much θ do we need to get a full circle. That's π times quicker for the outer rod.
The exact details on why or how those describe circles doesn't really matter here, but one aspect of it does:
This circle drawing is repeating in nature as θ keeps increasing. Think of it this way: If you turn 450° = 90° + 360°, you end up looking the same way as if you'd turned just 90°. If you turn another 360°, you end up facing the same way again. And so on. As you increase the angle, you'll just end up where you've already been. That's what happens here as θ keeps getting ever larger.
If each of the formula parts were individual rods, attached to a fixed point, they'd just draw the same circles at different speeds over themselves all the time.
But by adding both together, we basically attach the two rods to one another, resulting in what we see here: Each rod's individual motion is still circular, but their combination gives this much more interesting pattern.

How does that show that pi is irrational and what does that even mean?
π or "pi" is a mathematical constant related to the circumference (and other properties) of a circle. But that's just coincidental here, you'd get a similar effect with any non-circle related irrational number.
pi is roughly equal to 3.14159265359... .
And that "..." is the key: It doesn't stop having decimal digits. It also doesn't ever start to repeat.
That is a key characteristic of an irrational number: It has infinitely many non-repeating decimal places. As opposed to a rational number which either terminates (e.g. 9/4 = 2.25) or eventually repeats (5/6 = 0.8333...).
Importantly, every rational number can be expressed as the division of two integers - irrational numbers cannot. That's what makes them irrational (= not a ratio).

Back to our animation
Let's replace pi by a variable x for a moment: eθi + exθi
For the two ends of the figure to match up perfectly, x has to be a number such that both parts of the formula are eventually back to a previous value (= both rods are at identical rotation angles).
For example, if x=3, that near miss at 0:12 in the animation would be a hit and the figure would already be complete there.
But x isn't 3, it's pi = 3.1459... - so the inner rod has already turned a tad further than it should have. So they don't match up.
You can see that at that moment, the inner rod has done one full rotation and the other one has done just a tad more than 3 full rotations. It's a near miss because that 3/1 = 3 is close to pi.
Then at 48 seconds, we have another near miss, even closer. At that point, the inner rod has done 7 rotations, the outer just under 22. That gives us 22/7 = 3.1428... . If x had been 22/7, we'd have a full match here. But it isn't while 22/7 is very close to pi, it's not quite it.
The very last close call is at 355/113 (if you're bored, feel free to count the rotations), a famously good approximation for pi - but still just an approximation, not an exact match.
If we could ever get to such a fraction for (outer rotation / inner rotations) = pi, the figure would close up perfectly.
But we won't. Ever. As explained above, pi is irrational. That means there are no two integers for which (a / b) = pi. It never happens.
You will get a lot of close calls but you can always zoom in far enough that you see that there's ultimately a mismatch.