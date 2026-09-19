# Lab 1 - Student Profile App

Hi Ms. Phượng, my name is **Võ Châu Anh**. This is my submission for Lab 1 of the iOS Programming course.

This lab asks to build a simple iOS app that displays basic information about a student using SwiftUI. The required info includes Name, Student ID, Age, GPA, and Student status. I also had to use `VStack`, `Text`, and some modifiers to style the layout.

### Screenshot
For the screenshot, aside from the one attached below, you can also find it in *'Assets.xcassets'* as I uploaded it there directly from the simulator after finishing the code.

![App Screenshot: Student Profile](https://github.com/1761-cpu/iOS/blob/main/week%201/lab%201/take%202/take%202/Assets.xcassets/simulator_screenshot_C4DAA60A-D7AA-4AF0-BC2B-E36418A5E4FA.imageset/simulator_screenshot_C4DAA60A-D7AA-4AF0-BC2B-E36418A5E4FA.png?raw=true)

---

## Notes

I did this lab **twice** before coming to what, to me, can be accepted as the final version to submit.

**Take 1 (bare minimum)** was my first attempt — I just stacked a gray person icon, a "Student Profile" title, and five plain `Text` lines inside a `VStack`. It worked and displayed all the required info, but it looked very plain and didn't really show off any styling.

**Take 2 (final submission)** is the version I'm submitting. Compared to Take 1, I made these changes:

*   Added a custom background image ("bg 2") and my own avatar ("ava") to make the app feel more me.
*   Replaced the plain `Text` lines with a reusable `InfoRow` sub-view, so each piece of information (icon + title + value) is neatly wrapped in its own gray rounded box.
*   Gave each row a matching colored icon (blue for personal info, green for student status) and made the "true" value green.
*   Used a monospaced bold font for the "Student Profile" title to make it stand out more.
*   Layered the avatar so it overlaps the top of the white card using `ZStack` and a negative bottom padding.

Take 2 took lots more time since it was my first actual effort getting exposed to SwiftUI, but I think the final result is quite acceptable, looks much cleaner and closer to what a real profile screen would look like.
