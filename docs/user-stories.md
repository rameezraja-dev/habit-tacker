# User Story Template

**Title:**
_As a [user role], I want [feature/goal], so that [reason]._

**Acceptance Criteria:**
1. [Criteria 1]
2. [Criteria 2]
3. [Criteria 3]

**Priority:** [High/Medium/Low]

**Story Points:** [Estimated Effort in Points]

**Notes:**
- [Additional information or edge cases]

---

# Habit Tracker - User Stories

## Exercise 2: Login/Registration Page

### US-001: Account Registration

**Title:** Account Registration

**As a** new user,
**I want to** register with my name, username, age, and country,
**so that** I can create an account and access the habit tracking features.

**Acceptance Criteria:**
1. Registration form displays fields for name, username, age, and country
2. Form validation ensures all fields are filled
3. Country selection as a dropdown or picker
4. Submit button creates the account
5. Success message confirms registration
6. User is redirected to login page after registration

**Priority:** High

**Story Points:** 3

**Notes:**
- Age should accept values 13-120
- Username must be unique
- Fields are not saved in browser cache for security

---

### US-002: Account Login

**Title:** Account Login

**As a** user,
**I want to** log in using my username and password,
**so that** I can access my account and track my habits.

**Acceptance Criteria:**
1. Login form displays fields for username and password
2. Login button authenticates the user
3. Valid credentials redirect to homepage
4. Session is created upon successful login
5. User can access all habit tracking features after login

**Priority:** High

**Story Points:** 3

**Notes:**
- Due to security constraints, credentials are removed once the user logs out
- Default login may be available for testing

---

### US-003: Error Feedback on Login

**Title:** Error Feedback on Login

**As a** user,
**I want to** receive a message if I enter the wrong username or password,
**so that** I know my login attempt was unsuccessful.

**Acceptance Criteria:**
1. Error message displays when username is incorrect
2. Error message displays when password is incorrect
3. Error message is clear and user-friendly
4. User remains on login page after error
5. User can retry login after seeing error message

**Priority:** High

**Story Points:** 2

**Notes:**
- Avoid revealing which specific field is wrong for security

---

## Exercise 3: Homepage

### US-004: View Welcome Message

**Title:** View Welcome Message

**As a** logged-in user,
**I want to** see a personalized welcome message with my name on the homepage,
**so that** I feel recognized and can confirm I am logged into the correct account.

**Acceptance Criteria:**
1. Welcome message displays on homepage
2. Message includes the user's name
3. Message is personalized based on time of day (optional)
4. User feels greeted when opening the app

**Priority:** High

**Story Points:** 1

**Notes:**
- Consider adding time-based greetings (Good morning/afternoon/evening)

---

### US-005: Display Weekly Progress

**Title:** Display Weekly Progress

**As a** user,
**I want to** see my daily progress for each habit on the homepage,
**so that** I can easily monitor my progress.

**Acceptance Criteria:**
1. Progress display shows current day's completion status
2. Visual indicator shows completed vs pending habits
3. Progress is updated in real-time when habits are marked complete
4. User can see progress at a glance without navigating away

**Priority:** High

**Story Points:** 3

**Notes:**
- Consider using progress bars, charts, or completion percentages

---

### US-006: View Completed Habits

**Title:** View Completed Habits

**As a** user,
**I want to** see a section for completed habits on the homepage,
**so that** I can track what I have already achieved.

**Acceptance Criteria:**
1. Section displays list of completed habits
2. Shows date/time when each habit was completed
3. List is scrollable if many habits are completed
4. Completed habits are clearly distinguished from pending ones

**Priority:** Medium

**Story Points:** 2

**Notes:**
- Consider limiting to last 7 days or most recent 10 items

---

## Exercise 4: Menu

### US-007: Access Menu Options

**Title:** Access Menu Options

**As a** user,
**I want to** access a menu with options for configuring my habits, viewing reports, editing my profile, and signing out,
**so that** I can easily navigate to different parts of the app.

**Acceptance Criteria:**
1. Menu icon or button is accessible from homepage
2. Menu displays all navigation options
3. Menu is easy to open and close
4. Options are clearly labeled with icons (optional)

**Priority:** High

**Story Points:** 2

**Notes:**
- Menu can be a drawer, bottom nav, or floating menu

---

### US-008: Navigate to Profile

**Title:** Navigate to Profile

**As a** user,
**I want to** access my profile from the menu,
**so that** I can easily navigate to my profile page.

**Acceptance Criteria:**
1. Profile option is visible in menu
2. Tapping profile option navigates to profile page
3. User's profile information is displayed
4. User can return to previous page from profile

**Priority:** High

**Story Points:** 1

**Notes:**
- Profile option should be clearly visible in menu

---

### US-009: Navigate to Habits Page

**Title:** Navigate to Habits Page

**As a** user,
**I want to** access the habits page from the menu,
**so that** I can configure and manage my habits.

**Acceptance Criteria:**
1. Habits option is visible in menu
2. Tapping habits option navigates to habits page
3. User can view all their habits
4. User can add, edit, or delete habits from this page

**Priority:** High

**Story Points:** 1

**Notes:**
- This is the main page for habit management

---

### US-010: Sign Out from Menu

**Title:** Sign Out from Menu

**As a** user,
**I want to** sign out of my account using an option in the menu,
**so that** I can securely log out when I'm finished using the app.

**Acceptance Criteria:**
1. Sign out option is visible in menu
2. Confirmation dialog appears before signing out
3. Session is cleared upon sign out
4. User is redirected to login page after sign out

**Priority:** High

**Story Points:** 1

**Notes:**
- Always require confirmation before signing out

---

## Exercise 5: Profile Page

### US-011: View Personal Information

**Title:** View Personal Information

**As a** user,
**I want to** view my saved name, username, age, and country on my profile page,
**so that** I can see the details I provided during registration.

**Acceptance Criteria:**
1. Profile page displays name field
2. Profile page displays username field
3. Profile page displays age field
4. Profile page displays country field
5. All fields show the saved values

**Priority:** High

**Story Points:** 1

**Notes:**
- Read-only display by default

---

### US-012: Edit Personal Information

**Title:** Edit Personal Information

**As a** user,
**I want to** update my name, username, age, and country on my profile page,
**so that** I can keep my information up to date.

**Acceptance Criteria:**
1. Edit button is available on profile page
2. Fields become editable when edit mode is activated
3. Age field validates input (13-120)
4. Username uniqueness is validated
5. User can cancel edits without saving

**Priority:** High

**Story Points:** 2

**Notes:**
- Consider inline editing or separate edit screen

---

### US-013: Save Updated Information

**Title:** Save Updated Information

**As a** user,
**I want the** changes I make to my profile to be saved,
**so that** my updated details are stored and reflected throughout the app.

**Acceptance Criteria:**
1. Save button is available after editing
2. Changes are saved to local storage or database
3. Success message confirms save
4. Updated values persist across app restarts

**Priority:** High

**Story Points:** 2

**Notes:**
- Validate all fields before saving

---

### US-014: Update Name in Header

**Title:** Update Name in Header

**As a** user,
**I want my** updated name to be displayed in the app's header after I change it in the profile,
**so that** my changes are immediately visible.

**Acceptance Criteria:**
1. Header updates automatically after name is changed
2. Header displays new name without requiring app restart
3. Welcome message reflects the new name
4. Change is visible on homepage and other relevant screens

**Priority:** Medium

**Story Points:** 1

**Notes:**
- Requires reactive state management

---

## Exercise 6: Habits Page

### US-015: Add a New Habit

**Title:** Add a New Habit

**As a** user,
**I want to** add new habits on the details configuration page,
**so that** I can manage and update my habits as needed.

**Acceptance Criteria:**
1. Add button is visible on habits page
2. Form displays fields for habit details
3. User can set habit name and description
4. User can set frequency (daily, weekly, etc.)
5. Habit is saved after submission
6. New habit appears in habits list

**Priority:** High

**Story Points:** 3

**Notes:**
- Consider adding category, reminder time, and other attributes

---

### US-016: Delete a Habit

**Title:** Delete a Habit

**As a** user,
**I want to** delete existing habits,
**so that** I can keep my habits up to date.

**Acceptance Criteria:**
1. Delete option is available for each habit
2. Confirmation dialog appears before deletion
3. Habit is removed from the list after confirmation
4. Deleted habit no longer appears in progress tracking

**Priority:** High

**Story Points:** 2

**Notes:**
- Consider soft delete for data recovery

---

### US-017: Personalize a Habit with Color

**Title:** Personalize a Habit with Color

**As a** user,
**I want to** assign a specific color to each habit,
**so that** it is personal to me.

**Acceptance Criteria:**
1. Color picker is available when adding/editing a habit
2. User can select from predefined colors
3. Selected color displays on habit items
4. Color persists across app sessions

**Priority:** Medium

**Story Points:** 2

**Notes:**
- Provide 5-8 color options

---

## Exercise 7: Reports Page

### US-018: View Weekly Reports

**Title:** View Weekly Reports

**As a** user,
**I want to** see a report of my weekly habit progress,
**so that** I can understand how well I am maintaining my habits.

**Acceptance Criteria:**
1. Reports page displays weekly overview
2. Shows completion rate for the week
3. Displays habit-by-habit breakdown
4. User can navigate between weeks (optional)

**Priority:** High

**Story Points:** 3

**Notes:**
- Consider adding filter by date range

---

### US-019: Visualize Completed Habits

**Title:** Visualize Completed Habits

**As a** user,
**I want to** see a chart of my completed habits for each day of the week,
**so that** I can quickly identify trends in my progress.

**Acceptance Criteria:**
1. Chart displays completion for each day
2. Visual representation (bar chart, line graph, etc.)
3. Shows 7 days of data
4. Chart updates when new habits are completed

**Priority:** High

**Story Points:** 3

**Notes:**
- Use a charting library for visualization

---

### US-020: View All Habits

**Title:** View All Habits

**As a** user,
**I want to** see both completed and incomplete habits in my report,
**so that** I have a comprehensive view of my habit tracking performance.

**Acceptance Criteria:**
1. List shows all habits for the selected period
2. Completed habits are marked with checkmark or completed status
3. Incomplete habits are clearly distinguished
4. User can filter between completed and incomplete (optional)

**Priority:** Medium

**Story Points:** 2

**Notes:**
- Consider adding filter functionality

---

## Exercise 8: Notifications Page

### US-021: Enable/Disable Notifications

**Title:** Enable/Disable Notifications

**As a** user,
**I want to** be able to enable or disable notifications for the app,
**so that** I can choose whether or not to receive reminders for my habits.

**Acceptance Criteria:**
1. Toggle switch controls notification settings
2. When disabled, no notifications are sent
3. When enabled, notifications are sent according to schedule
4. Setting persists across app restarts

**Priority:** High

**Story Points:** 2

**Notes:**
- Master toggle for all notifications

---

### US-022: Add Habits for Notifications

**Title:** Add Habits for Notifications

**As a** user,
**I want to** select specific habits to receive notifications for,
**so that** I only get reminders for the habits I am actively working on.

**Acceptance Criteria:**
1. List displays all user habits
2. User can check/uncheck habits for notifications
3. Selected habits have notifications enabled
4. Selection persists across app restarts

**Priority:** High

**Story Points:** 2

**Notes:**
- Multi-select functionality

---

### US-023: Set Notification Times

**Title:** Set Notification Times

**As a** user,
**I want to** have the option to receive notifications three times a day (morning, afternoon, evening) for all selected habits,
**so that** I get timely reminders throughout the day to complete my habits.

**Acceptance Criteria:**
1. User can select morning notification time (e.g., 8:00 AM)
2. User can select afternoon notification time (e.g., 2:00 PM)
3. User can select evening notification time (e.g., 7:00 PM)
4. Default times are provided but user can customize
5. Notifications are sent at selected times
6. User can enable/disable each time slot independently

**Priority:** High

**Story Points:** 3

**Notes:**
- Morning: 5:00 AM - 12:00 PM
- Afternoon: 12:00 PM - 5:00 PM
- Evening: 5:00 PM - 10:00 PM

---

## Labels

Apply the following labels to user story issues:

| Label | Description |
|-------|-------------|
| enhancement | Adding new features or functionality |
| bug | Fixing errors or issues |
| documentation | Writing or updating documentation |
| question | Clarifications or open questions |
| priority: high | High priority items |
| priority: medium | Medium priority items |
| priority: low | Low priority items |

---

## Priority Summary

| Priority | User Stories |
|----------|--------------|
| High | US-001, US-002, US-003, US-004, US-005, US-007, US-008, US-009, US-010, US-011, US-012, US-013, US-015, US-016, US-018, US-019, US-021, US-022, US-023 |
| Medium | US-006, US-014, US-017, US-020 |
| Low | - |

---

## Story Points Summary

| Feature Area | Total Points |
|---------------|---------------|
| Authentication | 8 |
| Homepage | 6 |
| Menu | 5 |
| Profile | 6 |
| Habits | 7 |
| Reports | 8 |
| Notifications | 7 |
| **Total** | **47 |