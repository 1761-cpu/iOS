# Student Card - HW1-Ex2

Hi Ms. Phượng, my name is **Võ Châu Anh**. This is my submission for HW1-Ex2 of the iOS Programming course.

This exercise asks to build a student card using SwiftUI that displays basic information about a student: Avatar, Name, Student ID, Age, GPA, and Student status. The card is placed on top of a custom background image, and the app also includes a bottom tab bar with three tabs — **Profile**, **Subjects**, and **Settings** — for future features.

### Screenshot
For the screenshots, aside from the ones attached below, you can also find them in *'Assets.xcassets'* as I uploaded them there directly from the simulator after finishing the code.

![App Screenshot: Profile Tab](https://github.com/1761-cpu/iOS/blob/main/week%201/HW1%20-%20Ex2/Ex2/Ex2/Assets.xcassets/simulator_screenshot_FC78D94E-1172-4391-9B3F-EEBE26B3BC0A.imageset/simulator_screenshot_FC78D94E-1172-4391-9B3F-EEBE26B3BC0A.png?raw=true)
![App Screenshot: Subjects Tab](https://github.com/1761-cpu/iOS/blob/main/week%201/HW1%20-%20Ex2/Ex2/Ex2/Assets.xcassets/simulator_screenshot_591D28EB-BB09-4716-B292-B12D57AD8F6E.imageset/simulator_screenshot_591D28EB-BB09-4716-B292-B12D57AD8F6E.png?raw=true)
![App Screenshot: Settings Tab](https://github.com/1761-cpu/iOS/blob/main/week%201/HW1%20-%20Ex2/Ex2/Ex2/Assets.xcassets/simulator_screenshot_54A0BF16-350A-45AB-BFB4-655D01CF7022.imageset/simulator_screenshot_54A0BF16-350A-45AB-BFB4-655D01CF7022.png?raw=true)

---

## Analyze & Reflect

**1. Which SwiftUI views did you use?**

I used `Text` for all the labels and values like the student name, motto, and numbers. I used `Image` for the background, the avatar, and the small icons inside each info row. I used `Button` for the "Edit Profile" button. I also created a custom sub-view called `InfoRow` to display each piece of information (icon + title + value) so I don't have to repeat the same code four times.

**2. Which layout containers did you use? Explain where each one is used.**

I used all three stacks:
*   **`ZStack`**: This is to layer the student card on top of the background image. I also used it inside the avatar section to place the image on top of the blue circular border.
*   **`VStack`**: This arranges the main content of the card from top to bottom — avatar first, then name and motto, then the 2×2 grid of info rows, and finally the "Edit Profile" button.
*   **`HStack`**: This places the icon and the text side by side inside each `InfoRow`. It's also used in the top row of the card to place two info rows next to each other (Student ID + Age, and GPA + Student status).

**3. What variables or constants did you define?**

*   `let studentName: String` (Constant, name doesn't change)
*   `let studentID: String` (Constant)
*   `var age: Int` (Variable, in case age needs updating later)
*   `var gpa: Double` (Variable, GPA can change each semester)
*   `let isStudent: Bool` (Constant)
*   `let motto: String` (Constant)
*   Inside the `InfoRow` struct, I used `let` for `icon`, `title`, `value`, and `iconColor`, and `var` for `valueColor` and `bgColor` because they have default values and can be customized when calling the row.

**4. Identify at least one modifier you used. Explain what it does.**

I used `.clipShape(Circle())` on the avatar image to cut it into a perfect circle. I also used `.background()` combined with `.cornerRadius()` to create the white card effect behind the main content and the pastel-colored boxes behind each info row, so they look like separate sections. `.padding()` adds space around elements so the UI doesn't look crowded. `.shadow()` gives the card a soft floating effect. Finally, `.font(.system(size:weight:design:))` lets me customize the text's size, boldness, and choose a rounded font style.

**5. What did you change or customize compared to the sample? Why?**

I customized the design by adding a custom background image ("bg 2") and my own avatar ("ava") to make the app look more lively. I also gave each info row a different pastel background color (blue, yellow, red, green) instead of the plain gray sample, so each piece of information stands out more and the card looks more colorful. Additionally is a preferred motto line under my name to give the profile a personal touch.

---

## Updates After Initial Submission

After the first version, I made some small improvements:

1. **Favorite Subject row**: Added a new "Favorite Subject" info row below GPA and Student status, so the card shows more personal information.

2. **Press animation for Edit Profile**: The "Edit Profile" button now changes color (blue → green) and scales down slightly when pressed, giving a small tactile feedback to the user.

3. **Accessibility labels**: Added `.accessibilityLabel()` to all icons inside `InfoRow` and to the avatar image, so VoiceOver can describe them properly for users with visual impairments.

![App Screenshot: Profile Tab_update1](<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-09-21 at 08 38 54" src="https://github.com/user-attachments/assets/1413d9ca-9619-4d6d-990e-c32b548fa3cc" />)
![App Screenshot: Profile Tab_update2](<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-09-21 at 08 39 34" src="https://github.com/user-attachments/assets/7370a3dc-2ed0-4039-811c-1743e8d71590" />)
