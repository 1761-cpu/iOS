# Student Card - HW1-Ex1

Hi Ms. Phượng, my name is **Võ Châu Anh**. This is my submission for HW1-Ex1 of the iOS Programming course.

This exercise asks to build a student card using SwiftUI that displays basic information about a student: Avatar, Name, Student ID, GPA, and a status badge. The card is placed on top of a custom background image. The main goal is to practice using `HStack` and `ZStack` to arrange the layout.

### Screenshot
For the screenshot, aside from the one attached below, you can also find it in *'Assets.xcassets'* as I uploaded it there directly from the simulator after finishing the code.

![App Screenshot: Student Card](https://github.com/1761-cpu/iOS/blob/main/week%201/HW1%20-%20Ex1/HW1%20-%20Ex1/Assets.xcassets/simulator_screenshot_315278B2-3166-41C3-A54D-7164E17E2B02.imageset/simulator_screenshot_315278B2-3166-41C3-A54D-7164E17E2B02.png?raw=true)

---

## Analyze & Reflect

**1. Which SwiftUI views did you use?**

I used `Text` to display the student name, student ID, and GPA. I used `Image` for the background and the avatar. I also created a custom sub-view called `StatusBadge` to display the "Active" badge. Inside the avatar section, I used `Circle` to create the blue circular border behind the image.

**2. Which layout containers did you use? Explain where each one is used.**

I used all three stacks:
*   **`ZStack`**: This is to layer the white card on top of the background image, and to place the avatar image on top of the blue circle border for avatar session.
*   **`VStack`**: This arranges the text information vertically (name, student ID, GPA) inside the card.
*   **`HStack`**: This places the avatar and the text information side by side. It's also used in the top row to put the student name on the left and the "Active" badge on the right.

**3. What variables or constants did you define?**

*   `let studentName: String` (Constant, the name doesn't change)
*   `let studentID: String` (Constant)
*   `var gpa: Double` (Variable, in case GPA needs to be updated later)
*   `let isActive: String` (Constant, used for the badge text)
*   Inside the `StatusBadge` struct, I used `let text: String` to receive the badge text from the parent view.

**4. Identify at least one modifier you used. Explain what it does.**

I used `.clipShape(Circle())` on the avatar image to cut it into a perfect circle. There are also the used of `.background()` combined with `.cornerRadius()` to create the white card effect and the green badge background. `.shadow()` adds a soft shadow behind the card to make it look like it's floating on top of the sea-ish background. `.padding()` adds space around elements so the UI doesn't feel crowded. Additionally, `.font(.headline)`, `.bold()`, and `.italic()` were used to style the text differently for each piece of information.

**5. What did you change or customize compared to the sample? Why?**

I customized the design by adding a custom background image ("bg 2") and my own avatar ("ava") to make the app look more of my own. I made the student ID italic to make it visually different from the name, and bolded the GPA value so it stands out more. My avatar bodered with a blue circular to give it a pop of color against the white card while matching the background aesthetic.

---

## Updates After Initial Submission

After the first version uploaded directly from Xcode to here, I made some small improvements, mostly regarding the UI:

1. **View Details button**: Added a "View Details" button at the bottom of the card. When pressed, it currently does nothing, but it makes the card feel more like a real profile screen and leaves room for future features.

2. **Gradient avatar border**: I replaced the plain blue circle border around the avatar with an `AngularGradient` so that the avatar stands out more and, at the same time, gives the card a more modern look.

3. **Accessibility labels**: The `.accessibilityLabel()` added to the avatar image so VoiceOver can describe them properly for users with visual impairments.
![App Screenshot: Student Card_Updating](<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-09-21 at 08 34 31" src="https://github.com/user-attachments/assets/13af8623-edff-4646-8135-2ebfe1c35567" />)
