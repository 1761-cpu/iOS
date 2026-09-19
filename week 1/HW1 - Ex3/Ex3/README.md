# My Daily Planner App - HW1_Ex3

Hi Ms.Phượng, my name is **Võ Châu Anh**. This is my submission for HW1_Ex3 of the iOS Programming course. 

This exercise asks to build a simple daily planner app using SwiftUI that will allow users to view their daily tasks, add new tasks, and mark tasks as completed. This app also contains a bottom tab bar with two extra tabs beside the main 'Today' one - Stats & Settings - for future features.

### Screenshots
For the screenshots, aside from the ones attached below, you can also find them in *'Assets.xcassets'*  too as I uploaded there directly from the simulator when finishing the code.
![App Screenshot: Today Tab](https://github.com/user-attachments/assets/2f94e2ed-98d6-48c9-a3dc-a3d6ddde94fb)
![App Screenshot: Stats Tab](https://github.com/user-attachments/assets/00049e59-9711-4790-8b24-26cb7ce7bfd7)
![App Screenshot: Settings Tab](https://github.com/user-attachments/assets/1ba22646-31bb-4efa-a253-3e2eff16323c)

---

## Analyze & Reflect

**1. Which SwiftUI views did you use?**

I used `Text` to display all the words, like the greeting, task titles, and dates. I used `Image` for the app icons, the background, the user avatar. I used `Button` for the "Add Task" button and the checkboxes. Additionally, I used a `ScrollView` so the user can scroll through the list of tasks if it gets long.

**2. Which stacks did you use? Explain where.**

I used all three stacks:
*   **`ZStack`**: This is to layer the main UI on top of the background image, and also to place the text and icon on top of the white card backgrounds.
*   **`VStack`**: This is for arranging the main sections from top to bottom (as in UI: Header tab -> Date -> Task list). It's also used inside the task row to stack the title and category vertically.
*   **`HStack`**: This one is mainly for the task rows to place the checkbox, icon, title, and time side-by-side. I also had it in the header for the greeting and the date section.

**3. What variables or constants did you define?**

*   `let userName: String` (Constant)
*   `let quote: String` (Constant)
*   `@State private var tasks: [Task]` (Variable, because the array changes when we add tasks or toggle them)
*   `@State private var newTaskCount: Int` (Variable)
*   Inside the `Task` struct, I used `var` for `title`, `category`, `isCompleted`, and `time` because they can change. I used `let` for `id = UUID()` because the ID should never change.

**4. Identify at least one modifier you used. Explain what it does.**

I used `.clipShape(Circle())` on the avatar image to make it perfectly round. There are also `.background()` and `.cornerRadius()` for creating the white card effect for the tasks and header, so they look neat and separated from the background. `.padding()` was used to add space between elements so the UI doesn't look too crowded.

**5. What did you change or customize compared to the sample? Why?**

I customized the design by adding a custom background image ("bg 2") and the user avatar ("ava") to make the app look more alive and personal, and changed to a rounded font design for some of the text, such as name and greeting, to have a friendlier and more modern look. The "My Tasks" title was placed into a blue box to make it stand out more since my background might make it hard to see plain text. I also replaced the motivational quotes with my chosen ones, aligning with my preferences.

